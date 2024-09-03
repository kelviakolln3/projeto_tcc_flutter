import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../orders/orders.dart';
import '../edit_order.dart';
import 'components.dart';

class EditItensOrder extends StatelessWidget {
  final OrderEditPresenter presenter;
  const EditItensOrder(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<List<ItemPedidoViewModel>>(
        stream: presenter.itemOrderStream,
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data!.isEmpty) {
            return Text(FlutterI18n.translate(context, 'orders.no_itens_orders'),
            style: const TextStyle(fontSize: 25));
          }
          return Column(
            children: snapshot.data!.map((item) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 145,
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal.withOpacity(0.4)),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child:  Column(
                  children: [
                    EditItensOrderInfo(translate: 'itens-orders.product', info: item.idProduto.toString()),
                    EditItensOrderInfo(translate: 'itens-orders.amount', info: item.quantidade.toString()),
                    EditItensOrderInfo(translate: 'itens-orders.unitValue', info: item.valorUnitario.toString().replaceAll('.', ',')),
                    IconButton(
                      onPressed: () => presenter.removeItemOrder(item),
                      icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}