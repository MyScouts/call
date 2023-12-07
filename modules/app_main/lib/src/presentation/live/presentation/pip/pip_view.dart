import 'package:app_main/src/app_size.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_position.dart';
import 'package:flutter/material.dart';

abstract class OverlayInterface {
  void moveTopRight();

  void moveBottomLeft();

  void moveOverTopLeft();
}

class PipView extends StatefulWidget implements OverlayInterface {
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final bool isPresentMedia;
  final Color borderColor;
  final double borderWith;

  PipView({
    super.key,
    required this.height,
    required this.child,
    required this.width,
    this.isPresentMedia = false,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.borderWith = 0,
  });

  @override
  _PipViewState createState() => _state;

  final _PipViewState _state = _PipViewState();

  @override
  void moveTopRight() {
    _state.moveTopRight();
  }

  @override
  void moveBottomLeft() {
    _state.moveBottomLeft();
  }

  @override
  void moveOverTopLeft() {
    _state.moveOverTopLeft();
  }
}

class _PipViewState extends State<PipView> implements OverlayInterface {
  int duration = 150;
  late Offset offset;
  late PipPosition overlayPosition;

  @override
  void initState() {
    overlayPosition = PipPosition(widget);
    offset = overlayPosition.bottomLeft;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: duration),
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        feedback: const SizedBox.shrink(),
        onDragUpdate: (dragUpdateDetails) {
          final off = dragUpdateDetails.delta;
          setState(() {
            offset = Offset(offset.dx + off.dx, offset.dy + off.dy);
          });
        },
        onDragEnd: (DraggableDetails details) {
          setState(() {
            duration = 150;
            offset = _getFinalOffset(offset);
          });
          Future.delayed(const Duration(milliseconds: 50)).then((value) {
            duration = 100;
          });
        },
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderWith,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  Offset _getFinalOffset(offset) {
    Offset result = Offset.zero;
    if (offset.dy < SizeConfig.screenHeight * 0.4) {
      if (offset.dx < SizeConfig.screenWidth * 0.4) {
        // top left
        result = overlayPosition.topLeft;
      } else {
        // top right
        result = overlayPosition.topRight;
      }
    } else {
      if (offset.dx < SizeConfig.screenWidth * 0.4) {
        //bottom left
        result = overlayPosition.bottomLeft;
      } else {
        // bottom right
        result = overlayPosition.bottomRight;
      }
    }

    return result;
  }

  @override
  void moveTopRight() {
    setState(() {
      duration = 150;
      offset = overlayPosition.topRight;
    });
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      duration = 100;
    });
  }

  @override
  void moveBottomLeft() {
    setState(() {
      duration = 150;
      offset = overlayPosition.bottomLeft;
    });
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      duration = 100;
    });
  }

  @override
  void moveOverTopLeft() {
    setState(() {
      duration = 150;
      offset = overlayPosition.overTopLeft;
    });
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      duration = 100;
    });
  }
}
