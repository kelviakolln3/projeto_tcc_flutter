import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'create_product.dart';

class ProductCreatePage extends StatelessWidget {
  final ProductCreatePresenter presenter;
  const ProductCreatePage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'create-product.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CodeProductInput(presenter),
              NameProductInput(presenter),
              BarCodeInput(presenter),
              StockInput(presenter),
              GroupInput(presenter),
              MarkInput(presenter),
              SaleValueInput(presenter)
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