import 'package:flutter/material.dart';

class CustomRadioTitle<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget child;
  final Widget secondary;
  final Function(T?) onChanged;
  final bool reverse;

  const CustomRadioTitle({
    super.key,
    required this.onChanged,
    required this.child,
    required this.groupValue,
    required this.value,
    required this.secondary,
    this.reverse = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!reverse)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value) {},
                ),
              ),
            ),
          Expanded(
            child: Row(
              children: [
                secondary,
                Expanded(child: child),
              ],
            ),
          ),
          if (reverse)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value) {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}
