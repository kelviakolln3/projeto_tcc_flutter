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
  final List<String> formPaymentOptions = ['Dinheiro', 'Cartão', 'Boleto', 'Pix'];
  late String dropdownvalue; 

  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.formPayment; 
    widget.presenter.validateFormPayment(dropdownvalue); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FlutterI18n.translate(context, 'edit-order.formPayment'),
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
                      items: formPaymentOptions.map((String items) {
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