import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxProductCreatePresenter extends GetxController with LoadingManager implements ProductCreatePresenter {
  final CreateProduct createProduct;

  GetxProductCreatePresenter({required this.createProduct});

  final _createError = Rx<String?>(null);
  final _codeError = Rx<String?>(null);
  final _nameError = Rx<String?>(null);
  final _barCodeError = Rx<String?>(null);
  final _stockError = Rx<String?>(null);
  final _groupError = Rx<String?>(null);
  final _markError = Rx<String?>(null);
  final _saleValueError = Rx<String?>(null);

  String? _code;
  String? _name;
  String? _barCode;
  String? _stock;
  String? _group;
  String? _mark;
  String? _saleValue;

  @override
  Stream<String?> get createErrorStream => _createError.stream;
  @override
  Stream<String?> get codeErrorStream => _codeError.stream;
  @override
  Stream<String?> get nameErrorStream => _nameError.stream;
  @override
  Stream<String?> get barCodeErrorStream => _barCodeError.stream;
  @override
  Stream<String?> get stockErrorStream => _stockError.stream;
  @override
  Stream<String?> get groupErrorStream => _groupError.stream;
  @override
  Stream<String?> get markErrorStream => _markError.stream;
  @override
  Stream<String?> get saleValueErrorStream => _saleValueError.stream;

  @override
  Future<void> create() async {
     try {
      _createError.value = null;
      if(_code != null || _name != null || _barCode != null || _stock != null || _group != null || _mark != null || _saleValue != null) {
        isLoading = true;
        final product = await createProduct.create(CreateProductParams(
          codigo: int.parse(_code!),
          nome: _name!,
          codigoBarras: _barCode!,
          estoque: double.parse(_stock!),
          grupo: _group!,
          marca: _mark!,
          valorVenda: double.parse(_saleValue!.replaceAll(',', '.'))
        ));
        if(product!.idProduto != null){
          Get.toNamed('/products');
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
  void validateCode(String? code) {
    _codeError.value = null;
    _code = code;
    if(_code! == '0') _codeError.value = "Informe um código valido";
  }

  @override
  void valideteName(String? name) {
    _nameError.value = null;
    _name = name;
    if(_name == null) _nameError.value = "Informe o nome completo";
  }

  @override
  void valideteBarCode(String? barCode) {
    _barCodeError.value = null;
    _barCode = barCode;
    if(_barCode == null || _barCode == "0") _barCodeError.value = "Informe um código de barras valido";
  }

  @override
  void valideteStock(String? stock) {
    _stockError.value = null;
    _stock = stock;
    if(_stock == null || _stock == "0") _stockError.value = "Informe a quantidade em estoque";
  }

  @override
  void valideteGroup(String? group) {
    _groupError.value = null;
    _group = group;
    if(_group == null) _groupError.value = "Informe um grupo";
  }

  @override
  void valideteMark(String? mark) {
    _markError.value = null;
    _mark = mark;
    if(_mark == null) _markError.value = "Informe uma marca";
  }

  @override
  void valideteSaleValue(String? saleValue) {
    _saleValueError.value = null;
    _saleValue = saleValue;
    if(_saleValue == null || _saleValue == "0" || _saleValue == "0,0") _saleValueError.value = "Informe o valor de venda";
  }
}