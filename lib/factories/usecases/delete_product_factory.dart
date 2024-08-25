import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

DeleteProduct makeDeleteProduct() => RemoteDeleteProduct(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('cliente')
);