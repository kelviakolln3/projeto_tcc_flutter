import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return GestureDetector(
      onTap: presenter.auth,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Center(
          child: Text(FlutterI18n.translate(context, 'login.submit'),
              style: const TextStyle(fontSize: 15, color: Colors.white)),
        ),
      ),
    );
  }
}
