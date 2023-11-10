import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum Bank { vpbank, sacombank, mbbank, vietcombank, tpbank }

extension BankExt on Bank {
  String getText() {
    switch (this) {
      case Bank.vpbank:
        return 'VP Bank';
      case Bank.sacombank:
        return 'Sacombank';
      case Bank.mbbank:
        return 'MB Bank';
      case Bank.vietcombank:
        return 'Vietcombank';
      case Bank.tpbank:
        return 'TPBank';
    }
  }

  String toValue() {
    switch (this) {
      case Bank.vpbank:
        return 'VP Bank';
      case Bank.sacombank:
        return 'Sacombank';
      case Bank.mbbank:
        return 'MB Bank';
      case Bank.vietcombank:
        return 'Vietcombank';
      case Bank.tpbank:
        return 'TPBank';
    }
  }
}

class BankDropdown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const BankDropdown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<BankDropdown> createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  Bank value = Bank.vpbank;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Tên ngân hàng",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF212121),
                height: 20 / 14,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            widget.required
                ? Text(
                    ' *',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.red,
                        ),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 7),
        DropdownButtonFormField2<Bank>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn ngân hàng.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: Bank.values
              .map((item) => DropdownMenuItem<Bank>(
                    value: item,
                    child: Text(
                      item.getText(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            print(value);
            if (value == null) {
              return 'Chọn ngân hàng.';
            }
            return null;
          },
          onChanged: (value) {
            if (value != null) {
              widget.onChange(value.toValue());
              value = value;
              setState(() {});
            }
          },
          onSaved: (value) {
            value = value;
            setState(() {});
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
