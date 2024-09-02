import 'package:flutter/material.dart';
import '../../supplier.dart';

class EditSupplierInputs extends StatelessWidget {
  final SupplierViewModel supplier;
  final SupplierEditPresenter presenter;
  const EditSupplierInputs(this.supplier, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditCodeSupplierInput(presenter, supplier.codigo.toString()),
        EditActivitySupplierInput(presenter, supplier.atividade),
        EditEnterpriseSupplierInput(presenter, supplier.empresa),
        EditContactSupplierInput(presenter, supplier.contato),
        EditAddressSupplierInput(presenter, supplier.endereco),
        EditEmailSupplierInput(presenter, supplier.email)
      ],
    );
  }
}