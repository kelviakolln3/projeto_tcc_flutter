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
        GetPage(name: '/custumer/create', page: makeCustumerCreatePage, transition: Transition.fadeIn),
        GetPage(name: '/custumer/edit/:cliente_id', page: makeCustumerEditPage, transition: Transition.fadeIn),
        GetPage(name: '/products', page: makerProductsPage, transition: Transition.fadeIn),
        GetPage(name: '/product/create', page: makeProductCreatePage, transition: Transition.fadeIn),
        GetPage(name: '/product/edit/:produto_id', page: makeProductEditPage, transition: Transition.fadeIn),
        GetPage(name: '/suppliers', page: makeSuppliersPage, transition: Transition.fadeIn),
        GetPage(name: '/supplier/create', page: makeSupplierCreatePage, transition: Transition.fadeIn),
        GetPage(name: '/supplier/edit/:fornecedor_id', page: makeSupplierEditPage, transition: Transition.fadeIn),
        GetPage(name: '/orders', page: makeOrdersPage, transition: Transition.fadeIn),
        GetPage(name: '/order/create', page: makeOrderCreatePage, transition: Transition.fadeIn),
        GetPage(name: '/order/edit/:pedido_id', page: makeOrderEditPage, transition: Transition.fadeIn),
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
