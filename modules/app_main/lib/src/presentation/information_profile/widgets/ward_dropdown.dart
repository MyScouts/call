import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum Ward { phucla, phuthohoa }

extension WardExt on Ward {
  String getText() {
    switch (this) {
      case Ward.phucla:
        return 'Phúc La';
      case Ward.phuthohoa:
        return 'Phú Thọ Hoà';
    }
  }

  String toValue() {
    switch (this) {
      case Ward.phucla:
        return 'Phúc La';
      case Ward.phuthohoa:
        return 'Phú Thọ Hoà';
    }
  }
}

class WardDropDown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  const WardDropDown({
    super.key,
    required this.onChange,
    this.required = false,
  });

  @override
  State<WardDropDown> createState() => _WardDropDownState();
}

class _WardDropDownState extends State<WardDropDown> {
  Ward value = Ward.phucla;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Phường/huyện",
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
        DropdownButtonFormField2<Ward>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn phường xã.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: Ward.values
              .map((item) => DropdownMenuItem<Ward>(
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
              return 'Chọn phường xã.';
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
