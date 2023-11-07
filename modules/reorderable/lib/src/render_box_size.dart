import 'package:flutter/material.dart';

class RenderBoxSize extends StatefulWidget {
  const RenderBoxSize(
    this.child,
    this.onChangeSize,
    this.onChangeGlobalPosition, {
    Key? key,
  }) : super(key: key);

  final Widget child;
  final void Function(Size size) onChangeSize;
  final void Function(Offset offset) onChangeGlobalPosition;

  @override
  State<StatefulWidget> createState() => RenderBoxSizeState();
}

class RenderBoxSizeState extends State<RenderBoxSize> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      onChangeSize();
      onChangePosition();
    });
  }

  @override
  void didUpdateWidget(covariant RenderBoxSize oldWidget) {
    super.didUpdateWidget(oldWidget);
    onChangePosition();
  }

  void onChangeSize() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      widget.onChangeSize(renderBox.size);
    }
  }

  void onChangePosition() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      widget.onChangeGlobalPosition(renderBox.localToGlobal(Offset.zero));
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (SizeChangedLayoutNotification notification) {
          onChangeSize();
          onChangePosition();
          return true;
        },
        child: widget.child);
  }
}
