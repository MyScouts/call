import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpWidgetConstants {
  static const digitNumberLimit = 6;
  static const defaultCharacter = '';
  static const otpTextfieldKey = 'otp_textfield_key_';

  static const double paddingHorizontal = 16;
  static const double paddingVertical = 16;

  static const double otpFieldWidth = 44;
  static const double otpFieldHeight = 60;
  static const double otpFieldBorderWidth = 1;
  static const double otpTextfieldSize = 30;
  static const double otpFieldRadiusCorner = 5;
}

class OtpWidget extends StatefulWidget {
  final void Function(String)? onOtpChanged;
  final TextEditingController? controller;
  final String? title;
  final Color? textColor;
  final Color? selectedColor;
  final Color? activeColor;

  const OtpWidget({
    super.key,
    this.controller,
    this.onOtpChanged,
    this.title,
    this.textColor,
    this.selectedColor,
    this.activeColor,
  });

  @override
  OtpWidgetState createState() => OtpWidgetState();
}

class OtpWidgetState extends State<OtpWidget> with WidgetsBindingObserver {
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
            shape: PinCodeFieldShape.underline,
            borderWidth: OtpWidgetConstants.otpFieldBorderWidth,
            fieldHeight: OtpWidgetConstants.otpFieldHeight,
            fieldWidth: OtpWidgetConstants.otpFieldWidth,
            selectedColor: selectedColor,
            activeColor: activeColor,
            inactiveColor: textColor,
          ),
          cursorColor: selectedColor,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: false,
          controller: _textEditingController,
          keyboardType: TextInputType.number,
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
