import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

LoadOrders makeLoadOrders() => RemoteLoadOrders(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('pedido/get-all-bean')
);