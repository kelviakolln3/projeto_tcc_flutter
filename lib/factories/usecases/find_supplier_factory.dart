import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

FindSupplier makeFindSupplier() => RemoteFindSupplier(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('fornecedor')
);