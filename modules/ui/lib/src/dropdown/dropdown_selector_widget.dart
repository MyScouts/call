import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef DropdownItemSelectBuilder<T> = Widget Function(T item, bool isSelected);

class DropdownSelectorWidget<T> extends StatefulWidget {
  const DropdownSelectorWidget({
    super.key,
    required this.customButton,
    required this.items,
    required this.builder,
    this.onChanged,
    this.onTap,
    this.dropdownWidth = 189.0,
    this.selectedItems,
  });

  final Widget customButton;
  final List<T> items;
  final DropdownItemSelectBuilder<T> builder;
  final ValueChanged<List<T>>? onChanged;
  final void Function()? onTap;
  final double dropdownWidth;
  final List<T>? selectedItems;

  @override
  State<DropdownSelectorWidget<T>> createState() =>
      _DropdownSelectorWidgetState<T>();
}

class _DropdownSelectorWidgetState<T> extends State<DropdownSelectorWidget<T>> {
  List<T> selectedItems = [];

  @override
  void initState() {
    selectedItems.addAll(widget.selectedItems ?? <T>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          customButton: widget.customButton,
          isExpanded: true,
          items: [
            ...widget.items
                .map((item) => DropdownMenuItem<T>(
                      enabled: false,
                      value: item,
                      child: StatefulBuilder(builder: (context, menuSetState) {
                        final isSelected = selectedItems.contains(item);

                        return InkWell(
                          onTap: () {
                            isSelected
                                ? selectedItems.remove(item)
                                : selectedItems.add(item);
                            setState(() {});
                            menuSetState(() {});
                            widget.onChanged?.call(selectedItems);
                          },
                          child: widget.builder(item, isSelected),
                        );
                      }),
                    ))
                .toList(),
          ],
          onChanged: (value) {},
          onMenuStateChange: (isOpen) {
            if (isOpen) {
              widget.onTap?.call();
            }
          },
        ),
      ),
    );
  }
}
