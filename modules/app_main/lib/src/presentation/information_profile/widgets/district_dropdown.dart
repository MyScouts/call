import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum Distric { hadong, tanphu }

extension DistricExt on Distric {
  String getText() {
    switch (this) {
      case Distric.hadong:
        return 'Hà Đông';
      case Distric.tanphu:
        return 'Tân Phú';
    }
  }

  String toValue() {
    switch (this) {
      case Distric.hadong:
        return 'Phúc La';
      case Distric.tanphu:
        return 'Tân Phú';
    }
  }
}

class DistrictDropDown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const DistrictDropDown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<DistrictDropDown> createState() => _DistrictDropDownState();
}

class _DistrictDropDownState extends State<DistrictDropDown> {
  Distric value = Distric.hadong;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Quận/huyện",
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
        DropdownButtonFormField2<Distric>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn quận huyện.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: Distric.values
              .map((item) => DropdownMenuItem<Distric>(
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
              return 'Chọn quận huyện.';
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
