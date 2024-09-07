import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
import '../orders.dart';
import 'components.dart';

class OrderInfoDialog extends StatelessWidget {
  final OrderViewModel order;
  const OrderInfoDialog(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderInfo(translate: 'custumer', info: order.idCliente.toString()),
            OrderInfo(translate: 'dateCreation', info: DateFormat('dd/MM/yyyy').format(DateTime.parse(order.dataCriacao))),
            OrderInfo(translate: 'conditionPayment', info: order.condicaoPagamento),
            OrderInfo(translate: 'formPayment', info: order.formaPagamento),
            OrderInfo(translate: 'total', info: order.total.toString().replaceAll('.', ',')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(FlutterI18n.translate(context, 'orders.itens-orders.title'), style: const TextStyle(color: Colors.teal)),
            ),
            Column(
              children: order.itemPedidoBeans.map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.withOpacity(0.4)),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderInfo(translate: 'itens-orders.product', info: item.idProduto.toString()),
                      OrderInfo(translate: 'itens-orders.amount', info: item.quantidade.toString()),
                      OrderInfo(translate: 'itens-orders.unitValue', info: item.valorUnitario.toString().replaceAll('.', ',')),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
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