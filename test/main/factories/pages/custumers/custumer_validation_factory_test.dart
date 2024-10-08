import 'package:projeto_tcc_flutter/factories/factories.dart';
import 'package:projeto_tcc_flutter/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations in custumers create', () { //Tempo de montagem 42 min e 21 seg 
    final validations = makeCustumerValidations();

    expect(validations, [
      const RequiredFieldValidation('codigo'),
      const RequiredFieldValidation('nome'),
      const RequiredFieldValidation('cpf'),
      const MinLengthValidation(field: 'cpf', size: 11),
      const CpfValidation('cpf'),
      const RequiredFieldValidation('rg'),
      const RequiredFieldValidation('endereco'),
      const RequiredFieldValidation('dataNasc'),
      const DateValidation('dataNasc'),
      const RequiredFieldValidation('contato'),
      const PhoneValidation('contato'),
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
    ]);
  });
}