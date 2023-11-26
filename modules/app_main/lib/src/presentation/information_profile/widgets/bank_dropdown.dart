import 'package:app_main/src/domain/entities/bank.dart';
import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BankDropdown extends StatefulWidget {
  final Function(String) onChange;
  final bool required;
  final List<Bank> banks;
  final bool enable;

  const BankDropdown({
    super.key,
    required this.onChange,
    this.required = false,
    this.banks = const [],
    this.enable = true,
  });

  @override
  State<BankDropdown> createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {

  @override
  void didUpdateWidget(covariant BankDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.enable != oldWidget.enable) {
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
        IgnorePointer(
          ignoring: !widget.enable,
          child: DropdownButtonFormField2<Bank>(
            isExpanded: true,
            decoration: InputDecoration(
              fillColor: widget.enable ? Colors.white : AppColors.grey70,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint: const Text(
              'Chọn ngân hàng.',
              style: TextStyle(fontSize: 14),
            ),
            value: widget.banks.first,
            items: widget.banks
                .map((item) => DropdownMenuItem<Bank>(
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
                return 'Chọn ngân hàng.';
              }
              return null;
            },
            onChanged: (value) {
              if (value != null) {
                widget.onChange(value.name!);
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
        ),
      ],
    );
  }
}
