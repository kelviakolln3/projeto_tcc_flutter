import 'package:flutter/material.dart';

abstract class OrderCreatePresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<String?> get createErrorStream;
  Stream<String?> get custumerErrorStream;
  Stream<String?> get conditionPaymentErrorStream;
  Stream<String?> get formPaymentErrorStream;
  Stream<List<dynamic>> get itemOrderErrorStream;
  Stream<String?> get productErrorStream;
  Stream<String?> get amountErrorStream;
  Stream<String?> get unitValueErrorStream;
  Stream<List<String>> get formPaymentOptionsStream;
  Stream<List<String>> get conditionPaymentStream;
  Future<void> create();
  void addItemOrder();
  void calculateTotal();
  void validateCustumer(String? custumer);
  void validateConditionPayment(String? conditionPayment);
  void validateFormPayment(String? formPayment);
  void validateProduct(String? product);
  void validateAmount(String? amount);
  void validateUnitValue(String? unitValue);
}