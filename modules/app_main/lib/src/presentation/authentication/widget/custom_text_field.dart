import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onChange,
    this.validator,
    this.textInputType,
    this.label,
    this.node,
    this.onError,
    this.readOnly = false,
    this.suffix,
  });
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String hintText;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChange;
  final bool isPassword;
  final bool readOnly;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function(String?)? onError;
  final String? label;
  final FocusNode? node;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.validator != null) {
        String? error = widget.validator!(widget.controller.text);
        _isError = error != null;
        setState(() {});

        if (widget.onError != null) {
          widget.onError!(error);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: context.text.titleMedium),
        if (widget.label != null) const SizedBox(height: 3),
        TextFormField(
          readOnly: widget.readOnly,
          focusNode: widget.node,
          key: widget.key,
          controller: widget.controller,
          obscureText: widget.isPassword && !isShowPassword,
          autocorrect: !widget.isPassword,
          onChanged: widget.onChange,
          keyboardType: widget.textInputType,
          enableSuggestions: !widget.isPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          decoration: InputDecoration(
            suffix: widget.suffix,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      isShowPassword = !isShowPassword;
                      setState(() {});
                    },
                    child: Icon(
                      isShowPassword ? Icons.visibility_off : Icons.visibility,
                      size: 24,
                      color: _isError ? Colors.red : const Color(0xFF8C8C8C),
                    ),
                  )
                : _isError
                    ? const Icon(Icons.error, color: Colors.red)
                    : widget.suffixIcon,
            // widget.suffixIcon
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFFC8C8C8),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFFC8C8C8),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFFC8C8C8),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
          ),
        ),
      ],
    );
  }
}
