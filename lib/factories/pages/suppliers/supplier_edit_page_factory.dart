import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../factories.dart';

Widget makeSupplierEditPage() => SupplierEditPage(makeGetxSupplierEditPresenter(Get.parameters['fornecedor_id'] ?? '0'));