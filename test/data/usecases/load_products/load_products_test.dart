import 'package:mocktail/mocktail.dart';
import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 06 min e 13 seg
  late RemoteLoadProducts sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map> list;

  setUp(() {
    list = ApiFactory.makeProductsList();
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(list);
    sut = RemoteLoadProducts(url: url, httpClient: httpClient);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(() => httpClient.request(url: url, method: 'get'));
  });

  test('Should return custumers on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      ProductEntity(
        idProduto: list[0]['idProduto'],
        codigo: list[0]['codigo'],
        nome: list[0]['nome'],
        codigoBarras: list[0]['codigoBarras'],
        estoque: list[0]['estoque'],
        grupo: list[0]['grupo'],
        marca: list[0]['marca'],
        valorVenda: list[0]['valorVenda'],
      ),
      ProductEntity(
        idProduto: list[1]['idProduto'],
        codigo: list[1]['codigo'],
        nome: list[1]['nome'],
        codigoBarras: list[1]['codigoBarras'],
        estoque: list[1]['estoque'],
        grupo: list[1]['grupo'],
        marca: list[1]['marca'],
        valorVenda: list[1]['valorVenda'],
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