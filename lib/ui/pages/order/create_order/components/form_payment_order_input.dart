import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../create_order.dart';

class FormPaymentOrderInput extends StatefulWidget {
  final OrderCreatePresenter presenter;
  const FormPaymentOrderInput(this.presenter, {super.key});

  @override
  State<FormPaymentOrderInput> createState() => _FormPaymentOrderInputState();
}

class _FormPaymentOrderInputState extends State<FormPaymentOrderInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<List<String>>(
        stream: widget.presenter.formPaymentOptionsStream,
        builder: (context, snapshot) {
          String dropdownvalue = snapshot.data!.first;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FlutterI18n.translate(context, 'create-order.formPayment'),
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