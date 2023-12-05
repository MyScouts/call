import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

enum QuantityAction { decrement, increment }

// ignore: must_be_immutable
class QuantityButtonWidget extends StatelessWidget {
  final Function(int) onChange;
  QuantityButtonWidget({super.key, required this.onChange});

  final ValueNotifier<int> _notifier = ValueNotifier(1);

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
      if (quantity > 0) {
        _notifier.value -= 1;
        onChange(_notifier.value);
      }
    } else {
      _notifier.value += 1;
      onChange(_notifier.value);
    }
  }
}
