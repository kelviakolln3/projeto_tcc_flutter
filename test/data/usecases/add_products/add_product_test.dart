import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 05 min e 45 seg
  late RemoteCreateProduct sut;
  late HttpClientSpy httpClient;
  late String url; 
  late CreateProductParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeAddProduct();
    apiResult = ApiFactory.makeAddProductJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteCreateProduct(httpClient: httpClient, url: url);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.create(params);

    verify(() => httpClient.request(
      url: url,
      method: 'post',
      body: {
        'codigo': params.codigo,
        'nome': params.nome,
        'codigoBarras': params.codigoBarras,
        'estoque': params.estoque,
        'grupo': params.grupo,
        'marca': params.marca,
        'valorVenda': params.valorVenda,
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

  test('Should return an Account if HttpClient returns 200', () async {
    final account = await sut.create(params);

    expect(account.idProduto, apiResult['idProduto']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}