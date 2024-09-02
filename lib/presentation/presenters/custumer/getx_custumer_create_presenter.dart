import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class GetxCustumerCreatePresenter extends GetxController with LoadingManager implements CustumerCreatePresenter {
  final CreateCustumer createCustumer;

  GetxCustumerCreatePresenter({required this.createCustumer});

  final _createError = Rx<String?>(null);
  final _codeError = Rx<String?>(null);
  final _nameError = Rx<String?>(null);
  final _cpfError = Rx<String?>(null);
  final _rgError = Rx<String?>(null);
  final _addressError = Rx<String?>(null);
  final _birthdayError = Rx<String?>(null);
  final _contactError = Rx<String?>(null);
  final _emailError = Rx<String?>(null);

  String? _code;
  String? _name;
  String? _cpf;
  String? _rg;
  String? _address;
  String? _birthday;
  String? _contact;
  String? _email;

  @override
  Stream<String?> get createErrorStream => _createError.stream;
  @override
  Stream<String?> get codeErrorStream => _codeError.stream;
  @override
  Stream<String?> get nameErrorStream => _nameError.stream;
  @override
  Stream<String?> get cpfErrorStream => _cpfError.stream;
  @override
  Stream<String?> get rgErrorStream => _rgError.stream;
  @override
  Stream<String?> get addressErrorStream => _addressError.stream;
  @override
  Stream<String?> get birthdayErrorStream => _birthdayError.stream;
  @override
  Stream<String?> get contactErrorStream => _contactError.stream;
  @override
  Stream<String?> get emailErrorStream => _emailError.stream;

  @override
  Future<void> create() async {
    try {
      _createError.value = null;
      if(_code != null || _name != null || _cpf != null || _rg != null || _address != null || _birthday != null || _contact != null || _email != null) {
        isLoading = true;
        var birthdaySplit = _birthday!.split('/'); 
        final custumer = await createCustumer.create(CreateCustumerParams(
          codigo: int.parse(_code!),
          nome: _name!,
          cpf: _cpf!,
          rg: _rg!,
          endereco: _address!,
          dataNasc: "${birthdaySplit[2]}-${birthdaySplit[1]}-${birthdaySplit[0]}",
          contato: _contact!,
          email: _email!
        ));
        if(custumer!.idCliente != null){
          Get.toNamed('/custumers');
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
    if(_code! == '0') _nameError.value = "Informe um código valido";
  }

  @override
  void valideteName(String? name) {
    _nameError.value = null;
    _name = name;
    if(_name == null) _nameError.value = "Informe o nome completo";
  }

  @override
  void valideteCPF(String? cpf) {
    _cpfError.value = null;
    _cpf = cpf;
    if(!CPFValidator.isValid(_cpf)) _cpfError.value = "Informe um CPF valido";
  }

  @override
  void valideteRG(String? rg) {
    _rgError.value = null;
    _rg = rg;
    if(_rg == null) _rgError.value = "Informe um RG";
  }

  @override
  void valideteAddress(String? address) {
    _addressError.value = null;
    _address = address;
    if(_address == null) _addressError.value = "Informe um endereço";
  }

  @override
  void valideteBirthday(String? birthday) {
    _birthdayError.value = null;
    _birthday = birthday;
    var birthdaySplit = _birthday!.split('/');
    if(birthdaySplit[0].contains('00')) {
       _birthdayError.value = "Informe uma data de nascimento valida";
    } else if(birthdaySplit.length == 3 && int.parse(birthdaySplit[2]) > 2024) {
      _birthdayError.value = "Informe uma data de nascimento valida";
    } else if(birthdaySplit.length == 2 && int.parse(birthdaySplit[1]) >= 13) {
      _birthdayError.value = "Informe uma data de nascimento valida";
    }
  }

  @override
  void valideteContact(String? contact) {
    _contactError.value = null;
    _contact = contact;
    if(_contact == null) _contactError.value = "Informe um contato";
  }

  @override
  void valideteEmail(String? email) {
    _emailError.value = null;
    _email = email;
    if(!_email!.contains('@')) _emailError.value = "Informe um e-mail valido";
  }
}