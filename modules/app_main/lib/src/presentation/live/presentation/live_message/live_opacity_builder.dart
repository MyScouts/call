import 'dart:async';

import 'package:app_main/src/core/services/notification_center.dart';
import 'package:flutter/material.dart';

class OpacityBuilder extends StatefulWidget {
  const OpacityBuilder({
    super.key,
    this.configTimer = 5,
    required this.child,
  });

  final int configTimer;
  final Widget child;

  @override
  State<OpacityBuilder> createState() => _OpacityBuilderState();
}

class _OpacityBuilderState extends State<OpacityBuilder> {
  Timer? _timer;

  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      start();
    });

    NotificationCenter.subscribe(
      channel: showOption,
      observer: this,
      onNotification: (_) {
        if (mounted) {
          setState(() {
            _opacity = 1.0;
          });
        }
        start();
      },
    );
  }

  void start() {
    if (_timer != null) _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: widget.configTimer), (timer) {
      if (mounted) {
        setState(() {
          _opacity = 0.0;
        });
      }
      _timer?.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    NotificationCenter.unsubscribe(channel: showOption, observer: this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      child: IgnorePointer(
        ignoring: _opacity == 0.0 ? true : false,
        child: widget.child,
      ),
    );
  }
}
