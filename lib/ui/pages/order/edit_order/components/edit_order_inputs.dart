import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../order.dart';
import 'components.dart';

class EditOrderInputs extends StatelessWidget {
  final OrderViewModel order;
  final OrderEditPresenter presenter;
  const EditOrderInputs(this.order, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditConditionPaymentOrderInput(presenter, order.condicaoPagamento),
        EditFormPaymentOrderInput(presenter, order.formaPagamento),
        Text(FlutterI18n.translate(context, 'edit-itens-orders.itens'), style: const TextStyle(color: Colors.teal)),
        EditItensOrder(presenter),
        IconButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (context) => EditAddItensOrderDialog(presenter),
            );
          },
          icon: const Icon(Icons.add, color: Colors.teal),
        ),
      ],
    );
  }
}