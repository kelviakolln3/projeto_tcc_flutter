import '../../domain.dart';

abstract class LoadSuppliers {
  Future<List<SupplierEntity>> load();
}