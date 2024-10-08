import 'package:projeto_tcc_flutter/factories/factories.dart';
import 'package:projeto_tcc_flutter/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations', () { //Tempo de montagem 17 min e 46 seg 
    final validations = makeLoginValidations();

    expect(validations, [
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
      const RequiredFieldValidation('password'),
      const MinLengthValidation(field: 'password', size: 3)
    ]);
  });
}