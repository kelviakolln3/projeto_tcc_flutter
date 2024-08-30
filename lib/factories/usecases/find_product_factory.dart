import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

FindProduct makeFindProduct() => RemoteFindProduct(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('produto')
);