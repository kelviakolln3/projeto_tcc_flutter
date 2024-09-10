import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxOrderEditPresenter extends GetxController with LoadingManager implements OrderEditPresenter {
  final FindOrder findOrder;
  final EditOrder editOrder;
  final DeleteItemOrder deleteItemOrder;
  final String idPedido;

  GetxOrderEditPresenter({required this.findOrder, required this.editOrder, required this.deleteItemOrder, required this.idPedido});

  final _order = Rx<OrderViewModel?>(null);
  final _editError = Rx<String?>(null);
  final _productError = Rx<String?>(null);
  final _amountError = Rx<String?>(null);
  final _unitValueError = Rx<String?>(null);
  final _itensOrder = Rx<List<ItemPedidoViewModel>>([]);
  final _total = Rx<double>(0);

  String? _idPedido;
  String? _custumer;
  String? _user;
  String? _dateCreation;
  String? _conditionPayment;
  String? _formPayment;
  
  String? _product;
  String? _amount;
  String? _unitValue;

  @override
  Stream<OrderViewModel?> get orderStream => _order.stream;
  @override
  Rx<List<ItemPedidoViewModel>> get itensOrder => _itensOrder;
  @override
  Stream<String?> get editErrorStream => _editError.stream;
  @override
  Stream<String?> get productErrorStream => _productError.stream;
  @override
  Stream<String?> get amountErrorStream => _amountError.stream;
  @override
  Stream<String?> get unitValueErrorStream => _unitValueError.stream;
  @override
  Stream<double> get totalStream => _total.stream;
  

  @override
  Future<void> edit() async {
    try {
      _editError.value = null;
      if (_custumer != null || _user != null || _dateCreation != null || _conditionPayment != null || _formPayment != null || _total != 0 || _itensOrder.value != []) {
        isLoading = true;
        final order = await editOrder.edit(EditOrderParams(
          idPedido: int.parse(_idPedido!),
          idCliente: int.parse(_custumer!),
          idUsuario: int.parse(_user!),
          dataCriacao: DateFormat('yyyy-MM-dd').format(DateTime.parse(_dateCreation!)),
          condicaoPagamento: _conditionPayment!,
          formaPagamento: _formPayment!,
          total: _total.value,
          itemPedidoBeans: _itensOrder.value.map((item) => EditItemOrderParams(
            idItemPedido: item.idItemPedido,
            idProduto: item.idProduto,
            quantidade: item.quantidade,
            valorUnitario: item.valorUnitario,
          )).toList(),
        ));
        if (order!.idPedido != null) {
          isLoading = false;
          Get.back();
        }
      } else {
        _editError.value = 'Preencha todos os campos';
      }
    } on DomainError {
      _editError.value = 'Erro inesperado \n tente novamente';
    }
  }
  
  @override
  Future<void> find() async{
   try {
    _editError.value = null;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); 
    final order = await findOrder.find(int.parse(idPedido));
    if(order != null){

      _idPedido = order.idPedido.toString();
      _custumer = order.idCliente.toString();
      _user = order.idUsuario.toString();
      _dateCreation = order.dataCriacao;
      _conditionPayment = order.condicaoPagamento;
      _formPayment = order.formaPagamento;
      _total.value = order.total;
      _itensOrder.value = order.itemPedidoBeans.map((item) => ItemPedidoViewModel(
          idItemPedido: item.idItemPedido,
          idProduto: item.idProduto,
          quantidade: item.quantidade,
          valorUnitario: item.valorUnitario,
        )).toList();

      _order.value = OrderViewModel(
        idCliente: order.idCliente, 
        idUsuario: order.idUsuario, 
        dataCriacao: order.dataCriacao, 
        condicaoPagamento: order.condicaoPagamento, 
        formaPagamento: order.formaPagamento, 
        total: order.total, 
        itemPedidoBeans: order.itemPedidoBeans.map((item) => ItemPedidoViewModel(
          idItemPedido: item.idItemPedido,
          idProduto: item.idProduto,
          quantidade: item.quantidade,
          valorUnitario: item.valorUnitario,
        )).toList(),
      );
    }
   }on DomainError {
      _editError.value = 'Não foi possível buscar os dados do pedido \n tente novamente';
    }finally {
      isLoading = false;
    }
  }

  @override
  void addItemOrder(){
    if(_product != null || _amount != null || _unitValue != null) {
      final item = ItemPedidoViewModel(
        idProduto: int.parse(_product!),
        quantidade: double.parse(_amount!),
        valorUnitario: double.parse(_unitValue!.replaceAll(',', '.'))
      );
      final updatedList = [..._itensOrder.value, item];
      _itensOrder.value = updatedList;
    } else {
      _editError.value = 'Preencha todos os campos do item do pedido';
    }
    _product == null; 
    _amount == null; 
    _unitValue == null;
    calculateTotal();
  }

  @override
  void calculateTotal(){
    _total.value = 0;
    for (var item in _itensOrder.value) {
      _total.value += item.quantidade *  item.valorUnitario;
    }
  }

  @override
  void removeItemOrder(ItemPedidoViewModel item) {

    if(item.idItemPedido != null) {
      deleteItemOrder.delete(item.idItemPedido!);
    }
    final updatedList = _itensOrder.value.where((i) => i != item).toList();
    _itensOrder.value = updatedList;
    calculateTotal();
  }

  @override
  void validateConditionPayment(String? conditionPayment) {
    _conditionPayment = conditionPayment;
  }
  
  @override
  void validateFormPayment(String? formPayment) {
    _formPayment = formPayment;
  }
  
  @override
  void validateProduct(String? product) {
    _productError.value = null;
    _product = product;
    if(_product! == '0') _productError.value = "Informe um produto valido";
  }

  @override
  void validateAmount(String? amount) {
    _amountError.value = null;
    _amount = amount;
    if(_amount! == '0') _amountError.value = "Informe uma quantidade valida";
  }

  @override
  void validateUnitValue(String? unitValue) {
    _unitValueError.value = null;
    _unitValue = unitValue;
    if(_unitValue! == '0') _unitValueError.value = "Informe um valor unitário valido";
  }
}