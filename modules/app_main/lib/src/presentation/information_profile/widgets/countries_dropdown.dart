import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CountriesDropdown extends StatefulWidget {
  final Function(Country) onChange;
  final bool required;
  final List<Country> countries;
  final bool enable;

  const CountriesDropdown({
    super.key,
    required this.onChange,
    this.required = false,
    required this.countries,
    this.enable = true,
  });

  @override
  State<CountriesDropdown> createState() => _CountriesDropdownState();
}

class _CountriesDropdownState extends State<CountriesDropdown> {
  List<Country> _countries = [];

  @override
  void initState() {
    _countries = widget.countries.map((e) => e).toList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CountriesDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enable != widget.enable) {
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
              "Quốc gia",
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
          child: DropdownButtonFormField2<Country>(
            isExpanded: true,
            decoration: InputDecoration(
              fillColor: widget.enable ? Colors.white : AppColors.grey70,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint: const Text(
              'Chọn quốc gia.',
              style: TextStyle(fontSize: 14),
            ),
            value: _countries.first,
            items: _countries
                .map(
                  (item) => DropdownMenuItem<Country>(
                    value: item,
                    child: Text(
                      item.name!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 1,
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Chọn quốc gia.';
              }
              return null;
            },
            onChanged: (value) {
              if (value != null) {
                widget.onChange(value);
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
