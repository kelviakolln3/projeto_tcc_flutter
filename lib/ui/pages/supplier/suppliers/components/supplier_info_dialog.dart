import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../suppliers.dart';
import 'components.dart';

class SupplierInfoDialog extends StatelessWidget {
  final SupplierViewModel supplier;
  const SupplierInfoDialog(this.supplier, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SupplierInfo(translate: 'code', info: supplier.codigo.toString()),
          SupplierInfo(translate: 'activity', info: supplier.atividade),
          SupplierInfo(translate: 'enterprise', info: supplier.empresa),
          SupplierInfo(translate: 'contact', info: supplier.contato),
          SupplierInfo(translate: 'address', info: supplier.endereco),
          SupplierInfo(translate: 'email', info: supplier.email),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(FlutterI18n.translate(context, 'close'), style: const TextStyle(fontSize: 15, color: Colors.teal)),
        ),
      ],
    );
  }
}