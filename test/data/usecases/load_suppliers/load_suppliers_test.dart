import 'package:mocktail/mocktail.dart';
import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main(){ //Tempo total de montagem 05 min e 43 seg
  late RemoteLoadSuppliers sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map> list;

  setUp(() {
    list = ApiFactory.makeSuppliersList();
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(list);
    sut = RemoteLoadSuppliers(url: url, httpClient: httpClient);
  });

   test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(() => httpClient.request(url: url, method: 'get'));
  });

  test('Should return custumers on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      SupplierEntity(
        idFornecedor: list[0]['idFornecedor'],
        codigo: list[0]['codigo'],
        atividade: list[0]['atividade'],
        empresa: list[0]['empresa'],
        contato: list[0]['contato'],
        endereco: list[0]['endereco'],
        email: list[0]['email']
      ),
      SupplierEntity(
        idFornecedor: list[1]['idFornecedor'],
        codigo: list[1]['codigo'],
        atividade: list[1]['atividade'],
        empresa: list[1]['empresa'],
        contato: list[1]['contato'],
        endereco: list[1]['endereco'],
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