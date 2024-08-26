import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

Widget makeCustumerEditPage() => CustumerEditPage(makeGetxCustumerEditPresenter(Get.parameters['cliente_id'] ?? '0'));