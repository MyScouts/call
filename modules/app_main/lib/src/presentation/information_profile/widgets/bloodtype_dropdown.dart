import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum BloodType { a, b, ab, aplus, bplus, abplus }

extension BloodTypeExt on BloodType {
  String getText() {
    switch (this) {
      case BloodType.a:
        return 'A';
      case BloodType.b:
        return 'B';
      case BloodType.ab:
        return 'AB';
      case BloodType.aplus:
        return 'A+';
      case BloodType.bplus:
        return 'B+';
      case BloodType.abplus:
        return 'AB+';
    }
  }

  String toValue() {
    switch (this) {
      case BloodType.a:
        return 'A';
      case BloodType.b:
        return 'B';
      case BloodType.ab:
        return 'AB';
      case BloodType.aplus:
        return 'A+';
      case BloodType.bplus:
        return 'B+';
      case BloodType.abplus:
        return 'AB+';
    }
  }
}

class BloodTypeDropDown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const BloodTypeDropDown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<BloodTypeDropDown> createState() => _BloodTypeDropDownState();
}

class _BloodTypeDropDownState extends State<BloodTypeDropDown> {
  BloodType value = BloodType.a;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Nhóm máu",
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
        DropdownButtonFormField2<BloodType>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn tỉnh thành.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: BloodType.values
              .map((item) => DropdownMenuItem<BloodType>(
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
              return 'Chọn tình thành.';
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
