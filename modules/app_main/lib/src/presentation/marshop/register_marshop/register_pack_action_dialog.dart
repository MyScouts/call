import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

enum RegisterPackAction { buy, rent }

class RegisterPackActionDialog extends StatefulWidget {
  final Function(RegisterPackAction) onChange;
  const RegisterPackActionDialog({
    super.key,
    required this.onChange,
  });

  @override
  State<RegisterPackActionDialog> createState() =>
      _RegisterPackActionDialogState();
}

class _RegisterPackActionDialogState extends State<RegisterPackActionDialog> {
  RegisterPackAction _action = RegisterPackAction.buy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: paddingHorizontal,
        right: paddingHorizontal,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Bạn muốn mua hay thuê sản phẩm này"),
          const SizedBox(height: 10),
          Center(
            child: CustomRadioTitle<RegisterPackAction>(
              onChanged: (val) {
                if (val != null) {
                  _action = val;
                  widget.onChange(val);
                }
                setState(() {});
              },
              groupValue: _action,
              value: RegisterPackAction.buy,
              secondary: const SizedBox.shrink(),
              reverse: false,
              child: const Text("Mua sản phẩm"),
              // reverse: true,
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: CustomRadioTitle(
              onChanged: (val) {
                if (val != null) {
                  _action = val;
                  widget.onChange(val);
                }
                setState(() {});
              },
              groupValue: _action,
              value: RegisterPackAction.rent,
              secondary: const SizedBox.shrink(),
              reverse: false,
              child: const Text("Thuê sản phẩm"),
              // reverse: true,
            ),
          ),
        ],
      ),
    );
  }
}
