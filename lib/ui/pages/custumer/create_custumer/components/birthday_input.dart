import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../create_custumer.dart';

class BirthdayInput extends StatelessWidget {
  final CustumerCreatePresenter presenter;
  const BirthdayInput(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    final maskBirthday = MaskTextInputFormatter(mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.birthdayErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.teal,
            style: const TextStyle(fontSize: 15, color: Colors.teal),
            keyboardType: TextInputType.number,
            onChanged: presenter.valideteBirthday,
            inputFormatters: [maskBirthday],
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
              labelText: FlutterI18n.translate(context, 'create-custumer.birthday'),
              labelStyle: TextStyle(fontSize: 15, color: snapshot.data != null ? Colors.red : Colors.teal),
            ),
          );
        }
      ),
    );
  }
}