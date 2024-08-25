import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

LoadProducts makeLoadProducts() => RemoteLoadProducts(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('produto')
);