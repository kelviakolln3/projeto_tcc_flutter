import 'package:flutter/material.dart';

import '../../../ui.dart';

abstract class OrderEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<String?> get editErrorStream;
  Stream<OrderViewModel?> get orderStream;
  Stream<String?> get custumerErrorStream;
  Stream<String?> get conditionPaymentErrorStream;
  Stream<String?> get formPaymentErrorStream;
  Stream<List<dynamic>> get itemOrderErrorStream;
  Stream<bool> get isLoadingStream;
  void validateCustumer(String? custumer);
  void validateConditionPayment(String? conditionPayment);
  void validateFormPayment(String? formPayment);
}