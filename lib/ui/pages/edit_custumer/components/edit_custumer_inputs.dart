import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../custumers/custumers.dart';
import '../edit_custumer.dart';
import 'components.dart';

class EditCustumerInputs extends StatelessWidget {
  final CustumerViewModel custumer;
  final CustumerEditPresenter presenter;
  const EditCustumerInputs(this.custumer, this.presenter,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditNameInput(presenter, custumer.nome),
        EditRgInput(presenter, custumer.rg),
        EditAddressInput(presenter, custumer.endereco),
        EditBirthdayInput(presenter, DateFormat('dd/MM/yyyy').format(DateTime.parse(custumer.dataNasc))),
        EditContactInput(presenter, custumer.contato),
        EditEmailInput(presenter, custumer.email),
        ErrorEditCustumer(presenter)
      ],
    );
  }
}