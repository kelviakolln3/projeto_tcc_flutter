import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../edit_product.dart';

class EditStockInput extends StatelessWidget {
  final ProductEditPresenter presenter;
  final String stock;
  const EditStockInput(this.presenter, this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.stockErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.teal,
            style: const TextStyle(fontSize: 15, color: Colors.teal),
            keyboardType: TextInputType.text,
            onChanged: presenter.valideteStock,
            initialValue: stock,
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
              labelText: FlutterI18n.translate(context, 'create-product.stock'),
              labelStyle: TextStyle(fontSize: 15, color: snapshot.data != null ? Colors.red : Colors.teal),
            ),
          );
        }
      ),
    );
  }
}