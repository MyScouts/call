// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:flutter/material.dart';

typedef CheckboxBuilder = Widget Function(bool isSelected);

class CheckBoxWidget extends StatefulWidget {
  final double size;
  final Color borderColor;
  final bool isSelected;
  final bool hasUnselect;
  final Function(bool isSelected)? onSelected;
  final String? text;
  final Color? activeColor;
  final Color? inactiveColor;
  final CheckboxBuilder? builder;

  const CheckBoxWidget({
    Key? key,
    this.size = 22,
    this.borderColor = Colors.grey,
    this.isSelected = false,
    this.hasUnselect = false,
    this.onSelected,
    this.text,
    this.activeColor,
    this.inactiveColor,
    this.builder,
  }) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.isSelected;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckBoxWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      _isSelected = widget.isSelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const ValueKey('checkbox_widget_key'),
      onTap: () {
        if (_isSelected == true && widget.hasUnselect == false) {
          return;
        }

        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelected?.call(_isSelected);
      },
      child: Container(
        color: Colors.transparent,
        child: (widget.text?.isNotEmpty ?? false)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCheckBoxCustom(),
                  const SizedBox(width: 10),
                  Text(widget.text!),
                ],
              )
            : _buildCheckBoxCustom(),
      ),
    );
  }

  Widget _buildCheckBoxCustom() {
    if (widget.builder != null) {
      return widget.builder!.call(_isSelected);
    }

    return Container(
      key: const ValueKey('checkbox_widget_container_key'),
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        border: _isSelected ? null : Border.all(color: widget.borderColor),
        color: _isSelected
            ? (widget.activeColor ?? Theme.of(context).colorScheme.secondary)
            : (widget.inactiveColor ??
                Theme.of(context).scaffoldBackgroundColor),
        borderRadius: BorderRadius.circular(
          widget.size / 2,
        ),
      ),
    );
  }
}
