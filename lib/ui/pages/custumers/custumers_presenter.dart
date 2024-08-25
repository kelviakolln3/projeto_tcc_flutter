import 'package:flutter/material.dart';

import 'custumers.dart';

abstract class CustumersPresenter implements Listenable{
  Stream<bool> get isLoadingStream;
  Stream<List<CustumerViewModel>> get custumersStream;
  Future<void> loadData();
}