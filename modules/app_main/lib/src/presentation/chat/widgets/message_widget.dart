//import 'dart:developer' as developer;
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import 'avatar_member_widget.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;
  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isSender = message.sender?.id ==
        getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
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
          padding: EdgeInsets.all(
              message.metadata?.images?.isNotEmpty ?? false ? 0 : 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              topLeft: const Radius.circular(16),
              bottomLeft: isSender
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              bottomRight: const Radius.circular(16),
            ),
            color: message.metadata?.images?.isNotEmpty ?? false
                ? AppColors.white
                : isSender
                    ? AppColors.bgSenderMessage
                    : AppColors.white,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: message.metadata?.images?.isNotEmpty ?? false
                ? Wrap(
                    children: List.generate(
                      message.metadata?.images?.length ?? 0,
                      (index) => CachedNetworkImage(
                        imageUrl: message.metadata?.images?[index] ?? '',
                        progressIndicatorBuilder: (_, __, ___) =>
                            const LoadingWidget(),
                        errorWidget: (_, __, ___) => const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  )
                : Text(
                    message.message ?? '',
                    maxLines: 99,
                    style: context.text.bodyMedium?.copyWith(
                      color: isSender ? AppColors.white : AppColors.black,
                    ),
                  ),
          ),
        ),
        if (isSender) ...[
          kSpacingWidth8,
          SizedBox(
            width: 24,
            height: 24,
            child: AvatarMemberWidget(
              avatar: message.sender?.avatar ?? '',
              size: 24,
            ),
          ),
        ]
      ],
    );
  }
}
