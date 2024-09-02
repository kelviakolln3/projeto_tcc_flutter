import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxSupplierEditPresenter extends GetxController with LoadingManager implements SupplierEditPresenter {
  final FindSupplier findSupplier;
  final EditSupplier editSupplier;
  final String idFornecedor;

  GetxSupplierEditPresenter({required this.findSupplier, required this.editSupplier, required this.idFornecedor});

  final _supplier = Rx<SupplierViewModel?>(null);
  final _editError = Rx<String?>(null);
  final _codeError = Rx<String?>(null);
  final _activityError = Rx<String?>(null);
  final _enterpriseError = Rx<String?>(null);
  final _contactError = Rx<String?>(null);
  final _addressError = Rx<String?>(null);
  final _emailError = Rx<String?>(null);

  int? _idFornecedor;
  String? _code;
  String? _activity;
  String? _enterprise;
  String? _contact;
  String? _address;
  String? _email;
  
  @override
  Stream<SupplierViewModel?> get supplierStream => _supplier.stream;
  @override
  Stream<String?> get editErrorStream => _editError.stream;
  @override
  Stream<String?> get codeErrorStream => _codeError.stream;
  @override
  Stream<String?> get activityErrorStream => _activityError.stream;
  @override
  Stream<String?> get enterpriseErrorStream => _enterpriseError.stream;
  @override
  Stream<String?> get contactErrorStream => _contactError.stream;
  @override
  Stream<String?> get addressErrorStream => _addressError.stream;
  @override
  Stream<String?> get emailErrorStream => _emailError.stream;

  @override
  Future<void> edit() async {
    try {
      _editError.value = null;
      if(_code != null || _activity != null || _enterprise != null || _contact != null || _address != null || _email != null) {
        isLoading = true;
        final supplier = await editSupplier.edit(EditSupplierParams(
          idFornecedor: _idFornecedor!,
          codigo: int.parse(_code!),
          atividade: _activity!,
          empresa: _enterprise!,
          contato: _contact!,
          endereco: _address!,
          email: _email!
        ));
        if(supplier!.idFornecedor != null){
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
  Future<void> find() async {
    _editError.value = null;
    _supplier.value = null;
    isLoading = true;
    final supplier = await findSupplier.find(int.parse(idFornecedor));
    if(supplier != null) {
      _supplier.value = SupplierViewModel(
        idFornecedor: supplier.idFornecedor,
        codigo: supplier.codigo,
        atividade: supplier.atividade,
        empresa: supplier.empresa,
        contato: supplier.contato,
        endereco: supplier.endereco,
        email: supplier.email
      );
      _idFornecedor = supplier.idFornecedor;
      _code = supplier.codigo.toString();
      _activity = supplier.atividade;
      _enterprise = supplier.empresa;
      _contact = supplier.contato;
      _address = supplier.endereco;
      _email = supplier.email;
    }
  }
  
  @override
  void validateCode(String? code) {
    _codeError.value = null;
    _code = code;
    if(_code! == '0') _codeError.value = "Informe um código valido";
  }
  
  @override
  void validateActivity(String? activity) {
    _activityError.value = null;
    _activity = activity;
    if(_activity == null) _activityError.value = "Informe a atividade";
  }

  @override
  void validateEnterprise(String? enterprise) {
    _enterpriseError.value = null;
    _enterprise = enterprise;
    if(_enterprise == null) _enterpriseError.value = "Informe a empresa";
  }

  @override
  void validateContact(String? contact) {
    _contactError.value = null;
    _contact = contact;
    if(_contact == null) _contactError.value = "Informe um contato";
  }
  
  @override
  void validateAddress(String? address) {
    _addressError.value = null;
    _address = address;
    if(_address == null) _addressError.value = "Informe um endereço";
  }
  
  @override
  void validateEmail(String? email) {
    _emailError.value = null;
    _email = email;
    if(!_email!.contains('@')) _emailError.value = "Informe um e-mail valido";
  }
}