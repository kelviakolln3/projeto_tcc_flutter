import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../mixins/mixins.dart';
import 'components/components.dart';
import 'orders.dart';

class OrdersPage extends StatefulWidget {
  final OrdersPresenter presenter;
  const OrdersPage(this.presenter, {super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'orders.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.loadData();

          return StreamBuilder<List<OrderViewModel>>(
            stream: widget.presenter.ordersStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ReloadScreen(error: '${snapshot.error}', reload: widget.presenter.loadData);
              }
              if (snapshot.hasData) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: OrderList(snapshot.data!, widget.presenter)
                );
              }
              return const SizedBox(height: 0);
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/order/create'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white, size: 25),
      ),
    );
  }
}