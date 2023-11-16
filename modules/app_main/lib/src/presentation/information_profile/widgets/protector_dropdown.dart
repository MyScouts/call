import 'package:app_main/src/domain/entities/bank.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ProtectorDropdown extends StatefulWidget {
  final Function(int) onChange;
  final bool required;
  final bool isDisable;
  final List<Protector> protectors;

  const ProtectorDropdown({
    super.key,
    required this.onChange,
    this.required = false,
    this.protectors = const [],
    this.isDisable = false,
  });

  @override
  State<ProtectorDropdown> createState() => _ProtectorDropdownState();
}

class _ProtectorDropdownState extends State<ProtectorDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Người bảo hộ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                // color: Color(0xFF353DFF),
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
        DropdownButtonFormField2<Protector>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn người bảo hộ.',
            style: TextStyle(fontSize: 14),
          ),
          value: widget.protectors.first,
          items: widget.protectors
              .map((item) => DropdownMenuItem<Protector>(
                    value: item,
                    child: Text(
                      item.name!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            print(value);
            if (value == null) {
              return 'Chọn người bảo hộ.';
            }
            return null;
          },
          onChanged: (value) {
            if (value != null && widget.isDisable) {
              widget.onChange(value.id!);
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
