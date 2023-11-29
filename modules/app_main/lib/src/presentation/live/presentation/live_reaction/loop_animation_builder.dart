import 'package:flutter/material.dart';

class LoopAnimationBuilder extends StatefulWidget {
  final Widget Function(double value) builder;

  const LoopAnimationBuilder({super.key, required this.builder});

  @override
  State<LoopAnimationBuilder> createState() => _LoopAnimationBuilderState();
}

class _LoopAnimationBuilderState extends State<LoopAnimationBuilder>
    with TickerProviderStateMixin {
  late AnimationController aniController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: aniController, curve: Curves.easeIn),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      aniController
        ..forward()
        ..repeat();
    });
  }

  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: aniController,
      builder: (_, __) => widget.builder(_animation.value),
    );
  }
}
