import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../edit_order.dart';

class EditAmountInput extends StatelessWidget {
  final OrderEditPresenter presenter;
  const EditAmountInput(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.amountErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.teal,
            style: const TextStyle(fontSize: 15, color: Colors.teal),
            keyboardType: TextInputType.number,
            onChanged: presenter.validateAmount,
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
              labelText: FlutterI18n.translate(context, 'edit-itens-orders.amount'),
              labelStyle: TextStyle(fontSize: 15, color: snapshot.data != null ? Colors.red : Colors.teal),
            ),
          );
        }
      ),
    );
  }
}