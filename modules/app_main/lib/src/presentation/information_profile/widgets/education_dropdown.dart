import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum Education { thcs, thpt, dh }

extension EducationExt on Education {
  String getText() {
    switch (this) {
      case Education.thcs:
        return 'THCS';
      case Education.thpt:
        return 'THPT';
      case Education.dh:
        return 'Đại học';
    }
  }

  String toValue() {
    switch (this) {
      case Education.thcs:
        return 'THCS';
      case Education.thpt:
        return 'THPT';
      case Education.dh:
        return 'Đại học';
    }
  }
}

class EducationDropdown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const EducationDropdown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<EducationDropdown> createState() => _EducationDropdownState();
}

class _EducationDropdownState extends State<EducationDropdown> {
  Education value = Education.thcs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Học vấn",
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
        DropdownButtonFormField2<Education>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn học vấn.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: Education.values
              .map((item) => DropdownMenuItem<Education>(
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
              return 'Chọn học vấn .';
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
