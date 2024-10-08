import 'package:faker/faker.dart';

class ApiFactory {
  static List<Map> makeCustumerList() => [
    {
      'idCliente': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'nome': faker.person.name(),
      'cpf': faker.randomGenerator.string(14),
      'rg': faker.randomGenerator.integer(20).toString(),
      'endereco': faker.address.streetAddress(),
      'dataNasc': faker.date.dateTime().toIso8601String(),
      'contato': faker.phoneNumber.toString(),
      'email': faker.internet.email()
    },
    {
      'idCliente': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'nome': faker.person.name(),
      'cpf': faker.randomGenerator.string(14),
      'rg': faker.randomGenerator.integer(20).toString(),
      'endereco': faker.address.streetAddress(),
      'dataNasc': faker.date.dateTime().toIso8601String(),
      'contato': faker.phoneNumber.toString(),
      'email': faker.internet.email()
    },
  ];

  static Map makeInvalidJson() => {
    'invalid_key': 'invalid_value'
  };

  static List<Map> makeInvalidList() => [
    makeInvalidJson(),
    makeInvalidJson()
  ];
}