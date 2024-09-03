import 'package:flutter/material.dart';

import '../../../ui.dart';

abstract class OrderEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<String?> get editErrorStream;
  Stream<OrderViewModel?> get orderStream;
  Stream<List<dynamic>> get itemOrderErrorStream;
  Stream<bool> get isLoadingStream;
  Stream<List<String>> get formPaymentOptionsStream;
  Stream<List<String>> get conditionPaymentStream;
  Stream<String?> get productErrorStream;
  Stream<String?> get amountErrorStream;
  Stream<String?> get unitValueErrorStream;
  Stream<List<ItemPedidoViewModel>> get itemOrderStream;
  void addItemOrder();
  void validateConditionPayment(String? conditionPayment);
  void validateFormPayment(String? formPayment);
  void calculateTotal();
  void removeItemOrder(ItemPedidoViewModel item);
  void validateProduct(String? product);
  void validateAmount(String? amount);
  void validateUnitValue(String? unitValue);
}