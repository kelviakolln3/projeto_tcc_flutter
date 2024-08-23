import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login.dart';

class ErrorsLogin extends StatelessWidget {
  const ErrorsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String?>(
      stream: presenter.loginErrorStream,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: snapshot.data != null ? 
            Text(snapshot.data!, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center,)
            : Container(),
        );
      }
    );
  }
}