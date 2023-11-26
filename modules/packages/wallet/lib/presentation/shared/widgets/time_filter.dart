import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../wallet_constant.dart';
import '../shared.dart';

class TimeFilterButton extends StatefulWidget {
  final DateTime? defaultDate;
  final ValueChanged<DateTime> onChanged;

  const TimeFilterButton({
    required this.onChanged,
    this.defaultDate,
    Key? key,
  }) : super(key: key);

  @override
  State<TimeFilterButton> createState() => _TimeFilterButtonState();
}

class _TimeFilterButtonState extends State<TimeFilterButton> {
  late DateTime currentDate;

  set setCurrentDate(DateTime value) => currentDate = value;

  @override
  void initState() {
    setCurrentDate = widget.defaultDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WalletDropDownWidget(
          value: currentDate.month,
          items: WalletConstant.monthFilter,
          onChanged: (value) {
            final newCurrentDate = currentDate.copyWith(month: value);
            setCurrentDate = newCurrentDate;
            widget.onChanged(currentDate);
          },
          hintWidget: Text(
            'Tháng',
            style: context.text.bodyMedium!.copyWith(
              color: WalletTheme.black,
            ),
          ),
          builderItem: (item) => Text(
            '$item',
            style: context.text.bodyMedium!.copyWith(
              color: WalletTheme.black,
            ),
          ),
        ),
        const SizedBox(width: 4),
        WalletDropDownWidget(
          value: currentDate.year,
          items: WalletConstant.yearFilter.reversed.toList(),
          onChanged: (value) {
            final newCurrentDate = currentDate.copyWith(year: value);
            setCurrentDate = newCurrentDate;
            widget.onChanged(currentDate);
          },
          hintWidget: Text(
            'Năm',
            style: context.text.bodyMedium!.copyWith(
              color: WalletTheme.black,
            ),
          ),
          builderItem: (item) => Text(
            '$item',
            style: context.text.bodyMedium!.copyWith(
              color: WalletTheme.black,
            ),
          ),
        ),
      ],
    );
  }
}
