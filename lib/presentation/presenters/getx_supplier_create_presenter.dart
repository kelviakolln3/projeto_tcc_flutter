import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSupplierCreatePresenter extends GetxController with LoadingManager implements SupplierCreatePresenter {
  final CreateSupplier createSupplier;

  GetxSupplierCreatePresenter({required this.createSupplier});

  final _createError = Rx<String?>(null);
  final _codeError = Rx<String?>(null);
  final _activityError = Rx<String?>(null);
  final _enterpriseError = Rx<String?>(null);
  final _contactError = Rx<String?>(null);
  final _addressError = Rx<String?>(null);
  final _emailError = Rx<String?>(null);

  String? _code;
  String? _activity;
  String? _enterprise;
  String? _contact;
  String? _address;
  String? _email;

  @override
  Stream<String?> get createErrorStream => _createError.stream;
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
  Future<void> create() async {
    try {
      _createError.value = null;
      if(_code != null || _activity != null || _enterprise != null || _contact != null || _address != null || _email != null) {
        isLoading = true;
        final supplier = await createSupplier.create(CreateSupplierParams(
          codigo: int.parse(_code!),
          atividade: _activity!,
          empresa: _enterprise!,
          contato: _contact!,
          endereco: _address!,
          email: _email!
        ));
        if(supplier!.idFornecedor != null){
          Get.toNamed('/suppliers');
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