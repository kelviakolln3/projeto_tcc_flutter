import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../products.dart';
import 'components.dart';

class ProductsList extends StatelessWidget {
  final List<ProductsViewModel> viewModels;
  final ProductsPresenter presenter;
  const ProductsList(this.viewModels, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    if (viewModels.isEmpty) {
      return Center(
        child: Text(FlutterI18n.translate(context, 'products.no_products'),
            style: const TextStyle(fontSize: 25)),
      );
    } else {
      return ListView.builder(
        itemCount: viewModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 145,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal.withOpacity(0.4)),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(translate: 'name', info: viewModels[index].nome),
                    ProductInfo(translate: 'bar-code', info: viewModels[index].codigoBarras),
                    ProductInfo(translate: 'stock', info: viewModels[index].estoque.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (context) => ProductInfoDialog(viewModels[index]),
                            );
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp, color: Colors.blue),
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit_outlined, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () => presenter.delete(viewModels[index].idProduto!),
                          icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}