import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:projeto_tcc_flutter/ui/pages/login/components/errors_login.dart';
import 'package:projeto_tcc_flutter/ui/pages/login/components/login_button.dart';
import 'package:projeto_tcc_flutter/ui/pages/login/login.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginPage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.teal,
                Colors.green
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 350,
              height: 320,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: ListenableProvider(
                create: (_) => presenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FlutterI18n.translate(context, 'login.title'),
                      style: const TextStyle(fontSize: 20, color: Colors.white)),
                    const EmailInput(),
                    const PasswordInput(),
                    const LoginButton(),
                    const ErrorsLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
