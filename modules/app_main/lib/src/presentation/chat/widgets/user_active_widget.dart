//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UserActiveWidget extends StatelessWidget {
  final MemberModel data;
  const UserActiveWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.startChatRoom(
          memberId: data.id,
        );
        getIt.get<ConversationCubit>().loadNewConversation();
      },
      child: SizedBox(
        width: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarMemberWidget(
              size: 70,
              avatar: data.avatar ?? '',
              isPDone: (data.type??0) > 0,
            ),
            kSpacingHeight10,
            Text(
              data.displayName ?? '',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
