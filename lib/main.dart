import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'factories/pages/pages.dart';

void main() {
  runApp(const ProjetoTCC());
}

class ProjetoTCC extends StatelessWidget {
  const ProjetoTCC({super.key});
  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    return GetMaterialApp(
      title: 'Mini ERP',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      navigatorObservers: [routeObserver],
      getPages: [
        GetPage(name: '/login', page: makeLoginPage),
        GetPage(name: '/home', page: makeHomePage, transition: Transition.fadeIn),
        GetPage(name: '/custumers', page: makeCustumersPage, transition: Transition.fadeIn),
        GetPage(name: '/custumers/create', page: makeCustumerCreatePage, transition: Transition.fadeIn),
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
