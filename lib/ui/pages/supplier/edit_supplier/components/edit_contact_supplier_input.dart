import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../edit_supplier.dart';

class EditContactSupplierInput extends StatelessWidget {
  final SupplierEditPresenter presenter;
  final String contact;
  const EditContactSupplierInput(this.presenter, this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    final maskContact = MaskTextInputFormatter(mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.codeErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.teal,
            style: const TextStyle(fontSize: 15, color: Colors.teal),
            keyboardType: TextInputType.number,
            onChanged: presenter.validateContact,
            inputFormatters: [maskContact],
            initialValue: contact,
            decoration: InputDecoration(
              fillColor: Colors.teal,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.teal, width: 1.2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.teal, width: 1.2),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.2),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.2),
              ),
              errorText: snapshot.data,
              labelText: FlutterI18n.translate(context, 'edit-supplier.contact'),
              labelStyle: TextStyle(fontSize: 15, color: snapshot.data != null ? Colors.red : Colors.teal),
            ),
          );
        }
      ),
    );
  }
}