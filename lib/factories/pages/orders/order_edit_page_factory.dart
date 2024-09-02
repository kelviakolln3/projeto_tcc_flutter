import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../factories.dart';

Widget makeOrderEditPage() => OrderEditPage(makeGetxOrderEditPresenter(Get.parameters['pedido_id'] ?? '0'));