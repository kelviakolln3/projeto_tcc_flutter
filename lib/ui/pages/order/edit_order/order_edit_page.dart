import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../../../mixins/mixins.dart';
import '../../pages.dart';
import 'components/components.dart';

class OrderEditPage extends StatefulWidget {
  final OrderEditPresenter presenter;
  const OrderEditPage(this.presenter, {super.key});

  @override
  State<OrderEditPage> createState() => _OrderEditPageState();
}

class _OrderEditPageState extends State<OrderEditPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'edit-order.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.find();

          return StreamBuilder<OrderViewModel?>(
            stream: widget.presenter.orderStream,
            builder: (context, snapshot) {
              if (snapshot.hasData || snapshot.data != null) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: SingleChildScrollView(child: EditOrderInputs(snapshot.data!, widget.presenter))
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