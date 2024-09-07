import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../create_order.dart';

class Total extends StatelessWidget {
  final OrderCreatePresenter presenter;
  const Total(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<double>(
        stream: presenter.totalStream,
        builder: (context, snapshot) {
          return Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: FlutterI18n.translate(context, 'create-order.total'),
                  style: const TextStyle(fontSize: 18, color: Colors.teal)
                ),
                TextSpan(
                  text: snapshot.data != null ? snapshot.data.toString() : '0',
                  style: const TextStyle(fontSize: 18)
                ),
              ]
            ),
          );
        }
      )
    );
  }
}