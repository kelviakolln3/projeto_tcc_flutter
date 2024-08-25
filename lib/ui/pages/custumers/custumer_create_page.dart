import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'components/components.dart';
import 'custumers.dart';

class CustumerCreatePage extends StatelessWidget {
  final CustumerCreatePresenter presenter;
  const CustumerCreatePage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'create-custumer.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CodeInput(presenter),
              NameInput(presenter),
              CpfInput(presenter),
              RgInput(presenter),
              AddressInput(presenter),
              BirthdayInput(presenter),
              ContactInput(presenter),
              EmailInput(presenter),
              ErrorCreate(presenter)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => presenter.create(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.check, color: Colors.white, size: 25),
      ),
    );
  }
}