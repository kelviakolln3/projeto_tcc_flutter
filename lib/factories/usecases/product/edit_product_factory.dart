import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

EditProduct makeEditProduct() => RemoteEditProduct(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('produto')
);