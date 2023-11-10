import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.data});

  final NotificationData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 0.70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleNetworkImage(
                  url: data.fromUser?.avatar ?? '',
                  size: 19 * 2,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.fromUser?.displayName ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  _formatTime(data.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3F3F3F),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data.message,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatTime(DateTime time) {
  final h = time.hour;
  return '${DateFormat('HH:mm').format(time)} ${h >= 12 ? 'PM' : 'AM'}';
}
