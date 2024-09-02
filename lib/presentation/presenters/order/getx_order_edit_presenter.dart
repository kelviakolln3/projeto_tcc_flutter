import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxOrderEditPresenter extends GetxController with LoadingManager implements OrderEditPresenter {
  final FindOrder findOrder;
  final EditOrder editOrder;
  final String idPedido;

  GetxOrderEditPresenter({required this.findOrder, required this.editOrder, required this.idPedido});

  final _order = Rx<OrderViewModel?>(null);
  final _editError = Rx<String?>(null);
  final _custumerError = Rx<String?>(null);
  final _conditionPaymentError = Rx<String?>(null);
  final _formPaymentError = Rx<String?>(null);
  final _itemOrderError = Rx<List<dynamic>>([]);

  String? _idPedido;
  String? _custumer;
  String? _user;
  String? _dateCreation;
  String? _conditionPayment;
  String? _formPayment;
  String? _total;
  List<ItemPedidoEntity> _itemPedidoBeans = [];

  @override
  Stream<OrderViewModel?> get orderStream => _order.stream;
  @override
  Stream<String?> get editErrorStream => _editError.stream;
  @override
  Stream<String?> get custumerErrorStream => _custumerError.stream;
  @override
  Stream<String?> get conditionPaymentErrorStream => _conditionPaymentError.stream;
  @override
  Stream<String?> get formPaymentErrorStream => _formPaymentError.stream;
  @override
  Stream<List<dynamic>> get itemOrderErrorStream => _itemOrderError.stream;

  @override
  Future<void> edit() async {
    try {
      _editError.value = null;
      if (_custumer != null || _user != null || _dateCreation != null || _conditionPayment != null || _formPayment != null || _total != null || _itemPedidoBeans.isNotEmpty) {
        isLoading = true;
        var dateCreationSplit = _dateCreation!.split('/'); 
        final order = await editOrder.edit(EditOrderParams(
          idPedido: int.parse(_idPedido!),
          idCliente: int.parse(_custumer!),
          idUsuario: int.parse(_user!),
          dataCriacao: "${dateCreationSplit[2]}-${dateCreationSplit[1]}-${dateCreationSplit[0]}",
          condicaoPagamento: _conditionPayment!,
          formaPagamento: _formPayment!,
          total: double.parse(_total!),
          itemPedidoBeans: _itemPedidoBeans.map((item) => EditItemOrderParams(
            idItemPedido: item.idItemPedido!,
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
    _editError.value = null;
    _order.value = null;
    isLoading = true;
    final order = await findOrder.find(int.parse(idPedido));
    if(order != null){
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

      _idPedido = order.idPedido.toString();
      _custumer = order.idCliente.toString();
      _user = order.idUsuario.toString();
      _dateCreation = order.dataCriacao;
      _conditionPayment = order.condicaoPagamento;
      _formPayment = order.formaPagamento;
      _total = order.total.toString();
      _itemPedidoBeans = order.itemPedidoBeans;
    }
  }

  @override
  void validateCustumer(String? custumer) {
    _custumerError.value = null;
    _custumer = custumer;
    if(_custumer! == '0') _custumerError.value = "Informe um cliente valido";
  }

  @override
  void validateConditionPayment(String? conditionPayment) {
    _conditionPaymentError.value = null;
    _conditionPayment = conditionPayment;
    if(_conditionPayment == null) _conditionPaymentError.value = "Informe uma condição de pagamento";
  }
  
  @override
  void validateFormPayment(String? formPayment) {
    _formPaymentError.value = null;
    _formPayment = formPayment;
    if(_formPayment == null) _formPaymentError.value = "Informe uma forma de pagamento";
  }
}