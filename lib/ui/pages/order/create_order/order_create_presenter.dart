import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

abstract class OrderCreatePresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<String?> get createErrorStream;
  Stream<String?> get custumerErrorStream;
  Stream<List<dynamic>> get itemOrderErrorStream;
  Stream<String?> get productErrorStream;
  Stream<String?> get amountErrorStream;
  Stream<String?> get unitValueErrorStream;
  Stream<List<CreateItemOrderParams>> get itensOrderStream;
  Stream<double> get totalStream;
  Future<void> create();
  void addItemOrder();
  void removeItemOrder(CreateItemOrderParams item);
  void calculateTotal();
  void validateCustumer(String? custumer);
  void validateConditionPayment(String? conditionPayment);
  void validateFormPayment(String? formPayment);
  void validateProduct(String? product);
  void validateAmount(String? amount);
  void validateUnitValue(String? unitValue);
}