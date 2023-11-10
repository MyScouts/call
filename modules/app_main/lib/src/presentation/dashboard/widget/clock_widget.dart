import 'dart:async';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key, this.textColor});

  final Color? textColor;

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;

  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            _dateTime = DateTime.now();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff2B2A2A),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: AnalogClock(
                dateTime: _dateTime,
                markingColor: Colors.white,
                dialColor: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Đồng hồ',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: context.text.titleSmall!.copyWith(
            color: widget.textColor ?? AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
