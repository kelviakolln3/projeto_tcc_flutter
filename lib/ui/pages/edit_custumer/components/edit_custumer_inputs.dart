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
        NameInput(presenter, custumer.nome),
        RgInput(presenter, custumer.rg),
        AddressInput(presenter, custumer.endereco),
        BirthdayInput(presenter, DateFormat('dd/MM/yyyy').format(DateTime.parse(custumer.dataNasc))),
        ContactInput(presenter, custumer.contato),
        EmailInput(presenter, custumer.email),
        ErrorCreate(presenter)
      ],
    );
  }
}