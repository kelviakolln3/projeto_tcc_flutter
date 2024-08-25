import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String translate;
  final String route;
  const MenuCard({required this.icon, required this.translate, required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal.withOpacity(0.4)),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, color: Colors.teal, size: 22),
              const SizedBox(width: 10),
              Text(FlutterI18n.translate(context, 'home.$translate'), style: const TextStyle(fontSize: 22, color: Colors.black)),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Get.toNamed(route),
                    icon: const Icon(Icons.arrow_right_outlined, color: Colors.teal, size: 32)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
