import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 06 min e 31 seg
  late RemoteCreateSupplier sut;
  late HttpClientSpy httpClient;
  late String url; 
  late CreateSupplierParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeAddSupplier();
    apiResult = ApiFactory.makeAddSupplierJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteCreateSupplier(httpClient: httpClient, url: url);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.create(params);

    verify(() => httpClient.request(
      url: url,
      method: 'post',
      body: {
        'codigo': params.codigo,
        'atividade': params.atividade,
        'empresa': params.empresa,
        'contato': params.contato,
        'endereco': params.endereco,
        'email': params.email,
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

  test('Should return an Supplier if HttpClient returns 200', () async {
    final supplier = await sut.create(params);

    expect(supplier.idFornecedor, apiResult['idFornecedor']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.create(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}