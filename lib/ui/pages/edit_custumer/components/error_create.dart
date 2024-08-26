import 'package:flutter/material.dart';

import '../edit_custumer.dart';

class ErrorCreate extends StatelessWidget {
  final CustumerEditPresenter presenter;
  const ErrorCreate(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<String?>(
        stream: presenter.editErrorStream,
        builder: (context, snapshot) {
          return  Padding(
            padding: const EdgeInsets.all(15),
            child: snapshot.data != null ? 
              Text(snapshot.data!, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center)
              : Container(),
          );
        }
      ),
    );
  }
}