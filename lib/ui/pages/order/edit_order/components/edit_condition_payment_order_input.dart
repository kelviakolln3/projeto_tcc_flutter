import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../edit_order.dart';

class EditConditionPaymentOrderInput extends StatefulWidget {
  final OrderEditPresenter presenter;
  final String conditionPayment;
  const EditConditionPaymentOrderInput(this.presenter, this.conditionPayment, {super.key});

  @override
  State<EditConditionPaymentOrderInput> createState() => _EditConditionPaymentOrderInputState();
}

class _EditConditionPaymentOrderInputState extends State<EditConditionPaymentOrderInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<List<String>>(
        stream: widget.presenter.conditionPaymentStream,
        builder: (context, snapshot) {
          String dropdownvalue = widget.conditionPayment;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FlutterI18n.translate(context, 'edit-order.conditionPayment'),
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
                  widget.presenter.validateConditionPayment(newValue);
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