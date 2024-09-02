import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'create_supplier.dart';

class SupplierCreatePage extends StatelessWidget {
  final SupplierCreatePresenter presenter;
  const SupplierCreatePage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'create-supplier.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CodeSupplierInput(presenter),
              ActivitySupplierInput(presenter),
              EnterpriseSupplierInput(presenter),
              ContactSupplierInput(presenter),
              AddressSupplierInput(presenter),
              EmailSupplierInput(presenter)
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