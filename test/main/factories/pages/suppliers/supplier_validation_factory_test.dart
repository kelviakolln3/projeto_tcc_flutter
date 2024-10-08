import 'package:projeto_tcc_flutter/factories/factories.dart';
import 'package:projeto_tcc_flutter/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations in suppliers create', () { //Tempo de montagem 05 min e 49 seg 
    final validations = makeSupplierValidations();

    expect(validations, [
      const RequiredFieldValidation('codigo'),
      const RequiredFieldValidation('atividade'),
      const RequiredFieldValidation('empresa'),
      const RequiredFieldValidation('contato'),
      const PhoneValidation('contato'),
      const RequiredFieldValidation('endereco'),
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
    ]);
  });
}