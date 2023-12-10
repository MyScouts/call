//import 'dart:developer' as developer;
import 'package:app_main/src/core/extensions/datetime_ext.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import 'avatar_member_widget.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;
  final bool showTime;
  final bool showSeen;
  const MessageWidget(
      {super.key, required this.message, required this.showTime, required this.showSeen});

  @override
  Widget build(BuildContext context) {
    final bool isSender =
        message.sender?.id == getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id;
    return message.type == 3
        ? Text(
            '${message.sender?.getName} đã đổi tên cuộc trò chuyện',
            textAlign: TextAlign.center,
          )
        : message.type == 2
            ? Text(
                '${message.sender?.getName} đã tạo cuộc trò chuyện',
                textAlign: TextAlign.center,
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isSender) ...[
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: AvatarMemberWidget(
                            avatar: message.sender?.avatar ?? '',
                            size: 24,
                          ),
                        ),
                        kSpacingWidth8,
                      ],
                      Container(
                        alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                        padding: message.metadata?.images?.isNotEmpty ?? false
                            ? null
                            : EdgeInsets.fromLTRB(12, 12, 12, showTime ? 4 : 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight:
                                isSender ? const Radius.circular(0) : const Radius.circular(16),
                            topLeft: const Radius.circular(16),
                            bottomLeft:
                                isSender ? const Radius.circular(16) : const Radius.circular(0),
                            bottomRight: const Radius.circular(16),
                          ),
                          color: message.metadata?.images?.isNotEmpty ?? false
                              ? AppColors.white
                              : isSender
                                  ? AppColors.bgSenderMessage
                                  : AppColors.white,
                        ),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                          child: message.metadata?.images?.isNotEmpty ?? false
                              ? Wrap(
                                  children: List.generate(
                                    message.metadata?.images?.length ?? 0,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        context
                                            .startViewImage(message.metadata?.images?[index] ?? '');
                                      },
                                      child: CachedNetworkImage(
                                        key: ValueKey(message.metadata?.images?[index] ?? ''),
                                        imageUrl: message.metadata?.images?[index] ?? '',
                                        progressIndicatorBuilder: (_, __, ___) =>
                                            const LoadingWidget(),
                                        errorWidget: (_, __, ___) => const Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Stack(
                                  children: [
                                    if (showTime)
                                      const SizedBox(
                                      width: 90,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: isSender
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message.message ?? '',
                                          maxLines: 99,
                                          style: context.text.bodyMedium?.copyWith(
                                            fontSize: 14,
                                            color: isSender ? AppColors.white : AppColors.black,
                                          ),
                                        ),
                                        if (showTime)
                                          const Text(''),
                                      ],
                                    ),
                                    if (showTime)
                                      Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Text(
                                        message.createdAt.timeMessage,
                                        maxLines: 1,
                                        textAlign: TextAlign.end,
                                        style: context.text.bodyMedium?.copyWith(
                                          fontSize: 11,
                                          color: const Color(0xff333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      if (isSender) ...[
                        kSpacingWidth8,
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: AvatarMemberWidget(
                            key: ValueKey(message.sender?.avatar ?? ''),
                            avatar: message.sender?.avatar ?? '',
                            size: 24,
                          ),
                        ),
                      ]
                    ],
                  ),
                  if (showSeen && isSender && message.seen)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check,
                            size: 16,
                          ),
                          kSpacingWidth2,
                          Text(
                            'Đã xem',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                ],
              );
  }
}
