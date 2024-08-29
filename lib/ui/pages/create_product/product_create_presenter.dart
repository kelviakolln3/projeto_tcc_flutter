import 'package:flutter/material.dart';

abstract class ProductCreatePresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<String?> get createErrorStream;
  Stream<String?> get codeErrorStream;
  Stream<String?> get nameErrorStream;
  Stream<String?> get barCodeErrorStream;
  Stream<String?> get stockErrorStream;
  Stream<String?> get groupErrorStream;
  Stream<String?> get markErrorStream;
  Stream<String?> get saleValueErrorStream;
  Future<void> create();
  void validateCode(String? code);
  void valideteName(String? name);
  void valideteBarCode(String? barCode);
  void valideteStock(String? stock);
  void valideteGroup(String? group);
  void valideteMark(String? mark);
  void valideteSaleValue(String? saleValue);
}