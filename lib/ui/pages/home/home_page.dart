import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'home.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuCard(icon: Icons.person_2_outlined, translate: 'custumers', route: '/custumers'),
          MenuCard(icon: Icons.shopping_bag_outlined, translate: 'products', route: '/products'),
          MenuCard(icon: Icons.shopping_cart_outlined, translate: 'orders', route: '/orders'),
          MenuCard(icon: Icons.store_outlined, translate: 'suppliers', route: '/suppliers'),
        ],
      ),
    );
  }
}
