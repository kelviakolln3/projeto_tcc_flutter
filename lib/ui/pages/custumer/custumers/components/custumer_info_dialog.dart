import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
import '../custumers.dart';
import 'components.dart';

class CustumerInfoDialog extends StatelessWidget {
  final CustumerViewModel custumer;
  const CustumerInfoDialog(this.custumer, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustumerInfo(translate: 'name', info: custumer.nome),
          CustumerInfo(translate: 'cpf', info: custumer.cpf),
          CustumerInfo(translate: 'rg', info: custumer.rg),
          CustumerInfo(translate: 'address', info: custumer.endereco),
          CustumerInfo(translate: 'birthday', info: DateFormat('dd/MM/yyyy').format(DateTime.parse(custumer.dataNasc))),
          CustumerInfo(translate: 'contact', info: custumer.contato),
          CustumerInfo(translate: 'email', info: custumer.email),
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