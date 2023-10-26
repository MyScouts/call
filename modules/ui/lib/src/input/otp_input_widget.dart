// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputWidget extends StatefulWidget {
  final bool isError;
  final int length;
  final Function(String) onCompleted;
  const OTPInputWidget({
    super.key,
    this.length = 6,
    required this.isError,
    required this.onCompleted,
  });

  @override
  State<OTPInputWidget> createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  final Key fromKey = GlobalKey<FormState>();
  final List<FocusNode> _focus = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    List.generate(widget.length, (index) {
      _focus.add(FocusNode());
      _controllers.add(TextEditingController());
    });

    // ignore: avoid_function_literals_in_foreach_calls
    // _controllers.forEach((element) {
    //   element.addListener(() {
    //     int index = _controllers.indexOf(element);
    //     element.addListener(() {
    //       debugPrint("adalkdadakldj");
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.length,
          (index) => Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.isError
                    ? AppColors.red10.withOpacity(.1)
                    : AppColors.grey13,
                border: Border.all(
                  color: widget.isError ? AppColors.red10 : Colors.transparent,
                  width: 1.5,
                )),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focus[index],
              onSaved: (newValue) {
                debugPrint(newValue);
              },
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  _focus[index + 1].requestFocus();
                }

                if (value.isEmpty && index > 0) {
                  _focus[index - 1].requestFocus();
                }
                if (value.isNotEmpty && index + 1 == widget.length) {
                  final String value =
                      _controllers.map((e) => e.text.trim()).join();
                  widget.onCompleted(value);
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: context.text.bodyLarge,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
