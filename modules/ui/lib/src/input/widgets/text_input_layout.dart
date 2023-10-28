// ignore_for_file: invalid_use_of_protected_member

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';

typedef BuilderIconPassword = Widget Function(bool isShow);

class TextInputLayout extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? minLines;
  final int maxLines;
  final TextAlign textAlign;
  final bool autocorrect;
  final bool enableSuggestions;
  final ValueChanged<String>? onChanged;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final ValueNotifier<bool>? focusController;
  final bool enabled;
  final String? restorationId;
  final String? initValue;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? scrollPadding;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BuilderIconPassword? builderIconPassword;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final Widget? iconError;
  final TextStyle? errorStyle;
  final AutovalidateMode autovalidateMode;
  final Color? fillColor;
  final Color? disableColor;
  final TextStyle? hintStyle;
  final EdgeInsets? paddingError;
  final String? suffixText;
  final String? errorText;
  final String? obscuringCharacter;
  final TextCapitalization textCapitalization;
  final bool showCounterText;

  const TextInputLayout({
    super.key,
    this.autofocus = false,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.focusedBorder,
    this.border,
    this.enabledBorder,
    this.contentPadding,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.labelText,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.onChanged,
    this.errorBorder,
    this.focusedErrorBorder,
    this.focusController,
    this.enabled = true,
    this.restorationId,
    this.initValue,
    this.inputFormatters,
    this.scrollPadding,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.builderIconPassword,
    this.autofillHints,
    this.iconError,
    this.errorStyle,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.fillColor,
    this.prefixIcon,
    this.hintStyle,
    this.focusNode,
    this.disableColor,
    this.paddingError,
    this.suffixText,
    this.errorText,
    this.obscuringCharacter,
    this.textCapitalization = TextCapitalization.none,
    this.showCounterText = false,
  });

  @override
  State<TextInputLayout> createState() => _TextInputLayoutState();
}

class _TextInputLayoutState extends State<TextInputLayout> {
  bool isShowPassword = false;
  late FocusNode _focus;
  ValueNotifier<bool>? _focusController;

  void _onTapShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  bool _hasListener = true;

  void _onListenerValidate(FormFieldState<String> state) {
    _hasListener = false;
    widget.controller?.addListener(() {
      if (!mounted) {
        state.setValue(widget.controller!.text);
        state.validate();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isShowPassword = widget.obscureText == false;
    _focus = widget.focusNode ?? FocusNode();
    _focusController = widget.focusController;

    _focus.addListener(() {
      _focusController?.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final paddingError =
        (widget.prefixIcon != null && widget.paddingError == null)
            ? const EdgeInsets.only(left: 65)
            : widget.paddingError;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: FormField<String>(
        autovalidateMode: widget.autovalidateMode,
        validator: (text) {
          if (_focusController == null || _focusController!.value) {
            return widget.validator?.call(text);
          }
          return null;
        },
        builder: (FormFieldState<String> state) {
          if (_hasListener) {
            _onListenerValidate(state);
          }
          return Stack(
            children: [
              TextFormField(
                initialValue: widget.initValue,
                restorationId: widget.restorationId,
                inputFormatters: widget.inputFormatters,
                controller: widget.controller,
                autocorrect: widget.autocorrect,
                textCapitalization: widget.textCapitalization,
                enableSuggestions: widget.enableSuggestions,
                textInputAction: widget.textInputAction,
                keyboardType: widget.keyboardType,
                scrollPadding:
                    widget.scrollPadding ?? const EdgeInsets.all(20.0),
                obscureText: isShowPassword == false,
                maxLength: widget.maxLength,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                textAlign: widget.textAlign,
                onChanged: (value) {
                  state.setValue(value);
                  state.validate();
                  widget.onChanged?.call(value);
                },
                focusNode: _focus,
                style: state.hasError
                    ? TextStyle(color: Theme.of(context).colorScheme.error)
                    : null,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  errorText: widget.errorText ?? (state.hasError ? '' : null),
                  counterText: widget.showCounterText ? null : '',
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                  fillColor: widget.enabled == false
                      ? widget.disableColor
                      : widget.fillColor,
                  filled: true,
                  errorMaxLines: 2,
                  contentPadding: widget.contentPadding,
                  border: widget.border,
                  focusedBorder: widget.focusedBorder,
                  enabledBorder: widget.enabledBorder,
                  prefixIcon: widget.prefixIcon,
                  suffixText: widget.suffixText,
                  suffixStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  suffixIcon:
                      widget.obscureText == false && widget.suffixIcon != null
                          ? widget.suffixIcon
                          : null,
                ),
                onFieldSubmitted: widget.onFieldSubmitted,
                obscuringCharacter: widget.obscuringCharacter ?? '*',
              ),
              if (state.hasError)
                Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        if (widget.iconError != null) widget.iconError!,
                        const SizedBox(width: 5.5),
                        if (paddingError != null)
                          Padding(
                            padding: paddingError,
                            child: Text(
                              '${state.errorText}',
                              style: widget.errorStyle ??
                                  TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 13,
                                  ),
                            ),
                          ),
                      ],
                    )),
              if (widget.obscureText)
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: _onTapShowPassword,
                          child: Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            width: 18,
                            height: 15,
                            child: Center(
                              child: widget.builderIconPassword
                                      ?.call(isShowPassword) ??
                                  ImageWidget(
                                    !isShowPassword
                                        ? IconAppConstants.visibilityOff
                                        : IconAppConstants.visibility,
                                    color: AppColors.grey73,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
