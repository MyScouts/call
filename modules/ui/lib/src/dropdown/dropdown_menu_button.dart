import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'dropdown_button.dart';

class DropdownMenuButton<T> extends StatelessWidget {
  const DropdownMenuButton({
    super.key,
    required this.customButton,
    required this.items,
    required this.builder,
    this.onChanged,
    this.onTap,
    this.dropdownWidth = 189.0,
    this.itemHeight = 48,
  });

  final Widget customButton;
  final List<T> items;
  final DropdownItemBuilder<T> builder;
  final ValueChanged<T?>? onChanged;
  final void Function()? onTap;
  final double dropdownWidth;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          customButton: customButton,
          items: [
            ...items
                .map((e) => DropdownMenuItem<T>(
                      value: e,
                      child: builder(e),
                    ))
                .toList(),
          ],
          onChanged: (value) {
            onChanged?.call(value);
          },
          onMenuStateChange: (isOpen) {
            if (isOpen) {
              onTap?.call();
            }
          },
          dropdownStyleData: DropdownStyleData(
            width: dropdownWidth
          ),
        ),
      ),
    );
  }
}
