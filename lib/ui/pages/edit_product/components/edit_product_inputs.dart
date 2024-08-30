import 'package:flutter/material.dart';

import '../../products/products.dart';
import '../edit_product.dart';

class EditProductInputs extends StatelessWidget {
  final ProductViewModel product;
  final ProductEditPresenter presenter;
  const EditProductInputs(this.product, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditNameProductInput(presenter, product.nome),
        EditBarCodeInput(presenter, product.codigoBarras),
        EditStockInput(presenter, product.estoque.toString()),
        EditSaleValueInput(presenter, product.valorVenda.toString().replaceAll('.', ',')),
        EditGroupInput(presenter, product.grupo),
        EditMarkInput(presenter, product.marca),
        ErrorEditProduct(presenter),
      ],
    );
  }
}