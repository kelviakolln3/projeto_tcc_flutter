import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../domain/domain.dart';
import '../../../session.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxOrderCreatePresenter extends GetxController with LoadingManager implements OrderCreatePresenter {
  final CreateOrder createOrder;

  GetxOrderCreatePresenter({required this.createOrder});

  final _createError = Rx<String?>(null);
  final _custumerError = Rx<String?>(null);
  final _itemOrderError = Rx<List<dynamic>>([]);
  final _productError = Rx<String?>(null);
  final _amountError = Rx<String?>(null);
  final _unitValueError = Rx<String?>(null);
  final _itensOrder = Rx<List<CreateItemOrderParams>>([]);
  final _total = Rx<double>(0);

  String? _custumer;
  String? _conditionPayment;
  String? _formPayment;
  String? _product;
  String? _amount;
  String? _unitValue;

  @override
  Stream<String?> get createErrorStream => _createError.stream;
  @override
  Stream<String?> get custumerErrorStream => _custumerError.stream;
  @override
  Stream<String?> get productErrorStream => _productError.stream;
  @override
  Stream<String?> get amountErrorStream => _amountError.stream;
  @override
  Stream<String?> get unitValueErrorStream => _unitValueError.stream;
  @override
  Stream<List<CreateItemOrderParams>> get itensOrderStream => _itensOrder.stream;
  @override
  Stream<List<dynamic>> get itemOrderErrorStream => _itemOrderError.stream;
  @override
  Stream<double> get totalStream => _total.stream;

  @override
  Future<void> create() async {
    try {
      _createError.value = null;
      if(_custumer != null || _conditionPayment != null || _formPayment != null) {
        isLoading = true;
        calculateTotal();
        final order = await createOrder.create(CreateOrderParams(
          idCliente: int.parse(_custumer!),
          idUsuario: 1,//Session.idUsuario,
          dataCriacao: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          condicaoPagamento: _conditionPayment!,
          formaPagamento: _formPayment!,
          total: _total.value,
          itemPedidoBeans: _itensOrder.value
        ));
        if(order!.idPedido != null){
          Get.toNamed('/orders');
        }
      } else {
        _createError.value = 'Preencha todos os campos';
      }
    } on DomainError {
      _createError.value = 'Erro inesperado \n tente novamente';
    }finally {
      isLoading = false;
    }
  }

  @override
  void addItemOrder(){
    if(_product != null || _amount != null || _unitValue != null) {
      final item = CreateItemOrderParams(
        idProduto: int.parse(_product!),
        quantidade: double.parse(_amount!),
        valorUnitario: double.parse(_unitValue!.replaceAll(',', '.'))
      );
      final updatedList = [..._itensOrder.value, item];
      _itensOrder.value = updatedList;
    } else {
      _createError.value = 'Preencha todos os campos do item do pedido';
    }
    calculateTotal();
  }

  @override
  void calculateTotal(){
    _total.value = 0;
    for (var item in _itensOrder.value) {
      _total.value += item.quantidade * item.valorUnitario;
    }
  }

  @override
  void removeItemOrder(CreateItemOrderParams item) {
    final updatedList = _itensOrder.value.where((i) => i != item).toList();
    _itensOrder.value = updatedList;
    calculateTotal();
  }
  
  @override
  void validateCustumer(String? custumer) {
    _custumerError.value = null;
    _custumer = custumer;
    if(_custumer! == '0') _custumerError.value = "Informe um cliente valido";
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