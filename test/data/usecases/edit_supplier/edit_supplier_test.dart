import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 02 min e 55 seg
  late RemoteEditSupplier sut;
  late HttpClientSpy httpClient;
  late String url; 
  late EditSupplierParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeEditSupplier();
    apiResult = ApiFactory.makeEditSupplierJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteEditSupplier(httpClient: httpClient, url: url);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.edit(params);

    verify(() => httpClient.request(
      url: '$url/${params.idFornecedor}',
      method: 'put',
      body: {
        'idFornecedor': params.idFornecedor,
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

  test('Should return an Supplier if HttpClient returns 200', () async {
    final supplier = await sut.edit(params);

    expect(supplier.idFornecedor, apiResult['idFornecedor']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}