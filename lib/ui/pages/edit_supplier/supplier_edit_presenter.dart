import 'package:flutter/material.dart';

import '../../ui.dart';

abstract class SupplierEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<SupplierViewModel?> get supplierStream;
  Stream<String?> get editErrorStream;
  Stream<String?> get codeErrorStream;
  Stream<String?> get activityErrorStream;
  Stream<String?> get enterpriseErrorStream;
  Stream<String?> get contactErrorStream;
  Stream<String?> get addressErrorStream;
  Stream<String?> get emailErrorStream;
  Stream<bool> get isLoadingStream;
  void validateCode(String? code);
  void validateActivity(String? activity);
  void validateEnterprise(String? enterprise);
  void validateContact(String? contact);
  void validateAddress(String? address);
  void validateEmail(String? email);
}