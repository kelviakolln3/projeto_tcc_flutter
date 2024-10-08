import 'package:projeto_tcc_flutter/factories/factories.dart';
import 'package:projeto_tcc_flutter/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations in products create', () { //Tempo de montagem 06 min e 02 seg 
    final validations = makeProductValidations(); 

    expect(validations, [
      const RequiredFieldValidation('codigo'),
      const RequiredFieldValidation('nome'),
      const RequiredFieldValidation('codigoBarras'),
      const RequiredFieldValidation('estoque'),
      const RequiredFieldValidation('grupo'),
      const RequiredFieldValidation('marca'),
      const RequiredFieldValidation('valorVenda'),
    ]);
  });
}