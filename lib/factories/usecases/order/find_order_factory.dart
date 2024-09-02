import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

FindOrder makeFindOrder() => RemoteFindOrder(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('pedido/get-all-bean')
);