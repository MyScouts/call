//import 'dart:developer' as developer;
import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'avatar_conversation_widget.dart';

class ConversationWidget extends StatefulWidget {
  final ConversationModel data;
  const ConversationWidget({super.key, required this.data});

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  Timer? _timer;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.startChatRoom(
          conversationId: widget.data.id,
        );
        getIt.get<ConversationCubit>().loadNewConversation();
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            AvatarConversationWidget(
              members: widget.data.members,
              membersNotMe: widget.data.membersNotMe,
              type: widget.data.type,
            ),
            kSpacingWidth16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.data.type == 1
                        ? widget.data.membersNotMe.first.member.displayName ?? ''
                        : widget.data.name ?? '',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  kSpacingHeight6,
                  if (widget.data.latestMessage?.type != 1)
                    Text(
                      widget.data.latestMessage?.des ??'',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: widget.data.latestMessage?.seen ?? true
                            ? FontWeight.w400
                            : FontWeight.w600,
                        color: widget.data.latestMessage?.seen ?? true
                            ? AppColors.greyLightTextColor
                            : AppColors.black,
                      ),
                    )
                  else if (widget.data.latestMessage?.message != null)
                    Text(
                      widget.data.latestMessage?.message ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: widget.data.latestMessage?.seen ?? true
                            ? FontWeight.w400
                            : FontWeight.w600,
                        color: widget.data.latestMessage?.seen ?? true
                            ? AppColors.greyLightTextColor
                            : AppColors.black,
                      ),
                    )
                  else if (widget.data.latestMessage?.metadata != null)
                    Text(
                      '[Hình ảnh]',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: widget.data.latestMessage?.seen ?? true
                            ? FontWeight.w400
                            : FontWeight.w600,
                        color: widget.data.latestMessage?.seen ?? true
                            ? AppColors.greyLightTextColor
                            : AppColors.black,
                      ),
                    )
                ],
              ),
            ),
            kSpacingWidth4,
            Column(
              children: [
                Text(
                  widget.data.latestMessage?.createdAt.timeMessage ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: widget.data.latestMessage?.seen ?? true
                        ? AppColors.greyLightTextColor
                        : AppColors.black,
                  ),
                ),
                if (widget.data.countUnSeen != 0) ...[
                  kSpacingHeight10,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.red500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Text(
                      widget.data.countUnSeen.toString(),
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
