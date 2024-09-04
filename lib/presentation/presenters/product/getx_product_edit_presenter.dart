import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxProductEditPresenter extends GetxController with LoadingManager implements ProductEditPresenter{
  final FindProduct findProduct;
  final EditProduct editProduct;
  final String idProduto;

  GetxProductEditPresenter({required this.findProduct, required this.editProduct, required this.idProduto});

  final _product = Rx<ProductViewModel?>(null);
  final _editError = Rx<String?>(null);
  final _nameError = Rx<String?>(null);
  final _barCodeError = Rx<String?>(null);
  final _stockError = Rx<String?>(null);
  final _groupError = Rx<String?>(null);
  final _markError = Rx<String?>(null);
  final _saleValueError = Rx<String?>(null);

  @override
  Stream<ProductViewModel?> get productStream => _product.stream;
  @override
  Stream<String?> get editErrorStream => _editError.stream;
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

  int? _idProduto;
  int? _code;
  String? _name;
  String? _barCode;
  String? _stock;
  String? _group;
  String? _mark;
  String? _saleValue;
  
  @override
  Future<void> edit() async {
    try {
      _editError.value = null;
      if(_name != null || _barCode != null || _stock != null || _group != null || _mark != null || _saleValue != null){
        isLoading = true;
        final custumer = await editProduct.edit(EditProductParams(
          idProduto: _idProduto!,
          codigo: _code!,
          nome: _name!,
          codigoBarras: _barCode!,
          estoque: double.parse(_stock!),
          grupo: _group!,
          marca: _mark!,
          valorVenda: double.parse(_saleValue!.replaceAll(',', '.'))
        ));
        if(custumer!.idProduto != null){
          isLoading = false;
          Get.back();
        }
      }
    } on DomainError {
      _editError.value = 'Erro inesperado \n tente novamente';
    }
  }
  
  @override
  Future<void> find() async {
    try {
      _editError.value = null;
      _product.value = null;
      isLoading = true;
      final product = await findProduct.find(int.parse(idProduto));
      if(product != null){
        _product.value = ProductViewModel(
          idProduto: product.idProduto,
          codigo: product.codigo,
          nome: product.nome,
          codigoBarras: product.codigoBarras,
          estoque: product.estoque,
          grupo: product.grupo,
          marca: product.marca,
          valorVenda: product.valorVenda
        );
        _idProduto = product.idProduto!;
        _code = product.codigo;
        _name = product.nome;
        _barCode = product.codigoBarras;
        _stock = product.estoque.toString();
        _group = product.grupo;
        _mark = product.marca;
        _saleValue = product.valorVenda.toString();
      }
    }on DomainError {
      _editError.value = 'Não foi possível buscar os dados do produto \n tente novamente';
    }finally {
      isLoading = false;
    }
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