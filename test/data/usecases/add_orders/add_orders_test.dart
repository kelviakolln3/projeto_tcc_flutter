import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 11 min e 24 seg
  late RemoteCreateOrder sut;
  late HttpClientSpy httpClient;
  late String url; 
  late CreateOrderParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeAddOrder();
    apiResult = ApiFactory.makeAddOrderJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteCreateOrder(httpClient: httpClient, url: url);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.create(params);

    verify(() => httpClient.request(
      url: url,
      method: 'post',
      body: {
        'idCliente': params.idCliente,
        'idUsuario': params.idUsuario,
        'dataCriacao': params.dataCriacao,
        'condicaoPagamento': params.condicaoPagamento,
        'formaPagamento': params.formaPagamento,
        'total': params.total,
        'itemPedidoBeans': [
          {
            'idProduto': params.itemPedidoBeans[0].idProduto,
            'quantidade': params.itemPedidoBeans[0].quantidade,
            'valorUnitario': params.itemPedidoBeans[0].valorUnitario,
          }
        ]
      }
    ));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return an Order if HttpClient returns 200', () async {
    final order = await sut.create(params);

    expect(order.idPedido, apiResult['idPedido']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}