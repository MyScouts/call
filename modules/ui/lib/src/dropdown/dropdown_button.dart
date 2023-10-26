import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef DropdownItemBuilder<T> = Widget Function(T item);

class DropDownWidget<T> extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.builderItem,
    this.value,
    this.hintWidget,
    this.onChanged,
  });

  final List<T> items;
  final T? value;
  final DropdownItemBuilder<T> builderItem;
  final Widget? hintWidget;
  final ValueChanged<T?>? onChanged;

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  T? _valueSelected;

  @override
  void initState() {
    super.initState();
    _valueSelected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: widget.hintWidget ??
              const Padding(
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
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: widget.builderItem(item),
                ),
              )
              .toList(),
          value: _valueSelected,
          onChanged: (T? value) {
            setState(() {
              _valueSelected = value;
              widget.onChanged?.call(value);
            });
          },
        ),
      ),
    );
  }
}
