import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/presentation/notification/notification_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.data,
    this.isSearching = false,
    required this.onRemoved,
  });

  final NotificationData data;
  final bool isSearching;
  final Function() onRemoved;

  @override
  Widget build(BuildContext context) {
    final Widget child = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          width: ScreenUtil().screenWidth - 32,
          //height: 106,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 247, 247, 0.7),
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
                    if ((data.metadata?['user']?['avatar'] ?? '')
                        .trim()
                        .isEmpty)
                      SizedBox.square(
                        dimension: 19 * 2,
                        child: ClipRRect(
                          child: ImageWidget(
                            ImageConstants.defaultUserAvatar,
                            borderRadius: 100,
                          ),
                        ),
                      ),
                    if ((data.metadata?['user']?['avatar'] ?? '')
                        .trim()
                        .isNotEmpty)
                      CachedNetworkImage(
                        imageUrl: data.metadata?['user']?['avatar'] ?? '',
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
                        color: Color(0xff00395D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                data.body,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: ScreenUtil().screenWidth,
      height: 106 + 16,
      child: NotificationBuilder(
        key: ValueKey(data.id),
        onRemoved: onRemoved,
        child: child,
      ),
    );
  }
}

String _formatTime(DateTime time) {
  final h = time.hour;
  return '${DateFormat('HH:mm').format(time)} ${h >= 12 ? 'PM' : 'AM'}';
}
