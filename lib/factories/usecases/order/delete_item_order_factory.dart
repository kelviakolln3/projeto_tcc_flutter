import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

DeleteItemOrder makeDeleteItemOrder() => RemoteDeleteItemOrder(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('item-pedido')
);