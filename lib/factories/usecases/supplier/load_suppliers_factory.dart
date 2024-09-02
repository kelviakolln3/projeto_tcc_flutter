import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

LoadSuppliers makeLoadSuppliers() => RemoteLoadSuppliers(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('fornecedor')
);