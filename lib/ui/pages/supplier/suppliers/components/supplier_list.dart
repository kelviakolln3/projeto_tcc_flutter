import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import '../suppliers.dart';
import 'components.dart';

class SupplierList extends StatelessWidget {
  final List<SupplierViewModel> viewModels;
  final SuppliersPresenter presenter;
  const SupplierList(this.viewModels, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    if (viewModels.isEmpty) {
      return Center(
        child: Text(FlutterI18n.translate(context, 'suppliers.no_suppliers'),
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
                    SupplierInfo(translate: 'enterprise', info: viewModels[index].empresa),
                    SupplierInfo(translate: 'activity', info: viewModels[index].atividade),
                    SupplierInfo(translate: 'address', info: viewModels[index].endereco),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (context) => SupplierInfoDialog(viewModels[index]),
                            );
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () => Get.toNamed('/supplier/edit/${viewModels[index].idFornecedor!}'),
                          icon: const Icon(Icons.edit_outlined, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () => presenter.delete(viewModels[index].idFornecedor!),
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