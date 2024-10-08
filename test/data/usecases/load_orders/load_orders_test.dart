import 'package:mocktail/mocktail.dart';
import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main(){ //Tempo total de montagem 08 min e 13 seg
  late RemoteLoadOrders sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map> list;

  setUp(() {
    list = ApiFactory.makeOrdersList();
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(list);
    sut = RemoteLoadOrders(url: url, httpClient: httpClient);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(() => httpClient.request(url: url, method: 'get'));
  });

  test('Should return custumers on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      OrderEntity(
        idPedido: list[0]['idPedido'],
        idCliente: list[0]['idCliente'],
        idUsuario: list[0]['idUsuario'],
        dataCriacao: list[0]['dataCriacao'],
        condicaoPagamento: list[0]['condicaoPagamento'],
        formaPagamento: list[0]['formaPagamento'],
        total: list[0]['total'],
        itemPedidoBeans: List<ItemPedidoEntity>.from(list[0]['itemPedidoBeans'].map((item) => ItemPedidoEntity(
          idItemPedido: item['idItemPedido'],
          idProduto: item['idProduto'],
          quantidade: item['quantidade'],
          valorUnitario: item['valorUnitario'],
        ))),
      ),
      OrderEntity(
        idPedido: list[1]['idPedido'],
        idCliente: list[1]['idCliente'],
        idUsuario: list[1]['idUsuario'],
        dataCriacao: list[1]['dataCriacao'],
        condicaoPagamento: list[1]['condicaoPagamento'],
        formaPagamento: list[1]['formaPagamento'],
        total: list[1]['total'],
        itemPedidoBeans: List<ItemPedidoEntity>.from(list[1]['itemPedidoBeans'].map((item) => ItemPedidoEntity(
          idItemPedido: item['idItemPedido'],
          idProduto: item['idProduto'],
          quantidade: item['quantidade'],
          valorUnitario: item['valorUnitario'],
        ))),
      ),
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