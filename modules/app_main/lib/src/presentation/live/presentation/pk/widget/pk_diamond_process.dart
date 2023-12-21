import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flex_diamond_builder.dart';

class PkDiamondProcess extends StatelessWidget {
  const PkDiamondProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexDiamondBuilder(
      builder: (flexLeft, flexRight, leftCount, rightCount) {
        final p = flexRight / flexLeft;

        final flexP = 60 * p;

        return Container(
          height: 22,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffFFC656), width: 3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 60,
                child: Container(
                  height: 22,
                  color: const Color(0xff00BBE4),
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    '$leftCount',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              BoxState(
                flex: flexP.toInt(),
                builder: (value, isComplete) {
                  return Expanded(
                    flex: value,
                    child: Container(
                      width: 202,
                      height: 22,
                      color: const Color(0xffFE1D67),
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$rightCount',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class BoxState extends StatefulWidget {
  const BoxState({super.key, required this.flex, required this.builder});

  final int flex;
  final Widget Function(int value, bool onCompleted) builder;

  @override
  State<BoxState> createState() => _BoxStateState();
}

class _BoxStateState extends State<BoxState> {
  int begin = 60;
  int end = 0;

  @override
  void initState() {
    end = widget.flex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BoxState oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flex != widget.flex) {
      begin = oldWidget.flex;
      end = widget.flex;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(begin == end) {
      return widget.builder(begin, true);
    }
    return AnimatedSizeBuilder(
      key: widget.key,
      begin: begin,
      end: end,
      builder: widget.builder,
    );
  }
}

class AnimatedSizeBuilder extends StatefulWidget {
  const AnimatedSizeBuilder({
    super.key,
    required this.begin,
    required this.end,
    required this.builder,
  });

  final int begin;
  final int end;
  final Widget Function(int value, bool onCompleted) builder;

  @override
  State<AnimatedSizeBuilder> createState() => _AnimatedSizeBuilderState();
}

class _AnimatedSizeBuilderState extends State<AnimatedSizeBuilder>
    with SingleTickerProviderStateMixin {
  late Animation<int> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = IntTween(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedSizeBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.begin != widget.begin || oldWidget.end != widget.end) {
      _controller.reset();
      _animation = IntTween(begin: widget.begin, end: widget.end).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,
        ),
      );
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => widget.builder(
        _animation.value,
        _controller.isCompleted,
      ),
    );
  }
}
