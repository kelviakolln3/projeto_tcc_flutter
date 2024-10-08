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

  static List<Map> makeProductsList() => [
    {
      'idProduto': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'nome': faker.person.name(),
      'codigoBarras': faker.randomGenerator.integer(14).toString(),
      'estoque': faker.randomGenerator.decimal(),
      'grupo': faker.randomGenerator.string(10),
      'marca': faker.randomGenerator.string(10),
      'valorVenda': faker.randomGenerator.decimal(),
    },
    {
      'idProduto': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'nome': faker.person.name(),
      'codigoBarras': faker.randomGenerator.integer(14).toString(),
      'estoque': faker.randomGenerator.decimal(),
      'grupo': faker.randomGenerator.string(10),
      'marca': faker.randomGenerator.string(10),
      'valorVenda': faker.randomGenerator.decimal(),
    },
  ];

  static List<Map> makeSuppliersList() => [
    {
      'idFornecedor': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'atividade': faker.address.streetAddress(),
      'empresa': faker.randomGenerator.string(20),
      'contato': faker.phoneNumber.toString(),
      'endereco': faker.randomGenerator.string(10),
      'email': faker.internet.email()
    },
    {
      'idFornecedor': faker.randomGenerator.integer(20),
      'codigo': faker.randomGenerator.integer(20),
      'atividade': faker.address.streetAddress(),
      'empresa': faker.randomGenerator.string(20),
      'contato': faker.phoneNumber.toString(),
      'endereco': faker.randomGenerator.string(10),
      'email': faker.internet.email()
    },
  ];

  static List<Map> makeOrdersList() => [
    {
      'idPedido': faker.randomGenerator.integer(1000),
      'idCliente': faker.randomGenerator.integer(100),
      'idUsuario': faker.randomGenerator.integer(10),
      'dataCriacao': faker.date.dateTime().toIso8601String(),
      'condicaoPagamento': faker.randomGenerator.string(10),
      'formaPagamento': faker.randomGenerator.string(10),
      'total': faker.randomGenerator.decimal(),
      'itemPedidoBeans': [
        {
          'idItemPedido': faker.randomGenerator.integer(300),
          'idProduto': faker.randomGenerator.integer(20),
          'quantidade': faker.randomGenerator.decimal(),
          'valorUnitario': faker.randomGenerator.decimal(),
        }
      ],
    },
    {
      'idPedido': faker.randomGenerator.integer(1000),
      'idCliente': faker.randomGenerator.integer(100),
      'idUsuario': faker.randomGenerator.integer(10),
      'dataCriacao': faker.date.dateTime().toIso8601String(),
      'condicaoPagamento': faker.randomGenerator.string(10),
      'formaPagamento': faker.randomGenerator.string(10),
      'total': faker.randomGenerator.decimal(),
      'itemPedidoBeans': [
        {
          'idItemPedido': faker.randomGenerator.integer(300),
          'idProduto': faker.randomGenerator.integer(20),
          'quantidade': faker.randomGenerator.decimal(scale: 1, min: 10),
          'valorUnitario': faker.randomGenerator.decimal(scale: 1, min: 50),
        }
      ],
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