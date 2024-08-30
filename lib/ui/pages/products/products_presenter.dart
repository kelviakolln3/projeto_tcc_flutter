import 'package:flutter/material.dart';

import 'products.dart';

abstract class ProductsPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<ProductViewModel>> get productsStream;
  Future<void> loadData();
  Future<void> delete(int idProduto);
}