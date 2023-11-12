import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DayCountdownWidget extends StatefulWidget {
  final int durationInSeconds;

  const DayCountdownWidget({super.key, required this.durationInSeconds});

  @override
  State<DayCountdownWidget> createState() => _DayCountdownWidgetState();
}

class _DayCountdownWidgetState extends State<DayCountdownWidget>
    with TimerMixin {
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

      return Text(
        '$days:$hours:$minutes:$seconds',
        softWrap: false,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
      );
    });
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => widget.durationInSeconds;
}
