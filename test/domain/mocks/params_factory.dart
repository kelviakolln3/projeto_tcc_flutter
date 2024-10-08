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
}