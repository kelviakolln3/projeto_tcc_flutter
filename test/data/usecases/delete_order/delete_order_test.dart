import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() { //Tempo total de montagem 15 min e 27 seg
  late RemoteDeleteOrder sut; 
  late HttpClientSpy httpClient;
  late String url;
  late int idPedido;

  setUp(() {
    url = faker.internet.httpUrl();
    idPedido = faker.randomGenerator.integer(15); 
    httpClient = HttpClientSpy();
    httpClient.mockRequest(idPedido);
    sut = RemoteDeleteOrder(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values to delete', () async {
    await sut.delete(idPedido);

    verify(() => httpClient.request(
      url: '$url/$idPedido', 
      method: 'delete',
    ));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final future = sut.delete(idPedido);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = sut.delete(idPedido);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final future = sut.delete(idPedido);

    expect(future, throwsA(DomainError.unexpected));
  });
}
