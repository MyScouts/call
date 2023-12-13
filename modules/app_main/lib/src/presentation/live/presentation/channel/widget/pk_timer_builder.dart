import 'dart:async';

import 'package:flutter/material.dart';

class PkTimerBuilder extends StatefulWidget {
  const PkTimerBuilder({
    super.key,
    required this.endTime,
    required this.builder,
  });

  final DateTime endTime;
  final Widget Function(Duration duration, bool isEnd) builder;

  @override
  State<PkTimerBuilder> createState() => _PkTimerBuilderState();
}

class _PkTimerBuilderState extends State<PkTimerBuilder> {
  Timer? _timer;
  late Duration _duration;
  bool _isEnd = false;

  @override
  void initState() {
    if (widget.endTime.isAfter(DateTime.now())) {
      _duration = widget.endTime.difference(DateTime.now());
    } else {
      _duration = Duration.zero;
      _isEnd = true;
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isEnd) return;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_duration.inSeconds == 0) {
          _timer?.cancel();
          setState(() {
            _isEnd = true;
          });
          return;
        }
        setState(() {
          _duration = Duration(seconds: _duration.inSeconds - 1);
        });
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_duration, _isEnd);
  }
}
