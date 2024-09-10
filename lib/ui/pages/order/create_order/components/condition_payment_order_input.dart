import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../create_order.dart';

class ConditionPaymentOrderInput extends StatefulWidget {
  final OrderCreatePresenter presenter;
  const ConditionPaymentOrderInput(this.presenter, {super.key});

  @override
  State<ConditionPaymentOrderInput> createState() => _ConditionPaymentOrderInputState();
}

class _ConditionPaymentOrderInputState extends State<ConditionPaymentOrderInput> {
  final List<String> conditionPaymentOptions = ['A Vista', 'Debito', 'Credito', '30 dias'];
  late String dropdownvalue;

  @override
  void initState() {
    super.initState();
    dropdownvalue = conditionPaymentOptions.first; 
    widget.presenter.validateConditionPayment(dropdownvalue); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FlutterI18n.translate(context, 'create-order.conditionPayment'),
            style: const TextStyle(fontSize: 15, color: Colors.teal),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(8), 
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.teal),
                      items: conditionPaymentOptions.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() => dropdownvalue = newValue!);
                        widget.presenter.validateFormPayment(newValue);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
