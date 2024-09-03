import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../edit_order.dart';

class EditFormPaymentOrderInput extends StatefulWidget {
  final OrderEditPresenter presenter;
  final String formPayment;
  const EditFormPaymentOrderInput(this.presenter, this.formPayment, {super.key});

  @override
  State<EditFormPaymentOrderInput> createState() => _EditFormPaymentOrderInputState();
}

class _EditFormPaymentOrderInputState extends State<EditFormPaymentOrderInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<List<String>>(
        stream: widget.presenter.formPaymentOptionsStream,
        builder: (context, snapshot) {
          String dropdownvalue = widget.formPayment;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FlutterI18n.translate(context, 'edit-order.formPayment'),
                style: const TextStyle(fontSize: 15, color: Colors.teal),
              ),
              const SizedBox(height: 8),
              DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.teal),
                items: snapshot.data?.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  widget.presenter.validateFormPayment(newValue);
                  setState(() => dropdownvalue = newValue!);
                },
              ),
            ],
          );
        }
      ),
    );
  }
}