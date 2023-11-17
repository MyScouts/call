import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DistrictDropDown extends StatefulWidget {
  final Function(District) onChange;
  final bool required;
  final List<District> districts;
  const DistrictDropDown({
    super.key,
    required this.onChange,
    this.required = false,
    required this.districts,
  });

  @override
  State<DistrictDropDown> createState() => _DistrictDropDownState();
}

class _DistrictDropDownState extends State<DistrictDropDown> {
  List<District> _districts = [];
  
  @override
  void initState() {
    initDistrict();
    super.initState();
  }
  
  void initDistrict() {
    _districts = widget.districts.map((e) {
      String name = e.name?.replaceAll('Quận', '') ?? '';
      name = name.replaceAll('Huyện', '');
      name = name.replaceAll('Thành phố', '');
      name = name.replaceAll('Thành Phố', '');
      return e.copyWith(name: name);
    }).toList();
  }

  @override
  void didUpdateWidget(covariant DistrictDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.districts != widget.districts) {
      initDistrict();
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
        DropdownButtonFormField2<District>(
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
          value: _districts.first,
          items: _districts
              .map((item) => DropdownMenuItem<District>(
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
              return 'Chọn quận huyện.';
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
