import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class EditItensOrderInfo extends StatelessWidget {
  final String translate;
  final String info;
  const EditItensOrderInfo({required this.translate, required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: FlutterI18n.translate(context, 'orders.$translate'),
            style: const TextStyle(fontSize: 18, color: Colors.teal)
          ),
          TextSpan(
            text: info,
            style: const TextStyle(fontSize: 18)
          ),
        ]
      ),
    );
  }
}