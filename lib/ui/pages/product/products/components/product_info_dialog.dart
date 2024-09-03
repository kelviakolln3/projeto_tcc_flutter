import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../products.dart';
import 'components.dart';

class ProductInfoDialog extends StatelessWidget {
  final ProductViewModel product;
  const ProductInfoDialog(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductInfo(translate: 'name', info: product.nome),
          ProductInfo(translate: 'bar-code', info: product.codigoBarras),
          ProductInfo(translate: 'stock', info: product.estoque.toString()),
          ProductInfo(translate: 'group', info: product.grupo),
          ProductInfo(translate: 'mark', info: product.marca),
          ProductInfo(translate: 'sale-value', info: product.valorVenda.toString()),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(FlutterI18n.translate(context, 'close'), style: const TextStyle(fontSize: 15, color: Colors.teal)),
        ),
      ],
    );
  }
}