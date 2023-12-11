import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBuilder extends StatefulWidget {
  const NotificationBuilder({
    super.key,
    required this.child,
    required this.onRemoved,
  });

  final Widget child;
  final Function() onRemoved;

  @override
  State<NotificationBuilder> createState() => _NotificationBuilderState();
}

class _NotificationBuilderState extends State<NotificationBuilder> {
  double _position = 0;
  double w = 100;
  int _duration = 0;
  double _opacity = 0.0;
  late double _size = w;

  void calculateOpacity() {
    if (_position <= -w) {
      _opacity = 1.0;
      _size = - _position;
    } else if (_position <= 0 && _position >= -w) {
      _opacity = -_position / w;
      _size = w;
    } else {
      _size = w;
      _opacity = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Opacity(
            opacity: _opacity,
            child: Container(
              width: _size - 12,
              height: 105,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 247, 247, 0.70),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Opacity(
                opacity: _opacity,
                child: const Text(
                  'Xoá',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3F3F3F),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          left: _position,
          top: 0,
          duration: Duration(milliseconds: _duration),
          child: GestureDetector(
            onHorizontalDragStart: (_) {
              setState(() {
                _duration = 0;
                calculateOpacity();
              });
            },
            onHorizontalDragUpdate: (detail) {
              setState(() {
                _position += detail.delta.dx;
                calculateOpacity();
              });
            },
            onHorizontalDragEnd: (_) {
              if (_position > 0) {
                _position = 0;
              } else if (_position <= 0 && _position >= -50) {
                _position = 0;
              } else if (_position < -50 && _position >= -150) {
                _position = -w;
              } else {
                _position = -ScreenUtil().screenWidth;
                Future.delayed(const Duration(milliseconds: 300), () {
                  widget.onRemoved();
                });
              }
              setState(() {
                _duration = 150;
                calculateOpacity();
              });
            },
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
