import 'package:mocktail/mocktail.dart';
import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 38 min e 48 seg
  late RemoteLoadCustumers sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map> list;

  setUp(() {
    list = ApiFactory.makeCustumerList();
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(list);
    sut = RemoteLoadCustumers(url: url, httpClient: httpClient);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(() => httpClient.request(url: url, method: 'get'));
  });

  test('Should return custumers on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      CustumerEntity(
        idCliente: list[0]['idCliente'],
        codigo: list[0]['codigo'],
        nome: list[0]['nome'],
        cpf: list[0]['cpf'],
        rg: list[0]['rg'],
        endereco: list[0]['endereco'],
        dataNasc: list[0]['dataNasc'],
        contato: list[0]['contato'],
        email: list[0]['email']
      ),
      CustumerEntity(
        idCliente: list[1]['idCliente'],
        codigo: list[1]['codigo'],
        nome: list[1]['nome'],
        cpf: list[1]['cpf'],
        rg: list[1]['rg'],
        endereco: list[1]['endereco'],
        dataNasc: list[1]['dataNasc'],
        contato: list[1]['contato'],
        email: list[1]['email']
      )
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest(ApiFactory.makeInvalidList());

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}