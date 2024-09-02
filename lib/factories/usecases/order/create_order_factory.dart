import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

CreateOrder makeCreateOrder() => RemoteCreateOrder(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('pedido/inserir-pedido')
);