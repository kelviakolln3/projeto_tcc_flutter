import '../domain.dart';

abstract class FindSupplier {
  Future<SupplierEntity?> find(int idFornecedor);
}