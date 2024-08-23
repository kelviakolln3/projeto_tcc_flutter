import 'package:flutter/material.dart';
import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          'Mini ERP',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuCard(icon: Icons.person_2_outlined, translate: 'custumers'),
          MenuCard(icon: Icons.shopping_bag_outlined, translate: 'protucts'),
          MenuCard(icon: Icons.shopping_cart_outlined, translate: 'orders'),
          MenuCard(icon: Icons.store_outlined, translate: 'suppliers'),
        ],
      ),
    );
  }
}
