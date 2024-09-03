import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../order_edit_presenter.dart';
import 'components.dart';

class EditAddItensOrderDialog extends StatelessWidget {
  final OrderEditPresenter presenter;
  const EditAddItensOrderDialog(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditProductInput(presenter),
          EditAmountInput(presenter),
          EditUnitValueInput(presenter)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => presenter.addItemOrder,
          child: Text(FlutterI18n.translate(context, 'save'), style: const TextStyle(fontSize: 15, color: Colors.teal)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(FlutterI18n.translate(context, 'close'), style: const TextStyle(fontSize: 15, color: Colors.teal)),
        ),
      ],
    );
  }
}