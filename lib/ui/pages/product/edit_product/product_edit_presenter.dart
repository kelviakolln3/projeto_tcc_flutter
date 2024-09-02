import 'package:flutter/material.dart';

import '../../../ui.dart';

abstract class ProductEditPresenter implements Listenable {
  Future<void> find();
  Future<void> edit();
  Stream<ProductViewModel?> get productStream;
  Stream<String?> get editErrorStream;
  Stream<String?> get nameErrorStream;
  Stream<String?> get barCodeErrorStream;
  Stream<String?> get stockErrorStream;
  Stream<String?> get groupErrorStream;
  Stream<String?> get markErrorStream;
  Stream<String?> get saleValueErrorStream;
  Stream<bool> get isLoadingStream;
  void valideteName(String? name);
  void valideteBarCode(String? barCode);
  void valideteStock(String? stock);
  void valideteGroup(String? group);
  void valideteMark(String? mark);
  void valideteSaleValue(String? saleValue);
}