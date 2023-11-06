import 'dart:async';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPInputWidget extends StatefulWidget {
  final ValueNotifier<bool> errorCtr;
  final int length;
  final Function(String) onCompleted;
  final Function() onChange;
  const OTPInputWidget({
    super.key,
    this.length = 6,
    required this.errorCtr,
    required this.onCompleted,
    required this.onChange,
  });

  @override
  State<OTPInputWidget> createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  final Key fromKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    widget.errorCtr.addListener(() {
      hasError = widget.errorCtr.value;
      if (hasError) {
        errorController.add(ErrorAnimationType.shake);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: PinCodeTextField(
        length: widget.length,
        obscureText: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          // fieldHeight: 50,
          // fieldWidth: 40,
          activeColor: AppColors.grey13,
          activeFillColor:
              hasError ? AppColors.red10.withOpacity(.3) : AppColors.grey13,
          errorBorderColor: Colors.red,
          inactiveFillColor: AppColors.grey13,
          inactiveColor: AppColors.grey13,
          selectedFillColor: AppColors.grey13,
          selectedColor: AppColors.grey13,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        onCompleted: (v) {
          widget.onCompleted(v);
        },
        onChanged: (value) {
          hasError = false;
          widget.errorCtr.value = false;
          widget.onChange();
          setState(() {});
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          return true;
        },
        appContext: context,
      ),
    );
  }
}
