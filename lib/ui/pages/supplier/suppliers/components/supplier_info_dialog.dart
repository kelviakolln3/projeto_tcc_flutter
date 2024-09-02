import 'package:flutter/material.dart';
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
          child: const Text('fechar', style: TextStyle(fontSize: 15, color: Colors.teal)),
        ),
      ],
    );
  }
}