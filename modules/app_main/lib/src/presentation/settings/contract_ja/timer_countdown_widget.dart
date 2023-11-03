import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class TimerCountDownWidget extends StatefulWidget {
  final int time;

  const TimerCountDownWidget({super.key, required this.time});

  @override
  State<TimerCountDownWidget> createState() => _TimerCountDownWidgetState();
}

class _TimerCountDownWidgetState extends State<TimerCountDownWidget>
    with TimerMixin {
  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => widget.time;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builderTimer((context, value, child) {
      final d = Duration(seconds: value);
      var seconds = d.inSeconds;
      final days = seconds ~/ Duration.secondsPerDay;
      seconds -= days * Duration.secondsPerDay;
      final hours = seconds ~/ Duration.secondsPerHour;
      seconds -= hours * Duration.secondsPerHour;
      final minutes = seconds ~/ Duration.secondsPerMinute;
      seconds -= minutes * Duration.secondsPerMinute;

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TimeItemWidget(value: days, text: 'Ngày'),
          const SizedBox(width: 10),
          TimeItemWidget(value: hours, text: 'giờ'),
          const SizedBox(width: 10),
          TimeItemWidget(value: minutes, text: 'phút'),
          const SizedBox(width: 10),
          TimeItemWidget(value: seconds, text: 'giây'),
        ],
      );
    });
  }
}

class TimeItemWidget extends StatelessWidget {
  final int value;
  final String text;

  const TimeItemWidget({
    super.key,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 55),
          color: const Color(0xFFE1F0FF),
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              '$value',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF1E90FF),
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9EAED1),
              ),
        ),
      ],
    );
  }
}
