import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxCustumerEditPresenter extends GetxController with LoadingManager implements CustumerEditPresenter {
  final FindCustumer findCustumer;
  final EditCustumer editCustumer;
  final String idCliente;

  GetxCustumerEditPresenter({required this.findCustumer, required this.editCustumer, required this.idCliente});

  final _custumer = Rx<CustumerViewModel?>(null);
  final _editError = Rx<String?>(null);
  final _nameError = Rx<String?>(null);
  final _rgError = Rx<String?>(null);
  final _addressError = Rx<String?>(null);
  final _birthdayError = Rx<String?>(null);
  final _contactError = Rx<String?>(null);
  final _emailError = Rx<String?>(null);

  int? _idCliente;
  int? _code;
  String? _name;
  String? _cpf;
  String? _rg;
  String? _address;
  String? _birthday;
  String? _contact;
  String? _email;

  @override
  Stream<CustumerViewModel?> get custumerStream => _custumer.stream;
  @override
  Stream<String?> get editErrorStream => _editError.stream;
  @override
  Stream<String?> get nameErrorStream => _nameError.stream;
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
  Future<void> edit() async{
    try {
      _editError.value = null;
      if(_name != null || _rg != null || _address != null || _birthday != null || _contact != null || _email != null){
        isLoading = true;
        var birthdaySplit = _birthday!.split('/'); 
        final custumer = await editCustumer.edit(EditCustumerParams(
          idCliente: _idCliente!,
          codigo: _code!,
          nome: _name!,
          cpf: _cpf!,
          rg: _rg!,
          endereco: _address!,
          dataNasc: "${birthdaySplit[2]}-${birthdaySplit[1]}-${birthdaySplit[0]}",
          contato: _contact!,
          email: _email!
        ));
        if(custumer!.idCliente != null){
          isLoading = false;
          Get.back();
        }
      }
    } on DomainError {
      _editError.value = 'Erro inesperado \n tente novamente';
    }
  }
  
  @override
  Future<void> find() async{
    try {
      _editError.value = null;
      _custumer.value = null;
      isLoading = true;
      final custumer = await findCustumer.find(int.parse(idCliente));
      if(custumer != null){
        _custumer.value = CustumerViewModel(
          idCliente: custumer.idCliente,
          codigo: custumer.codigo,
          nome: custumer.nome, 
          cpf: custumer.cpf, 
          rg: custumer.rg, 
          endereco: custumer.endereco, 
          dataNasc: custumer.dataNasc, 
          contato: custumer.contato, 
          email: custumer.email
        );
        _idCliente = custumer.idCliente!;
        _code = custumer.codigo;
        _name = custumer.nome;
        _cpf = custumer.cpf;
        _rg = custumer.rg;
        _address = custumer.endereco;
        _birthday = DateFormat('dd/MM/yyyy').format(DateTime.parse(custumer.dataNasc));
        _contact = custumer.contato;
        _email = custumer.email;
      }
    }on DomainError {
      _editError.value = 'Não foi possível buscar os dados do cliente \n tente novamente';
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