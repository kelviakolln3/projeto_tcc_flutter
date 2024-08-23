import 'package:flutter/material.dart';

abstract class LoginPresenter implements Listenable {
  Stream<String?> get emailErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get loginErrorStream;

  void validateEmail(String? email);
  void validatePassword(String? password);
  void auth();
}