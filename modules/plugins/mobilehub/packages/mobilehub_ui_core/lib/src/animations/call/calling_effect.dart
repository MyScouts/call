import 'package:flutter/material.dart';

class CallingEffectWidget extends StatefulWidget {
  final double size;
  const CallingEffectWidget({super.key, required this.size});

  @override
  State<CallingEffectWidget> createState() => _CallingEffectWidgetState();
}

class _CallingEffectWidgetState extends State<CallingEffectWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  late final Animation _colorTween1;
  late final Animation _colorTween2;
  late final Animation _colorTween3;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..addListener(() {
        if (controller.isCompleted) {
          controller.reset();
          controller.forward();
        }
      })
      ..forward();
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    _colorTween1 = ColorTween(
      begin: Colors.white.withOpacity(0.5),
      end: Colors.white.withOpacity(0.001),
    ).animate(controller);
    _colorTween2 = ColorTween(
      begin: Colors.white.withOpacity(0.75),
      end: Colors.white.withOpacity(0.25),
    ).animate(controller);
    _colorTween3 = ColorTween(
      begin: Colors.white,
      end: Colors.white.withOpacity(0.5),
    ).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: widget.size / 2 + (widget.size / 2) * animation.value,
                height: widget.size / 2 + (widget.size / 2) * animation.value,
                decoration: BoxDecoration(
                  color: _colorTween1.value,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: widget.size / 4 + (widget.size / 2) * animation.value,
                height: widget.size / 4 + (widget.size / 2) * animation.value,
                decoration: BoxDecoration(
                  color: _colorTween2.value,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: (widget.size / 2) * animation.value,
                height: (widget.size / 2) * animation.value,
                decoration: BoxDecoration(
                  color: _colorTween3.value,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
