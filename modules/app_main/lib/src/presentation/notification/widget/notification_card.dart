import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/notification/state/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.data,
    this.isSearching = false,
  });

  final NotificationData data;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final Widget child = Container(
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
                  url: data.metadata?['user']?['avatar'] ?? '',
                  size: 19 * 2,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.metadata?['user']?['displayName'] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  _formatTime((data.createdAt ?? DateTime.now()).toLocal()),
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
            data.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
    if (isSearching) {
      return child;
    }
    return Slidable(
      key: ValueKey(data.id),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () {
            context.read<NotificationBloc>().add(Delete(data.id));
          },
        ),
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (_) {},
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            label: 'Xoá',
          ),
          SlidableAction(
            flex: 10,
            onPressed: (_) {
              context.read<NotificationBloc>().add(Delete(data.id));
            },
            backgroundColor: const Color.fromRGBO(247, 247, 247, 0.70),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(16),
            label: 'Xoá',
            padding: const EdgeInsets.all(16),
            spacing: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}

String _formatTime(DateTime time) {
  final h = time.hour;
  return '${DateFormat('HH:mm').format(time)} ${h >= 12 ? 'PM' : 'AM'}';
}
