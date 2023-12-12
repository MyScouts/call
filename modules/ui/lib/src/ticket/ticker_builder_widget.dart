import 'dart:async';

import 'package:flutter/material.dart';

class TickerBuilder extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final Duration duration;

  const TickerBuilder({
    super.key,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<TickerBuilder> createState() => _TickerBuilderState();
}

class _TickerBuilderState extends State<TickerBuilder> {
  @override
  void didChangeDependencies() {
    startTimer(widget.duration);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TickerBuilder oldWidget) {
    if (oldWidget.duration.inMilliseconds != widget.duration.inMilliseconds) {
      startTimer(widget.duration);
    }
    super.didUpdateWidget(oldWidget);
  }

  Timer? _timer;

  void startTimer(Duration duration) {
    _timer?.cancel();
    _timer = Timer.periodic(
      duration,
      (Timer timer) => setState(
        () {
          _timer = timer;
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
