import 'package:flutter/material.dart';

class XHover extends StatefulWidget {
  final Widget child;
  final Widget hoverChild;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double spacing;
  final Decoration? decoration;
  final bool alwaysShowHoverItem;
  final MouseCursor cursor;
  const XHover({
    Key? key,
    required this.child,
    required this.hoverChild,
    this.onTap,
    this.borderRadius,
    this.spacing = 8.0,
    this.padding,
    this.decoration,
    this.alwaysShowHoverItem = false,
    this.cursor = SystemMouseCursors.click,
  }) : super(key: key);

  @override
  State<XHover> createState() => _XHoverState();
}

class _XHoverState extends State<XHover> {
  late ValueNotifier<bool> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final isMobile = deviceWidth < 1024;
    final isDesktop = deviceWidth >= 1024;

    Widget buildContentView(BuildContext context) {
      return Container(
        padding: widget.padding ?? const EdgeInsets.all(4.0),
        decoration: widget.decoration ??
            BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8.0),
            ),
        child: Row(
          children: [
            widget.child,
            SizedBox(width: widget.spacing),
            if (widget.alwaysShowHoverItem || isMobile) ...[
              widget.hoverChild
            ] else ...[
              Visibility(
                visible: _valueNotifier.value,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: widget.hoverChild,
              ),
            ]
          ],
        ),
      );
    }

    return AnimatedBuilder(
      animation: _valueNotifier,
      builder: (_, __) {
        return MouseRegion(
          cursor: widget.cursor,
          child: widget.onTap != null
              ? InkWell(
                  onTap: widget.onTap,
                  child: buildContentView(context),
                )
              : buildContentView(context),
          onHover: (event) {
            if (widget.alwaysShowHoverItem || isDesktop) {
              _valueNotifier.value = true;
            }
          },
          onExit: (event) {
            _valueNotifier.value = false;
          },
        );
      },
    );
  }
}
