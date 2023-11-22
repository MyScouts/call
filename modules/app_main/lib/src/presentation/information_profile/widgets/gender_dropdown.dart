import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final Function(int) onChange;
  final bool required;
  final List<Gender> genders;
  final bool disable;

  const GenderDropdown({
    super.key,
    required this.onChange,
    this.required = false,
    this.genders = const [],
    this.disable = false,
  });

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  @override
  void didUpdateWidget(covariant GenderDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.disable != widget.disable) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disable,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              const Text(
                "Giới tính",
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
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.red,
                              ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField2<Gender>(
            isExpanded: true,
            decoration: InputDecoration(
              fillColor: !widget.disable ? Colors.white : AppColors.grey70,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: !widget.disable
                      ? const BorderSide()
                      : const BorderSide(color: AppColors.grey70)),
            ),
            hint: const Text(
              'Chọn giới tính.',
              style: TextStyle(fontSize: 14),
            ),
            value: widget.genders.first,
            items: widget.genders.isNotEmpty
                ? widget.genders
                    .map((item) => DropdownMenuItem<Gender>(
                          value: item,
                          child: Text(
                            item.value!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList()
                : [],
            validator: (value) {
              if (kDebugMode) {
                print(value);
              }
              if (value == null) {
                return 'Chọn giới tính.';
              }
              return null;
            },
            onChanged: (value) {
              if (value != null) {
                widget.onChange(value.key!);
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
      ),
    );
  }
}
