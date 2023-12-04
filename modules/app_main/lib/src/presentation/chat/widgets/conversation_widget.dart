//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
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
      onTap: () async {
        await context.startChatRoom(
          conversationId: data.id,
        );
        getIt.get<ConversationCubit>().init();
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            AvatarConversationWidget(
              members: data.membersNotMe,
            ),
            kSpacingWidth16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.membersNotMe.first.member.fullName ?? '',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  kSpacingHeight6,
                  Text(
                    data.latestMessage?.message ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
            kSpacingWidth4,
            Column(
              children: [
                Text(
                  data.latestMessage?.createdAt.timeMessage ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: data.latestMessage?.seen ?? true
                        ? AppColors.greyLightTextColor
                        : AppColors.black,
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
