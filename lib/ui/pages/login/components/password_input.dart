import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../login.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Colors.white,
            style: const TextStyle(fontSize: 15, color: Colors.white),
            obscureText: true,
            onChanged: presenter.validatePassword,
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
              prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
              labelText: FlutterI18n.translate(context, 'login.password'),
              labelStyle: const TextStyle(fontSize: 15, color: Colors.white),
              errorText: snapshot.data,
            ),
          );
        }
      ),
    );
  }
}
