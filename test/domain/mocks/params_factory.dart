import 'package:projeto_tcc_flutter/domain/usecases/usecases.dart';

import 'package:faker/faker.dart';

class ParamsFactory{
  static CreateCustumerParams makeAddCustumer() => CreateCustumerParams(
    codigo: faker.randomGenerator.integer(20),
    nome: faker.person.name(),
    cpf: faker.randomGenerator.string(14),
    rg: faker.randomGenerator.integer(20).toString(),
    endereco: faker.address.streetAddress(),
    dataNasc: faker.date.dateTime().toIso8601String(),
    contato: faker.phoneNumber.toString(),
    email: faker.internet.email()
  );

  static CreateProductParams makeAddProduct() => CreateProductParams(
    codigo: faker.randomGenerator.integer(20),
    nome: faker.person.name(),
    codigoBarras: faker.randomGenerator.integer(20).toString(),
    estoque: faker.randomGenerator.decimal(),
    grupo: faker.randomGenerator.string(20),
    marca: faker.randomGenerator.string(20),
    valorVenda: faker.randomGenerator.decimal(),
  );

  static CreateSupplierParams makeAddSupplier() => CreateSupplierParams(
    codigo: faker.randomGenerator.integer(20),
    atividade: faker.randomGenerator.string(20),
    empresa: faker.randomGenerator.string(20),
    contato: faker.phoneNumber.toString(),
    endereco: faker.address.streetAddress(),
    email: faker.internet.email()
  );
}