import 'package:flutter/material.dart';

import '../../ui.dart';

abstract class CustumerEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<CustumerViewModel?> get custumerStream;
  Stream<String?> get editErrorStream;
  Stream<String?> get nameErrorStream;
  Stream<String?> get rgErrorStream;
  Stream<String?> get addressErrorStream;
  Stream<String?> get birthdayErrorStream;
  Stream<String?> get contactErrorStream;
  Stream<String?> get emailErrorStream;
  Stream<bool> get isLoadingStream;
  void valideteName(String? name);
  void valideteRG(String? rg);
  void valideteAddress(String? address);
  void valideteBirthday(String? birthday);
  void valideteContact(String? contact);
  void valideteEmail(String? email);
}