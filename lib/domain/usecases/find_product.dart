import '../domain.dart';

abstract class FindProduct {
  Future<ProductEntity?> find(int idProduto);
}