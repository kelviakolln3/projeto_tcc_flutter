import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 06 min e 48 seg
  late RemoteEditCustumer sut;
  late HttpClientSpy httpClient;
  late String url; 
  late EditCustumerParams params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeEditCustumer();
    apiResult = ApiFactory.makeEditCustumerJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteEditCustumer(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.edit(params);

    verify(() => httpClient.request(
      url: '$url/${params.idCliente}',
      method: 'put',
      body: {
        'idCliente': params.idCliente,
        'codigo': params.codigo,
        'nome': params.nome,
        'cpf': params.cpf,
        'rg': params.rg,
        'endereco': params.endereco,
        'dataNasc': params.dataNasc,
        'contato': params.contato,
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

  test('Should return an Custumer if HttpClient returns 200', () async {
    final custumer = await sut.edit(params);

    expect(custumer.idCliente, apiResult['idCliente']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.edit(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}