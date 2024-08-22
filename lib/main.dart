import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            useCountryCode: true,
            basePath: 'assets/i18n',
            fallbackFile: 'pt_BR',
          ),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
