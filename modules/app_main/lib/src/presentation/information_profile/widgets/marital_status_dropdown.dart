import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum MaritalStatus { single, married }

extension MaritalStatusExt on MaritalStatus {
  String getText() {
    switch (this) {
      case MaritalStatus.single:
        return 'Độc thân';
      case MaritalStatus.married:
        return 'Kết hôn';
    }
  }

  String toValue() {
    switch (this) {
      case MaritalStatus.single:
        return 'mar_1';
      case MaritalStatus.married:
        return 'mar_2';
    }
  }
}

class MaritalStatusDropDown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const MaritalStatusDropDown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<MaritalStatusDropDown> createState() => _MaritalStatusDropDownState();
}

class _MaritalStatusDropDownState extends State<MaritalStatusDropDown> {
  MaritalStatus value = MaritalStatus.single;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Tình trạng hôn nhân",
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
        DropdownButtonFormField2<MaritalStatus>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn tình trạng hôn nhân.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: MaritalStatus.values
              .map((item) => DropdownMenuItem<MaritalStatus>(
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
              return 'Chọn tình trạng hôn nhân.';
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
