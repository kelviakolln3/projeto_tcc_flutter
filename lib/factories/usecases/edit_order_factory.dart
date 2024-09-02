import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

EditOrder makeEditOrder() => RemoteEditOrder(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('pedido/inserir-pedido')
);