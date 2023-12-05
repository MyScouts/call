import 'package:flutter/material.dart';

class TimeCountDownWidget extends StatefulWidget {
  final TextStyle textStyle;
  final Duration duration;
  final VoidCallback voidCallback;

  const TimeCountDownWidget({super.key, required this.textStyle, required this.duration, required this.voidCallback});

  @override
  State<TimeCountDownWidget> createState() => _TimeCountDownWidgetState();
}

class _TimeCountDownWidgetState extends State<TimeCountDownWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Countdown(
        style: widget.textStyle,
        controller: _controller,
        voidCallback: widget.voidCallback,
        animation: StepTween(
          begin: widget.duration.inSeconds,
          end: 0,
        ).animate(_controller),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  final AnimationController controller;
  final VoidCallback voidCallback;

  const Countdown({
    super.key,
    required this.animation,
    required this.style,
    required this.controller,
    required this.voidCallback,
  }) : super(listenable: animation);
  final Animation<int> animation;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    var seconds = clockTimer.inSeconds;
    final day = (seconds / 86400).truncate();
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final dayStr = (day).toString().padLeft(2, '0');
    final hoursStr = (hours % 24).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    String timerText = "$hoursStr giờ $minutesStr phút $secondsStr giây";
    return GestureDetector(
      onTap: () {
        if (clockTimer.inSeconds == 0) {
          controller.reset();
          controller.forward();
          voidCallback();
        }
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Làm mới sau ',
            style: style.copyWith(fontSize: 10, fontWeight: FontWeight.w500, color: const Color(0xff8C8C8C)),
          ),
          TextSpan(
            text: timerText,
            style: style.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          )
        ]),
      ),
    );
  }
}
