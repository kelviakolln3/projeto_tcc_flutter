import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 03 min e 11 seg
  late RemoteEditProduct sut;
  late HttpClientSpy httpClient;
  late String url; 
  late EditProductParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeEditProduct();
    apiResult = ApiFactory.makeEditProductJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteEditProduct(httpClient: httpClient, url: url);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.edit(params);

    verify(() => httpClient.request(
      url: '$url/${params.idProduto}',
      method: 'put',
      body: {
        'idProduto': params.idProduto,
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

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return an Product if HttpClient returns 200', () async {
    final product = await sut.edit(params);

    expect(product.idProduto, apiResult['idProduto']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}