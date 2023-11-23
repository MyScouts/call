import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/core.dart';

typedef DropdownItemBuilder<T> = Widget Function(T item);

class WalletDropDownWidget<T> extends StatefulWidget {
  const WalletDropDownWidget({
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
  State<WalletDropDownWidget<T>> createState() =>
      _WalletDropDownWidgetState<T>();
}

class _WalletDropDownWidgetState<T> extends State<WalletDropDownWidget<T>> {
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
          iconStyleData: IconStyleData(
            icon: ImageWidget(
              IconAppConstants.group,
              color: WalletTheme.blueCheckedColor,
            ),
            iconSize: 30,
          ),
          buttonStyleData: ButtonStyleData(
            height: 45,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.blue5,
              border: Border.all(color: WalletTheme.blueCheckedColor, width: 1),
            ),
            padding: const EdgeInsets.only(left: 10, right: 5),
            elevation: 0,
          ),
          alignment: Alignment.center,
          menuItemStyleData: const MenuItemStyleData(
            height: 45,
            padding: EdgeInsets.only(left: 15),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.blue5,
              border: Border.all(color: WalletTheme.blueCheckedColor, width: 1),
            ),
            elevation: 0,
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
            offset: const Offset(0, 8),
          ),
          barrierColor: Colors.transparent,
        ),
      ),
    );
  }
}
