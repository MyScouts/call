import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

enum QuantityAction { decrement, increment }

// ignore: must_be_immutable
class QuantityButtonWidget extends StatefulWidget {
  final Function(int) onChange;
  int minVal;
  QuantityButtonWidget({
    super.key,
    required this.onChange,
    required this.minVal,
  });

  @override
  State<QuantityButtonWidget> createState() => _QuantityButtonWidgetState();
}

class _QuantityButtonWidgetState extends State<QuantityButtonWidget> {
  late ValueNotifier<int> _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier(widget.minVal);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _handleChange(QuantityAction.decrement),
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color:
                        value == 0 ? Colors.grey : context.theme.primaryColor,
                  ),
                ),
                child: Icon(
                  Icons.horizontal_rule,
                  size: 15,
                  color: value == 0 ? Colors.grey : context.theme.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
                child: Text(
              value.toString(),
              style: context.textTheme.titleSmall,
            )),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _handleChange(QuantityAction.increment),
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: context.theme.primaryColor),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _handleChange(QuantityAction action) {
    int quantity = _notifier.value;
    if (action == QuantityAction.decrement) {
      if (quantity > widget.minVal) {
        _notifier.value -= 1;
        widget.onChange(_notifier.value);
      }
    } else {
      _notifier.value += 1;
      widget.onChange(_notifier.value);
    }
  }
}
