import '../domain.dart';

abstract class LoadProducts {
  Future<List<ProductsEntity>> load();
}