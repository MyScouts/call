import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import '../timer_countdown_widget.dart';

class ContractWidget extends StatelessWidget {
  const ContractWidget({
    super.key,
    required this.no,
    required this.created,
    required this.expire,
  });

  final String no;
  final DateTime created;
  final DateTime expire;

  @override
  Widget build(BuildContext context) {
    final duration = expire.difference(DateTime.now());

    return Column(
      children: [
        Text(
          'Số: $no',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: const Color(0xFF1E90FF)),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Thời hạn hợp đồng 01 năm\n',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  height: 1.42,
                ),
            children: <TextSpan>[
              TextSpan(
                text: 'Từ ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              TextSpan(
                text: created.ddMMyyyy,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              TextSpan(
                text: ' đến ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              TextSpan(
                text: expire.ddMMyyyy,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TimerCountDownWidget(
              time: duration.inSeconds,
            ),
          ),
        ),
      ],
    );
  }
}
