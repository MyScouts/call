// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../ui.dart';

class InputDateTimeWidgetConst {
  static const double defaultPickerSheetHeight = 226.0;
}

class InputDateTimeWidget extends StatefulWidget {
  final DateTime? date;
  final DateTime? max;
  final DateTime? min;
  final ValueChanged<DateTime?>? onChange;
  final InputDecoration? decoration;
  final String Function(DateTime) formatText;
  final BoxShadow? shadow;
  final double radius;
  final String? hintText;
  final bool useHorizontalLayout;
  final bool displayValueIsLabel;
  final TextEditingController? controller;
  final bool enabled;

  /// Form
  final AutovalidateMode autovalidateMode;
  final ValueNotifier<bool>? focusController;
  final FormFieldValidator<String>? validator;
  final bool autovalidate;

  const InputDateTimeWidget({
    Key? key,
    this.date,
    this.max,
    this.min,
    this.onChange,
    this.decoration,
    required this.formatText,
    this.shadow,
    this.radius = 12,
    this.hintText,
    this.useHorizontalLayout = false,
    this.controller,
    this.displayValueIsLabel = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.autovalidate = false,
    this.focusController,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<InputDateTimeWidget> createState() => _InputDateTimeWidgetState();
}

class _InputDateTimeWidgetState extends State<InputDateTimeWidget> {
  String dateText = '';
  DateTime? selectedCurrent;

  late TextEditingController _controller;

  void onChange(DateTime? date) {
    selectedCurrent = date;
    if (date != null) {
      _controller.text = widget.formatText(date);
    } else {
      _controller
        ..text = ' '
        ..text = '';
    }
    widget.onChange?.call(date);
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    selectedCurrent = widget.date;
    if (widget.date != null) {
      _controller.text =
          widget.date != null ? widget.formatText(widget.date!) : '';
    }
  }

  @override
  void didUpdateWidget(covariant InputDateTimeWidget oldWidget) {
    if (oldWidget.date != widget.date) {
      selectedCurrent = widget.date;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: !widget.displayValueIsLabel && !widget.enabled
              ? null
              : () async {
                  widget.focusController?.value = true;
                  await _onPickingDate();
                  onChange(selectedCurrent);
                },
          child: IgnorePointer(
            ignoring: true,
            child: TextInputLayout(
              contentPadding: const EdgeInsets.all(14),
              controller: _controller,
              validator: widget.validator,
              paddingError: EdgeInsets.zero,
              focusController: widget.focusController,
              hintText: widget.hintText,
              disableColor: AppColors.grey70,
              enabled: widget.enabled,
              border: Theme.of(context)
                  .themeDecoration
                  .textInputBorderSocial
                  .copyWith(
                    borderSide: const BorderSide(color: AppColors.grey10),
                  ),
            ),
          ),
        ),
        if (widget.displayValueIsLabel == false)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 10),
              child: const Icon(
                Icons.calendar_month,
                color: AppColors.grey10,
                size: 20,
              ),
            ),
          )
      ],
    );
  }
}

extension _InputDateTimeWidgetStateExt on _InputDateTimeWidgetState {
  DateTime get minimumDate => widget.min ?? DateTime.utc(1900);

  DateTime get maximumDate => widget.max ?? DateTime.now();

  DateTime get _initialDate {
    var initialDate = widget.date ?? DateTime.now();
    if (initialDate.isAfter(maximumDate)) {
      initialDate = maximumDate;
    } else if (initialDate.isBefore(minimumDate)) {
      initialDate = minimumDate;
    }
    return initialDate;
  }

  Future<void> _onPickingDate() async {
    DateTime? valueInit = _initialDate;

    if (Platform.isAndroid) {
      _showDialogSelectDate(context);
    } else {
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return Material(
            child: SizedBox(
              height: InputDateTimeWidgetConst.defaultPickerSheetHeight,
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    // TODO: fix heare
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     onChange(widget.date);
                          //     Navigator.of(context).pop();
                          //   },
                          //   child: Text(
                          //     S.of(context).cta_Cancel,
                          //     style: TextStyle(
                          //         color: Theme.of(context).primaryColor),
                          //   ),
                          // ),
                          Spacer(),
                          // InkWell(
                          //   onTap: () {
                          //     onChange(valueInit);
                          //     Navigator.of(context).pop();
                          //   },
                          //   child: Text(
                          //     S.of(context).cta_Accept,
                          //     style: TextStyle(
                          //         color: Theme.of(context).primaryColor),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (value) {
                          valueInit = value;
                          onChange(value);
                        },
                        initialDateTime: selectedCurrent ?? _initialDate,
                        minimumDate: minimumDate,
                        maximumDate: maximumDate,
                        use24hFormat: true,
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _showDialogSelectDate(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: minimumDate,
        lastDate: maximumDate,
        fieldHintText: "dd/mm/yyyy",
        // TODO: fix heare
        // confirmText: S.of(context).cta_Accept.toUpperCase(),
        builder: (BuildContext? context, Widget? child) {
          return child!;
        }).then((date) {
      if (date != null) {
        onChange(date);
      }
    });
  }
}
