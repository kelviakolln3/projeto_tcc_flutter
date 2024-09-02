import 'package:flutter/material.dart';

abstract class SupplierCreatePresenter implements Listenable{
  Stream<bool> get isLoadingStream;
  Stream<String?> get createErrorStream;
  Stream<String?> get codeErrorStream;
  Stream<String?> get activityErrorStream;
  Stream<String?> get enterpriseErrorStream;
  Stream<String?> get contactErrorStream;
  Stream<String?> get addressErrorStream;
  Stream<String?> get emailErrorStream;
  Future<void> create();
  void validateCode(String? code);
  void validateActivity(String? activity);
  void validateEnterprise(String? enterprise);
  void validateContact(String? contact);
  void validateAddress(String? address);
  void validateEmail(String? email);
}