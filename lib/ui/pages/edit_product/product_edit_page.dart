import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import '../../mixins/mixins.dart';
import '../pages.dart';
import 'components/components.dart';


class ProductEditPage extends StatefulWidget {
  final ProductEditPresenter presenter;
  const ProductEditPage(this.presenter, {super.key});

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'edit-product.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.find();

          return StreamBuilder<ProductViewModel?>(
            stream: widget.presenter.productStream,
            builder: (context, snapshot) {
              if (snapshot.hasData || snapshot.data != null) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: SingleChildScrollView(child: EditProductInputs(snapshot.data!, widget.presenter))
                );
              }
              return const SizedBox(height: 0);
            },
          );
        },  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.presenter.edit(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.check, color: Colors.white, size: 25),
      ),
    );
  }
}