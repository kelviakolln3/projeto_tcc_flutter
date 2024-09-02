import 'package:flutter/material.dart';

import 'orders.dart';

abstract class OrdersPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<OrderViewModel>> get ordersStream;
  Future<void> loadData();
  Future<void> delete(int idPedido);
}