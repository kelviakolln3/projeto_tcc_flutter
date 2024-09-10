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
  final List<String> conditionPaymentOptions = ['A Vista', 'Débito', 'Crédito', '30 dias'];
  late String dropdownvalue;

  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.conditionPayment; 
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
            FlutterI18n.translate(context, 'edit-order.conditionPayment'),
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
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.teal),
                      items: conditionPaymentOptions.map((String items) {
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