import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

DeleteSupplier makeDeleteSupplier() => RemoteDeleteSupplier(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('fornecedor')
);