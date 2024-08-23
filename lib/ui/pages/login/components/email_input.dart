import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../login.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.white,
            style: const TextStyle(fontSize: 15, color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.white, width: 1.2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                borderSide: BorderSide(color: Colors.white, width: 1.2),
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
              prefixIcon: Icon(Icons.person_2_outlined, color: snapshot.data != null ? Colors.red : Colors.white),
              labelText: FlutterI18n.translate(context, 'login.email'),
              labelStyle: TextStyle(fontSize: 15, color: snapshot.data != null ? Colors.red : Colors.white),
            ),
          );
        }
      ),
    );
  }
}
