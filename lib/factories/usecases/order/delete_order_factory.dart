import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

DeleteOrder makeDeleteOrder() => RemoteDeleteOrder(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('pedido')
);