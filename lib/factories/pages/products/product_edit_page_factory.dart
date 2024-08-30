import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

Widget makeProductEditPage() => ProductEditPage(makeGetxProductEditPresenter(Get.parameters['produto_id'] ?? '0'));