// ignore_for_file: invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';

typedef SelectorItemBuilder<T> = Widget Function(T item);
typedef SelectorItemBuilderReadOnly<T> = Widget Function(List<T> items);

BoxShadow get _shadowHorizontalTextField => BoxShadow(
      blurRadius: 5,
      color: const Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 5),
      spreadRadius: 0,
    );

class TextInputMultiSelectWidget<T> extends StatelessWidget {
  final TextStyle? style;
  final double width;
  final SelectorItemBuilder<T> builderItem;
  final SelectorItemBuilder<T> builderItemSelected;
  final SelectorItemBuilderReadOnly<T> itemBuilderReadOnly;
  final int countItemShow;
  final double sizeItem;
  final List<T> items;
  final List<T> initSelected;
  final String? hintText;
  final bool readOnly;
  final bool enable;
  final ValueChanged<List<T>>? onChanged;
  final ValueNotifier<bool>? focusController;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<List<T>>? validator;

  const TextInputMultiSelectWidget({
    super.key,
    this.style,
    this.enable = true,
    this.width = 120,
    required this.builderItem,
    required this.builderItemSelected,
    this.countItemShow = 6,
    this.sizeItem = 40.0,
    this.onChanged,
    required this.items,
    this.hintText,
    this.initSelected = const [],
    this.readOnly = false,
    required this.itemBuilderReadOnly,
    this.focusController,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<List<T>>(
      validator: (v) {
        if (focusController == null || focusController!.value) {
          return validator?.call(v);
        }
        return null;
      },
      autovalidateMode: autovalidateMode,
      builder: (field) {
        if (field.value == null && initSelected.isNotEmpty) {
          field.setValue(initSelected);
          onChanged?.call(initSelected);
        }

        return MultiSelector<T>(
          style: style,
          enable: enable,
          width: width,
          builderItem: builderItem,
          builderItemSelected: builderItemSelected,
          countItemShow: countItemShow,
          sizeItem: sizeItem,
          onChanged: (p0) {
            onChanged?.call(p0);
            field.setValue(p0);
            field.validate();
          },
          items: items,
          hintText: hintText,
          initSelected: initSelected,
          readOnly: readOnly,
          itemBuilderReadOnly: itemBuilderReadOnly,
          errorMessage: field.errorText,
          // focusController: focusController,
          // autovalidateMode: autovalidateMode,
          // validator: validator,
        );
      },
    );
  }
}

class MultiSelector<T> extends StatefulWidget {
  final TextStyle? style;
  final double width;
  final SelectorItemBuilder<T> builderItem;
  final SelectorItemBuilder<T> builderItemSelected;
  final SelectorItemBuilderReadOnly<T> itemBuilderReadOnly;
  final int countItemShow;
  final double sizeItem;
  final List<T> items;
  final List<T> initSelected;
  final ValueChanged<List<T>>? onChanged;
  final String? hintText;
  final bool readOnly;
  final bool enable;
  final String? errorMessage;

  const MultiSelector({
    Key? key,
    this.style,
    this.enable = true,
    this.width = 120,
    required this.builderItem,
    required this.builderItemSelected,
    this.countItemShow = 6,
    this.sizeItem = 40.0,
    this.onChanged,
    required this.items,
    this.hintText,
    this.initSelected = const [],
    this.readOnly = false,
    required this.itemBuilderReadOnly,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<MultiSelector<T>> createState() => MultiSelectorState<T>();
}

class MultiSelectorState<T> extends State<MultiSelector<T>>
    with TickerProviderStateMixin {
  String? _errorMessage;
  OverlayEntry? overlayEntry;
  double widthOverlay = 120.0;
  GlobalKey globalKeyCenterButton = GlobalKey();

  final List<T> itemSeleted = [];

  void _hide() {
    overlayEntry!.remove();
  }

  void onTapRemoveItemSelected(int index) {
    setState(
      () {
        itemSeleted.removeAt(index);
        widget.onChanged?.call(itemSeleted);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _errorMessage = widget.errorMessage;
    if (widget.initSelected.isNotEmpty) {
      itemSeleted.addAll(widget.initSelected);
    }
  }

  @override
  void didUpdateWidget(covariant MultiSelector<T> oldWidget) {
    if (widget.errorMessage != _errorMessage) {
      setState(() {
        _errorMessage = widget.errorMessage;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final isError = _errorMessage?.isNotEmpty ?? false;

    return LayoutBuilder(
      builder: (_, constraints) {
        widthOverlay = constraints.maxWidth;

        if (widget.readOnly) {
          return Align(
            alignment: Alignment.centerRight,
            child: widget.itemBuilderReadOnly(itemSeleted),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _showOverLay,
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(minHeight: 40),
                margin: const EdgeInsets.symmetric(horizontal: 8)
                    .copyWith(top: 8, bottom: 5),
                decoration: BoxDecoration(
                  boxShadow: [_shadowHorizontalTextField],
                  color: widget.enable ? Colors.white : const Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: isError ? Colors.red : const Color(0xffB1B4B6),
                    width: isError ? 0.7 : 0.6,
                  ),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      key: globalKeyCenterButton,
                      onTap: _showOverLay,
                      child: itemSeleted.isEmpty
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10)
                                        .copyWith(top: 10),
                                child: Text(
                                  widget.hintText != null
                                      ? 'Chọn chiết khấu'
                                      : '',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(5),
                              child: Wrap(
                                children: List.generate(
                                  itemSeleted.length,
                                  (index) => GestureDetector(
                                    onTap: () => onTapRemoveItemSelected(index),
                                    child: Card(
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            widget.builderItemSelected(
                                                itemSeleted[index]),
                                            const Icon(
                                              Icons.close,
                                              size: 14,
                                              color: Color(0xffF4F4F4),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: _showOverLay,
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: Color(0xffF4F4F4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isError)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 3),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _onChanged(T item, int index) {
    if (itemSeleted.contains(item) == false) {
      _hide();
      setState(() {
        itemSeleted.add(item);
        widget.onChanged?.call(itemSeleted);
      });
    }
  }

  Future<void> _showOverLay() async {
    if (widget.enable == false) {
      return;
    }

    final renderBox =
        globalKeyCenterButton.currentContext!.findRenderObject() as RenderBox?;
    var offset = renderBox!.localToGlobal(Offset.zero);
    offset = offset.copyWith(dx: offset.dx - 16);

    final overlayState = Overlay.of(context);

    final itemShow = widget.items.length > widget.countItemShow
        ? widget.countItemShow
        : widget.items.length;
    final double heightAllItem = itemShow * widget.sizeItem;
    final mediaScreen = MediaQuery.of(context);
    final centerHeightScreen = mediaScreen.size.height / 2;

    final viewInsets = EdgeInsets.fromViewPadding(
        View.of(context).viewInsets, View.of(context).devicePixelRatio);

    /// Math
    /// 1. nữa trên màn hình thì show dưới
    /// 2. nữa dưới màn hình thì show trên
    /// 3. tổng size show:
    ///   - TH nữa trên:
    ///       - Tổng size show dưới ko đủ: = size dưới - 20
    ///   - TH nữa dưới:
    ///       - Tổng size không đủ: = size trên + 20
    ///

    /// output:
    /// - position
    /// - size

    const paddingBox = 16.0;
    final heightWidget = (context.size?.height ?? 0.0) - 10;
    if (centerHeightScreen > offset.dy) {
      // show duoi
      offset = offset.copyWith(dy: offset.dy + heightWidget);
      if (offset.dy + heightAllItem >
          mediaScreen.size.height - viewInsets.bottom) {
        offset = offset.copyWith(dy: offset.dy - heightAllItem - heightWidget);
      }
    } else {
      // show tren
      offset = offset.copyWith(dy: offset.dy - heightAllItem - paddingBox);
    }

    overlayEntry = OverlayEntry(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            GestureDetector(
              onTap: _hide,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Material(
                color: Colors.transparent,
                child: Card(
                  elevation: 1,
                  child: SizedBox(
                    height: heightAllItem,
                    width: widthOverlay,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          widget.items.length,
                          (index) => GestureDetector(
                            onTap: () => _onChanged(widget.items[index], index),
                            child: Container(
                              padding: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: itemSeleted.contains(widget.items[index])
                                    ? Colors.grey[200]
                                    : null,
                                border: const Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xffF4F4F4),
                                  ),
                                ),
                              ),
                              height: widget.sizeItem,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      widget.builderItem(widget.items[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlayState.insert(overlayEntry!);
  }
}

extension EdgeInsetsExt on EdgeInsets {
  String getString() {
    return 'top: $top, bottom: $bottom, right: $right, left: $left';
  }
}

extension WindowPaddingExt on ViewPadding {
  String getString() {
    return 'top: $top, bottom: $bottom, right: $right, left: $left';
  }
}

extension OffsetExt on Offset {
  Offset copyWith({double? dx, double? dy}) =>
      Offset(dx ?? this.dx, dy ?? this.dy);
}
