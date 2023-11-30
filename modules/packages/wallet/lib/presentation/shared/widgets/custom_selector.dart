import 'package:flutter/cupertino.dart';

class CustomSelector<T> extends StatefulWidget {
  final double itemExtent;
  final void Function(int) onSelectedItemChanged;
  final List<T> values;
  final int selectedValueIndex;
  final TextStyle? selectedStyle;
  final TextStyle? unselectedStyle;
  final TextStyle? disabledStyle;
  final bool Function(int) isDisabled;
  final FixedExtentScrollController scrollController;
  final Color backgroundColor;

  const CustomSelector({
    super.key,
    required this.itemExtent,
    required this.onSelectedItemChanged,
    required this.values,
    required this.selectedValueIndex,
    this.selectedStyle,
    this.unselectedStyle,
    required this.isDisabled,
    this.disabledStyle,
    required this.scrollController,
    required this.backgroundColor,
  });

  @override
  State<CustomSelector> createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker.builder(
      childCount: widget.values.length,
      itemExtent: widget.itemExtent,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      scrollController: widget.scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: widget.itemExtent,
          alignment: Alignment.center,
          child: Text(
            '${widget.values[index]}',
            style: index == widget.selectedValueIndex
                ? widget.selectedStyle
                : widget.isDisabled(index)
                    ? widget.disabledStyle
                    : widget.unselectedStyle,
          ),
        );
      },
    );
  }
}
