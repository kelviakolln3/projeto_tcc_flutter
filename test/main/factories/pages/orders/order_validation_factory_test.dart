import 'package:projeto_tcc_flutter/factories/factories.dart';
import 'package:projeto_tcc_flutter/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations in orders create', () { //Tempo de montagem 27 min e 04 seg 
    final validations = makeOrderValidations();

    expect(validations, [
      const RequiredFieldValidation('idCliente'),
      const RequiredFieldValidation('idUsuario'),
      const RequiredFieldValidation('dataCriacao'),
      const DateValidation('dataCriacao'),
      const RequiredFieldValidation('condicaoPagamento'),
      const RequiredFieldValidation('formaPagamento'),
      const RequiredFieldValidation('total'),
      const RequiredFieldValidation('observacao'),
      const RequiredFieldValidation('itemPedidoBeans'),
      const NestedValidation('itemPedidoBeans', [
        RequiredFieldValidation('idProduto'),
        RequiredFieldValidation('quantidade'),
        RequiredFieldValidation('valorUnitario'),
      ]),
    ]);
  });
}