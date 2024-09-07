import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../orders.dart';
import 'components.dart';

class OrderList extends StatelessWidget {
  final List<OrderViewModel> viewModels;
  final OrdersPresenter presenter;
  const OrderList(this.viewModels, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    if (viewModels.isEmpty) {
      return Center(
        child: Text(FlutterI18n.translate(context, 'orders.no_orders'),
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
              height: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal.withOpacity(0.4)),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrderInfo(translate: 'dateCreation', info: DateFormat('dd/MM/yyyy').format(DateTime.parse(viewModels[index].dataCriacao))),
                        OrderInfo(translate: 'total', info: viewModels[index].total.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (context) => OrderInfoDialog(viewModels[index]),
                            );
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () => Get.toNamed('/supplier/edit/${viewModels[index].idPedido!}'),
                          icon: const Icon(Icons.edit_outlined, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () => presenter.delete(viewModels[index]),
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