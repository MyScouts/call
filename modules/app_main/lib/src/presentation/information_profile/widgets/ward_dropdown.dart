import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WardDropDown extends StatefulWidget {
  final Function(Ward) onChange;
  final bool required;
  final List<Ward> wards;

  const WardDropDown({
    super.key,
    required this.onChange,
    this.required = false,
    required this.wards,
  });

  @override
  State<WardDropDown> createState() => _WardDropDownState();
}

class _WardDropDownState extends State<WardDropDown> {
  List<Ward> _wards = [];

  @override
  void initState() {
    initWard();
    super.initState();
  }

  void initWard() {
    _wards = widget.wards.map((e) {
      String name = e.name?.replaceAll('Thị trấn', '') ?? '';
      name = name.replaceAll('Thị Trấn', '');
      name = name.replaceAll('Xã', '');
      name = name.replaceAll('Phường', '');
      return e.copyWith(name: name);
    }).toList();
  }

  @override
  void didUpdateWidget(covariant WardDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.wards != widget.wards) {
      initWard();
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
              "Phường/xã",
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
          value: _wards.first,
          items: _wards
              .map((item) => DropdownMenuItem<Ward>(
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
              return 'Chọn phường xã.';
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
