import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef DropdownItemBuilder<T> = Widget Function(T item);

class DropDownWidget<T> extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.builderItem,
  });

  final List<T> items;
  final DropdownItemBuilder<T> builderItem;

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  T? _valueSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<T>(
                value: item, child: widget.builderItem(item)))
            .toList(),
        value: _valueSelected,
        onChanged: (T? value) {
          setState(() {
            _valueSelected = value;
          });
        },
      ),
    );
  }
}
