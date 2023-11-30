import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/shared/widgets/common_button.dart';

class DatetimeFilterSheet extends StatefulWidget {
  final DateTime initialDateTime;
  final ValueChanged<DateTime> onDateSelected;

  const DatetimeFilterSheet({
    super.key,
    required this.onDateSelected,
    required this.initialDateTime,
  });

  @override
  State<DatetimeFilterSheet> createState() => _DatetimeFilterSheetState();
}

class _DatetimeFilterSheetState extends State<DatetimeFilterSheet> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            _buildDateSelector(),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: context.popNavigator,
            child: const Icon(
              Icons.close,
              color: Color(0xFF1D2B39),
              size: 24,
            ),
          ),
          Text(
            'Chọn ngày -  tháng - năm',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
              height: 24 / 16,
            ),
          ),
          Opacity(
            opacity: 0,
            child: GestureDetector(
              onTap: context.popNavigator,
              child: const Icon(
                Icons.close,
                color: Color(0xFF1D2B39),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDateSelector() {
    return SizedBox(
      height: 220,
      child: CupertinoDatePicker(
        onDateTimeChanged: (date) {
          selectedDate = date;
        },
        initialDateTime: widget.initialDateTime,
        mode: CupertinoDatePickerMode.date,
        maximumYear: DateTime.now().year,
        minimumYear: 2023,
      ),
    );
  }

  _buildConfirmButton() {
    return CommonButton(
      onPressed: () {
        widget.onDateSelected(selectedDate);
        context.popNavigator();
      },
      title: 'Xác nhận',
      width: double.infinity,
    );
  }
}
