import 'package:projeto_tcc_flutter/data/data.dart';
import 'package:projeto_tcc_flutter/factories/http/http.dart';

import '../domain/mocks/mocks.dart';

import 'package:test/test.dart';

void main() { //Tempo total de montagem 01 h 04 min e 39 seg
  List<Future<dynamic>> requests = [];
  late HttpClient httpClient;

  late RemoteLoadCustumers loadCustumers;
  late RemoteLoadOrders loadOrders;
  late RemoteLoadProducts loadProducts;
  late RemoteLoadSuppliers loadSuppliers;

  late RemoteCreateCustumer createCustumer;
  late RemoteCreateOrder createOrders;
  late RemoteCreateProduct createProducts;
  late RemoteCreateSupplier createSuppliers;

  setUp(() {
    httpClient = makeHttpAdapter();

    loadCustumers = RemoteLoadCustumers(httpClient: httpClient, url: makeApiUrl('cliente'));
    createCustumer = RemoteCreateCustumer(httpClient: httpClient, url: makeApiUrl('cliente'));

    loadOrders = RemoteLoadOrders(httpClient: httpClient, url: makeApiUrl('pedido/get-all-bean'));
    createOrders = RemoteCreateOrder(httpClient: httpClient, url: makeApiUrl('pedido/inserir-pedido'));

    loadProducts = RemoteLoadProducts(httpClient: httpClient, url: makeApiUrl('produto'));
    createProducts = RemoteCreateProduct(httpClient: httpClient, url: makeApiUrl('produto'));

    loadSuppliers = RemoteLoadSuppliers(httpClient: httpClient, url: makeApiUrl('fornecedor'));
    createSuppliers = RemoteCreateSupplier(httpClient: httpClient, url: makeApiUrl('fornecedor'));
  
    for (int i = 0; i < 20; i++) {
      requests.add(createCustumer.create(ParamsFactory.makeAddCustumer()));
      requests.add(loadCustumers.load());
      requests.add(createOrders.create(ParamsFactory.makeAddOrderStressTest()));
      requests.add(loadOrders.load());
      requests.add(createProducts.create(ParamsFactory.makeAddProduct()));
      requests.add(loadProducts.load());
      requests.add(createSuppliers.create(ParamsFactory.makeAddSupplier()));
      requests.add(loadSuppliers.load());
    }
  });
  test('Should call the Multiple Requests with success', () async {
    try {
      await Future.wait(requests);
    } catch (error) {
      fail('Falha ao completar todas as requisições');
    }
  });
}
