import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:searchfield/searchfield.dart';

import '../social/avatar_widget.dart';

const avatarMarginRight = 78.0;
const itemHeight = 44.0;

class TextFieldSearch<T> extends StatefulWidget {
  final double radius;
  final EdgeInsets contentPadding;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final bool enabled;
  final int? maxLines;
  final List<SuggestionsField<T>> suggestions;
  final SuggestionsField<T>? initialValue;
  final ValueChanged<T?>? onSelected;
  final TextInputAction? textInputAction;
  final int maxSuggestionsInViewPort;
  final ValueNotifier<bool>? focusController;
  final ValueChanged<String>? onChanged;
  final bool Function(String)? onUnfocus;
  final EdgeInsets? scrollPadding;
  final Widget? child;

  const TextFieldSearch({
    super.key,
    required this.radius,
    required this.enabled,
    this.hintText,
    this.controller,
    this.validator,
    this.maxLines = 1,
    required this.suggestions,
    this.initialValue,
    this.onSelected,
    required this.contentPadding,
    this.textInputAction,
    this.maxSuggestionsInViewPort = 10,
    this.focusController,
    this.scrollPadding,
    this.onChanged,
    this.onUnfocus,
    this.child,
  });

  @override
  State<TextFieldSearch<T>> createState() => _TextFieldSearchState<T>();
}

class _TextFieldSearchState<T> extends State<TextFieldSearch<T>> {
  final _forcuNode = FocusNode();
  late TextEditingController controller;
  ValueNotifier<bool>? _focusController;
  SuggestionsField<T>? initialValue;

  bool get isShowLogo =>
      initialValue != null &&
      (initialValue?.img != null || initialValue?.avatar != null);

  void _onTapClear() {
    controller.clear();
    widget.onSelected?.call(null);
  }

  void _onTapForcus() {
    _forcuNode.requestFocus();
  }

  void onChangedText() {
    widget.onChanged?.call(controller.text);
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller.addListener(onChangedText);
    _focusController = widget.focusController;

    if (widget.initialValue != null) {
      controller.text = widget.initialValue?.name ?? '';
      initialValue = widget.initialValue;
    }

    _forcuNode.addListener(() {
      if (_focusController?.value == false) {
        _focusController?.value = true;
      }
    });
  }

  @override
  void didUpdateWidget(covariant TextFieldSearch<T> oldWidget) {
    if (oldWidget.initialValue != widget.initialValue) {
      if (widget.initialValue != null) {
        controller.text = widget.initialValue?.name ?? '';
      }
      initialValue = widget.initialValue;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.removeListener(onChangedText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchField<T>(
          autoCorrect: false,
          validator: (text) {
            if (_focusController == null || _focusController!.value) {
              return widget.validator?.call(text);
            }
            return null;
          },
          focusNode: _forcuNode,
          textInputAction: widget.textInputAction,
          itemHeight: itemHeight,
          // fix not show suggestion of keyboard
          inputType: TextInputType.emailAddress,
          searchInputDecoration: InputDecoration(
            hintText: widget.hintText,
            enabled: widget.enabled,
            fillColor: widget.enabled == false ? AppColors.grey70 : null,
            filled: true,
            contentPadding: isShowLogo
                ? widget.contentPadding.add(
                    EdgeInsets.only(
                      left: initialValue?.img != null ? 30 : 0,
                      right:
                          initialValue?.avatar != null ? avatarMarginRight : 0,
                    ),
                  )
                : widget.contentPadding,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(
                color: AppColors.grey10,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(
                color: AppColors.grey10,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(
                color: AppColors.grey10,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red[300]!,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: Colors.red[300]!),
            ),
          ),
          suggestions: widget.suggestions
              .map(
                (e) => SearchFieldListItem<T>(
                  e.name,
                  item: e.data,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: e.img == null && e.avatar == null
                        ? Text(e.name)
                        : Row(
                            children: [
                              if (e.img != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ImageWidget(e.img!, width: 36),
                                ),
                              Flexible(
                                child: Text(
                                  e.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (e.avatar != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      AvatarWidget(avatar: e.avatar, size: 28),
                                ),
                            ],
                          ),
                  ),
                ),
              )
              .toList(),
          controller: controller,
          onSuggestionTap: (p0) {
            widget.onSelected?.call(p0.item);
            FocusScope.of(context).unfocus();
          },
          maxSuggestionsInViewPort: widget.maxSuggestionsInViewPort,
        ),
        if (isShowLogo && initialValue?.img != null)
          Container(
            alignment: Alignment.center,
            height: itemHeight,
            width: 36,
            padding: const EdgeInsets.only(left: 8),
            child: ImageWidget(
              initialValue!.img!,
              width: 36,
              fit: BoxFit.contain,
            ),
          ),
        if (isShowLogo && initialValue?.avatar != null)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: itemHeight,
              width: avatarMarginRight,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 24),
              child: AvatarWidget(avatar: initialValue?.avatar, size: 32),
            ),
          ),
        if (widget.enabled)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, valueText, __) {
                    final bool hasClear = valueText.text.isNotEmpty;

                    return InkWell(
                      onTap: hasClear ? _onTapClear : _onTapForcus,
                      child: Icon(
                        hasClear
                            ? Icons.clear
                            : Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: AppColors.grey10,
                      ),
                    );
                  }),
            ),
          ),
      ],
    );
  }
}

class SuggestionsField<T> {
  String name;
  T data;
  String? img;
  String? avatar;

  SuggestionsField({
    required this.name,
    required this.data,
    this.img,
    this.avatar,
  });
}
