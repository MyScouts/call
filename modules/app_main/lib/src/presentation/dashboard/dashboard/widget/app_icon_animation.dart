import 'dart:math';

import 'package:flutter/material.dart';

class AppIconAnimation extends StatefulWidget {
  const AppIconAnimation({super.key, required this.child});

  final Widget child;

  @override
  State<AppIconAnimation> createState() => _AppIconAnimationState();
}

class _AppIconAnimationState extends State<AppIconAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    animation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controller.addListener(() {
      if(controller.isDismissed) {
        controller.forward();
      }
      if(controller.isCompleted) {
        controller.reverse();
      }
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Transform.rotate(
          angle: (animation.value * pi) / 180,
          child: widget.child,
        );
      },
    );
  }
}
