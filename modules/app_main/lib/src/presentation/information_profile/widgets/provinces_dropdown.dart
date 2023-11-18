import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ProvinceDropDown extends StatefulWidget {
  final Function(Province) onChange;
  final bool required;
  final List<Province> provinces;
  final Province? province;

  const ProvinceDropDown({
    super.key,
    required this.onChange,
    this.required = false,
    required this.provinces,
    this.province,
  });

  @override
  State<ProvinceDropDown> createState() => _ProvinceDropDownState();
}

class _ProvinceDropDownState extends State<ProvinceDropDown> {
  List<Province> _provinces = [];
  late Province _province;

  @override
  void initState() {
    _provinces = widget.provinces.map((e) {
      final name = e.name?.replaceAll('Tỉnh', '');
      return e.copyWith(name: name?.replaceAll('Thành phố', ''));
    }).toList();
    _province =
        _provinces.firstWhereOrNull((e) => e.id == widget.province?.id) ??
            _provinces.first;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProvinceDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.provinces != widget.provinces) {
      setState(() {});
    }
    if (oldWidget.province != widget.province) {
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
              "Tỉnh/thành",
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
        DropdownButtonFormField2<Province>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Chọn tỉnh thành.',
            style: TextStyle(fontSize: 14),
          ),
          value: _province,
          items: _provinces
              .map((item) => DropdownMenuItem<Province>(
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
            if (value == null) {
              return 'Chọn tình thành.';
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
      ],
    );
  }
}
