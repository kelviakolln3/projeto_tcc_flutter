import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui.dart';

abstract class OrderEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<String?> get editErrorStream;
  Rx<List<ItemPedidoViewModel>> get itensOrder;
  Stream<OrderViewModel?> get orderStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get productErrorStream;
  Stream<String?> get amountErrorStream;
  Stream<String?> get unitValueErrorStream;
  Stream<double> get totalStream;
  void addItemOrder();
  void validateConditionPayment(String? conditionPayment);
  void validateFormPayment(String? formPayment);
  void calculateTotal();
  void removeItemOrder(ItemPedidoViewModel item);
  void validateProduct(String? product);
  void validateAmount(String? amount);
  void validateUnitValue(String? unitValue);
}