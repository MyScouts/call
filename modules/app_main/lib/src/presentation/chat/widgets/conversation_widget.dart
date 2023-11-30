//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'avatar_conversation_widget.dart';

class ConversationWidget extends StatelessWidget {
  final ConversationModel data;
  const ConversationWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.startChatRoom(
          conversationId: data.id,
        );
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            AvatarConversationWidget(
              members: data.membersNotMe,
            ),
            kSpacingWidth16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name ?? '',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  kSpacingHeight6,
                  Text(
                    data.latestMessage?.message ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight:
                          data.latestMessage?.seen ?? true ? FontWeight.w400 : FontWeight.w600,
                      color: data.latestMessage?.seen ?? true
                          ? AppColors.greyLightTextColor
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLightTextColor,
                  ),
                ),
                if (data.countUnSeen != 0) ...[
                  kSpacingHeight10,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.red500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Text(
                      data.countUnSeen.toString(),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
