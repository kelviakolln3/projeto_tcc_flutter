import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'components/components.dart';
import 'create_order.dart';

class OrderCreatePage extends StatelessWidget {
  final OrderCreatePresenter presenter;
  const OrderCreatePage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'create-order.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustumerOrderInput(presenter),
              ConditionPaymentOrderInput(presenter),
              FormPaymentOrderInput(presenter),
              Text(FlutterI18n.translate(context, 'create-itens-orders.itens'), style: const TextStyle(color: Colors.teal)),
              ItensOrder(presenter),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AddItensOrderDialog(presenter),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.teal),
              ),
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