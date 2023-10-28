// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:flutter/material.dart';

class SkeletonFilteredWidget extends StatefulWidget {
  const SkeletonFilteredWidget({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<SkeletonFilteredWidget> createState() => _SkeletonFilteredWidgetState();
}

class _SkeletonFilteredWidgetState extends State<SkeletonFilteredWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(begin: -3, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(
        () {
          setState(() {});
        },
      );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: const Alignment(-1, 0),
          colors: const [
            Color(0x0D000000),
            Color(0x1A000000),
            Color(0x0D000000)
          ],
        ),
      ),
      child: ColorFiltered(
        colorFilter:
            const ColorFilter.mode(Colors.transparent, BlendMode.srcOut),
        child: widget.child,
      ),
    );
  }
}
