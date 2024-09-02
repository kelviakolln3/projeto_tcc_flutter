import 'package:flutter/material.dart';

import 'suppliers.dart';

abstract class SuppliersPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<SupplierViewModel>> get suppliersStream;
  Future<void> loadData();
  Future<void> delete(int idFornecedor);
}