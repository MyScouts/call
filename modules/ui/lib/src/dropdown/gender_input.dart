import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum GenderType { male, female, other }

extension GenderTypeExt on GenderType? {
  String? getText() {
    switch (this) {
      case GenderType.male:
        return 'Nam';
      case GenderType.female:
        return 'Nữ';
      case GenderType.other:
        return 'Khác';
      default:
        return null;
    }
  }

  int? toValue() {
    switch (this) {
      case GenderType.male:
        return 1;
      case GenderType.female:
        return 0;
      case GenderType.other:
        return 2;
      default:
        return null;
    }
  }
}

extension IntExt on int {
  GenderType? toGender() {
    switch (this) {
      case 1:
        return GenderType.male;
      case 0:
        return GenderType.female;
      case 2:
        return GenderType.other;
      default:
        return null;
    }
  }
}

class GenderInput extends StatefulWidget {
  final Function(int?) onChange;
  final bool required;
  final bool disabled;
  final GenderType? initVal;
  const GenderInput({
    super.key,
    required this.onChange,
    this.required = false,
    this.disabled = false,
    this.initVal,
  });

  @override
  State<GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  GenderType? value;

  @override
  void initState() {
    super.initState();
    if (widget.initVal != null) {
      value = widget.initVal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Giới tính",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
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
        DropdownButtonFormField2<GenderType>(
          isExpanded: true,
          decoration: InputDecoration(
            fillColor: widget.disabled ? Colors.grey[200] : Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn giới tính.',
            style: TextStyle(fontSize: 14),
          ),
          value: value,
          items: GenderType.values
              .map((item) => DropdownMenuItem<GenderType>(
                    value: item,
                    child: Text(
                      item.getText() ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: widget.disabled
              ? null
              : (value) {
                  if (value == null) {
                    return 'Chọn giới tính.';
                  }
                  return null;
                },
          onChanged: widget.disabled
              ? null
              : (value) {
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
