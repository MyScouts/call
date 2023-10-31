import 'package:flutter/material.dart';

import 'checkbox_widget.dart';

typedef GroupCheckBoxBuilder = Widget Function(
    int index, CheckBoxWidget item, BoxConstraints constraints);

class GroupCheckBoxWidget<T> extends StatefulWidget {
  const GroupCheckBoxWidget({
    Key? key,
    this.onSelected,
    this.defaultValue,
    required this.values,
    this.numberOfRow,
    this.spacing = 8,
    this.error,
    this.isRadioType = false,
    this.checkBoxbuilder,
    this.groupCheckBoxBuilder,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  final ValueChanged<T?>? onSelected;
  final T? defaultValue;
  final Set<T> values;
  final int? numberOfRow;
  final double spacing;
  final Widget? error;
  final bool isRadioType;
  final CheckboxBuilder? checkBoxbuilder;
  final GroupCheckBoxBuilder? groupCheckBoxBuilder;
  final Axis direction;

  @override
  State<GroupCheckBoxWidget<T>> createState() => _GroupCheckBoxWidgetState();
}

class _GroupCheckBoxWidgetState<T> extends State<GroupCheckBoxWidget<T>> {
  T? _selectedValue;

  void _onSelected(bool isSelected, T? value) {
    if (isSelected) {
      _selectedValue = value;
      widget.onSelected?.call(_selectedValue);
    } else {
      _selectedValue = null;
      widget.onSelected?.call(null);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (widget.numberOfRow != null) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: widget.values.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.numberOfRow!,
              childAspectRatio: 16 / widget.numberOfRow!,
              crossAxisSpacing: widget.spacing,
              mainAxisSpacing: widget.spacing,
            ),
            itemBuilder: (context, index) {
              final item = widget.values.elementAt(index);
              final isSelected = _selectedValue == item;
              final widgetItem = CheckBoxWidget(
                text: item.toString(),
                isSelected: isSelected,
                hasUnselect: widget.isRadioType == false,
                onSelected: (bool isSelected) => _onSelected(isSelected, item),
                builder: widget.checkBoxbuilder,
              );
              if (widget.groupCheckBoxBuilder != null) {
                return widget.groupCheckBoxBuilder!
                    .call(index, widgetItem, constraints);
              }
              return widgetItem;
            },
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: widget.spacing,
              runSpacing: widget.spacing,
              direction: widget.direction,
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(widget.values.length, (index) {
                final item = widget.values.toList()[index];
                final widgetCheckBox = CheckBoxWidget(
                  text: item.toString(),
                  isSelected: _selectedValue == item,
                  hasUnselect: widget.isRadioType == false,
                  onSelected: (bool isSelected) =>
                      _onSelected(isSelected, item),
                  builder: widget.checkBoxbuilder,
                );

                if (widget.groupCheckBoxBuilder != null) {
                  return widget.groupCheckBoxBuilder!
                      .call(index, widgetCheckBox, constraints);
                }
                return widgetCheckBox;
              }),
            ),
            if (widget.error != null) widget.error!,
          ],
        );
      },
    );
  }
}
