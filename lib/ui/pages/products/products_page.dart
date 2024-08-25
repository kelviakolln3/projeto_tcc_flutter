import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../mixins/mixins.dart';
import 'components/components.dart';
import 'products.dart';

class ProductsPage extends StatefulWidget {
  final ProductsPresenter presenter;

  const ProductsPage(this.presenter, {super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'products.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.loadData();

          return StreamBuilder<List<ProductsViewModel>>(
            stream: widget.presenter.productsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ReloadScreen(error: '${snapshot.error}', reload: widget.presenter.loadData);
              }
              if (snapshot.hasData) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: ProductsList(snapshot.data!, widget.presenter)
                );
              }
              return const SizedBox(height: 0);
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/custumers/create'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white, size: 25),
      ),
    );
  }
}