import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui/ui.dart';

class OtpBoxWidget extends StatefulWidget {
  final void Function(String)? onOtpChanged;
  final TextEditingController? controller;
  final String? title;
  final Color? textColor;
  final Color? selectedColor;
  final Color? activeColor;
  final Color? inActiveColor;
  final BorderRadius? borderRadius;

  const OtpBoxWidget({
    Key? key,
    this.controller,
    this.onOtpChanged,
    this.title,
    this.textColor,
    this.selectedColor,
    this.activeColor,
    this.borderRadius,
    this.inActiveColor,
  }) : super(key: key);

  @override
  OtpBoxWidgetState createState() => OtpBoxWidgetState();
}

class OtpBoxWidgetState extends State<OtpBoxWidget>
    with WidgetsBindingObserver {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = widget.controller ?? TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final selectedColor = widget.selectedColor ?? const Color(0xFFFFAA03);
    final activeColor = widget.activeColor ?? Colors.black;
    final inActiveColor = widget.inActiveColor ?? Colors.black;
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: OtpWidgetConstants.paddingVertical,
            ),
            child: Text(
              widget.title!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        PinCodeTextField(
          keyboardType: TextInputType.number,
          autoFocus: true,
          appContext: context,
          length: OtpWidgetConstants.digitNumberLimit,
          obscureText: false,
          animationType: AnimationType.fade,
          textStyle: TextStyle(
            fontSize: OtpWidgetConstants.otpTextfieldSize,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderWidth: OtpWidgetConstants.otpFieldBorderWidth,
            fieldHeight: OtpWidgetConstants.otpFieldHeight,
            fieldWidth: OtpWidgetConstants.otpFieldWidth,
            selectedColor: selectedColor,
            selectedFillColor: const Color(0xFFF6F8FA),
            activeColor: activeColor,
            activeFillColor: const Color(0xFFF6F8FA),
            inactiveColor: inActiveColor,
            inactiveFillColor: const Color(0xFFF6F8FA),
            borderRadius: borderRadius,
          ),
          cursorColor: selectedColor,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: _textEditingController,
          onChanged: onOtpTextfieldChanged,
          beforeTextPaste: (text) => false,
        ),
      ],
    );
  }

  void onOtpTextfieldChanged(String value) {
    widget.onOtpChanged?.call(value);
  }
}
