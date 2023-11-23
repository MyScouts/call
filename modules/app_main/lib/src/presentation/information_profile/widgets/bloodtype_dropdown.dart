import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BloodTypeDropDown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  final List<BloodGroup> bloodTypes;
  final BloodGroup value;
  const BloodTypeDropDown({
    super.key,
    required this.onChange,
    this.required = false,
    this.bloodTypes = const [],
    required this.value,
  });

  @override
  State<BloodTypeDropDown> createState() => _BloodTypeDropDownState();
}

class _BloodTypeDropDownState extends State<BloodTypeDropDown> {

  @override
  void didUpdateWidget(covariant BloodTypeDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.value != widget.value) {
      setState(() {});
    }
  }

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
        DropdownButtonFormField2<BloodGroup>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn nhóm máu.',
            style: TextStyle(fontSize: 14),
          ),
          value: widget.value,
          items: widget.bloodTypes
              .map((item) => DropdownMenuItem<BloodGroup>(
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
              return 'Chọn  nhóm máu.';
            }
            return null;
          },
          onChanged: (value) {
            if (value != null) {
              widget.onChange(value.name ?? '');
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
