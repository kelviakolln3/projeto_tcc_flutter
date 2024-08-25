import 'package:flutter/material.dart';

abstract class CustumerCreatePresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<String?> get createErrorStream;
  Stream<String?> get codeErrorStream;
  Stream<String?> get nameErrorStream;
  Stream<String?> get cpfErrorStream;
  Stream<String?> get rgErrorStream;
  Stream<String?> get addressErrorStream;
  Stream<String?> get birthdayErrorStream;
  Stream<String?> get contactErrorStream;
  Stream<String?> get emailErrorStream;
  Future<void> create();
  void validateCode(String? code);
  void valideteName(String? name);
  void valideteCPF(String? cpf);
  void valideteRG(String? rg);
  void valideteAddress(String? address);
  void valideteBirthday(String? birthday);
  void valideteContact(String? contact);
  void valideteEmail(String? email);
}