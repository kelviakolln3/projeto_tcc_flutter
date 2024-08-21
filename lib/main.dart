import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/login/login.dart';

void main() {
  runApp(const ProjetoTCC());
}

class ProjetoTCC extends StatelessWidget {
  const ProjetoTCC({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mini ERP',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
      ],
    );
  }
}
