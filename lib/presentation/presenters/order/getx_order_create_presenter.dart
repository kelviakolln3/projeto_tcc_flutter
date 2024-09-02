import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../session.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxOrderCreatePresenter extends GetxController with LoadingManager implements OrderCreatePresenter {
  final CreateOrder createOrder;

  GetxOrderCreatePresenter({required this.createOrder});

  final _createError = Rx<String?>(null);
  final _custumerError = Rx<String?>(null);
  final _conditionPaymentError = Rx<String?>(null);
  final _formPaymentError = Rx<String?>(null);
  final _itemOrderError = Rx<List<dynamic>>([]);
  final _productError = Rx<String?>(null);
  final _amountError = Rx<String?>(null);
  final _unitValueError = Rx<String?>(null);

  final _formPaymentOptions = Rx<List<String>>(['Dinheiro', 'Cartão', 'Boleto', 'Pix']);
  final _conditionPaymentOptions = Rx<List<String>>(['A Vista', 'Débito', 'Crédito', '30 dias']);

  String? _custumer;
  String? _conditionPayment;
  String? _formPayment;
  double _total = 0;
  List<CreateItemOrderParams> itensPedido = [];
  String? _product;
  String? _amount;
  String? _unitValue;

  @override
  Stream<String?> get createErrorStream => _createError.stream;
  @override
  Stream<String?> get custumerErrorStream => _custumerError.stream;
  @override
  Stream<String?> get conditionPaymentErrorStream => _conditionPaymentError.stream;
  @override
  Stream<String?> get formPaymentErrorStream => _formPaymentError.stream;
  @override
  Stream<List<dynamic>> get itemOrderErrorStream => _itemOrderError.stream;
  @override
  Stream<String?> get productErrorStream => _productError.stream;
  @override
  Stream<String?> get amountErrorStream => _amountError.stream;
  @override
  Stream<String?> get unitValueErrorStream => _unitValueError.stream;
  @override
  Stream<List<String>> get formPaymentOptionsStream => _formPaymentOptions.stream;
  @override
  Stream<List<String>> get conditionPaymentStream => _conditionPaymentOptions.stream;

  @override
  Future<void> create() async {
    try {
      _createError.value = null;
      if(_custumer != null || _conditionPayment != null || _formPayment != null) {
        isLoading = true;
        calculateTotal();
        final order = await createOrder.create(CreateOrderParams(
          idCliente: int.parse(_custumer!),
          idUsuario: Session.idUsuario,
          dataCriacao: DateTime.now().toString(),
          condicaoPagamento: _conditionPayment!,
          formaPagamento: _formPayment!,
          total: _total,
          itemPedidoBeans: itensPedido
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
      itensPedido.add(CreateItemOrderParams(
        idProduto: int.parse(_product!),
        quantidade: double.parse(_amount!),
        valorUnitario: double.parse(_unitValue!.replaceAll(',', '.'))
      ));
    } else {
      _createError.value = 'Preencha todos os campos do item do pedido';
    }
    _product == null; 
    _amount == null; 
    _unitValue == null;
  }

  @override
  void calculateTotal(){
    _total = 0;
    for (var item in itensPedido) {
      _total += item.valorUnitario;
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