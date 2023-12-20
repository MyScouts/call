//import 'dart:developer' as developer;
import 'dart:async';

import 'package:app_main/src/core/extensions/datetime_ext.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/widgets/bubble_special_three.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import 'avatar_member_widget.dart';

class MessageWidget extends StatefulWidget {
  final MessageModel message;
  final bool showTime;
  final bool showSeen;
  const MessageWidget(
      {super.key, required this.message, required this.showTime, required this.showSeen});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  Timer? _timer;
  void _startTimer() {
    if (widget.showTime) {
      _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
        setState(() {});
      });
    }
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
    if (widget.message.type == 0) {
      return const LoadingWidget();
    }
    final bool isSender =
        widget.message.sender?.id == getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id;
    return widget.message.type != 1
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.message.type == 3 || widget.message.type == 2)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.message.sender?.displayName ?? '',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.message.type == 2
                                ? ' đã tạo cuộc trò chuyện'
                                : ' đã đổi tên cuộc trò chuyện',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 5)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.message.metadata?.member?.displayName ?? '',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: ' đã rời khỏi cuộc trò chuyện',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 6)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.message.metadata?.member?.displayName ?? '',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: ' đã tham gia cuộc trò chuyện',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 7)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Quản trị viên đã nhượng quyền trưởng phòng cho ',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.message.metadata?.member?.displayName ?? '',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 8)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Quản trị viên đã bầu ',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.message.metadata?.member?.displayName ?? '',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray400,
                            ),
                          ),
                          TextSpan(
                            text: ' làm phó phòng',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 9)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Quản trị viên đã xóa quyền phó phòng của ',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.message.metadata?.member?.displayName ?? '',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (widget.message.type == 10)
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Quản trị viên đã loại ',
                        style: context.text.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.message.metadata?.member?.displayName ?? '',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray400,
                            ),
                          ),
                          TextSpan(
                            text: ' khỏi đoạn chat',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (!isSender)
                    if (widget.showTime)
                      Padding(
                        padding: EdgeInsets.only(bottom: widget.showSeen ? 18 : 0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: AvatarMemberWidget(
                            avatar: widget.message.sender?.avatar ?? '',
                            size: 24,
                          ),
                        ),
                      )
                    else
                      kSpacingWidth24,
                  if (widget.message.metadata?.images?.isNotEmpty ?? false)
                    Container(
                      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                        child: Column(
                          children: [
                            Wrap(
                              children: List.generate(widget.message.metadata?.images?.length ?? 0,
                                  (index) {
                                double width = widget.message.metadata!.images!.length >= 3
                                    ? (MediaQuery.of(context).size.width * 0.7 - 24) / 3
                                    : widget.message.metadata!.images!.length >= 2
                                        ? (MediaQuery.of(context).size.width * 0.7 - 16) / 2
                                        : MediaQuery.of(context).size.width * 0.7;
                                double height = width * 1.5;
                                return GestureDetector(
                                  onTap: () {
                                    context.startViewImage(
                                        widget.message.metadata?.images?[index] ?? '');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        key:
                                            ValueKey(widget.message.metadata?.images?[index] ?? ''),
                                        width: width,
                                        height: height,
                                        imageUrl: widget.message.metadata?.images?[index] ?? '',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (_, __, ___) =>
                                            const LoadingWidget(),
                                        errorWidget: (_, __, ___) => const Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            if (widget.showTime)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.message.createdAt.timeMessage,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: context.text.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xffBFBFBF),
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.check,
                                  //   size: 16,
                                  //   color: AppColors.greyLightTextColor,
                                  // ),
                                  // kSpacingWidth2,
                                  // Text(
                                  //   'Đã xem',
                                  //   style: TextStyle(
                                  //       fontSize: 11, color: AppColors.greyLightTextColor),
                                  // ),
                                ],
                              )
                          ],
                        ),
                      ),
                    )
                  else
                    BubbleSpecialThree(
                      text: widget.message.message ?? '',
                      color: isSender ? const Color(0xFF71AAFF) : AppColors.white,
                      textStyle: context.text.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: isSender ? AppColors.white : AppColors.black,
                      ),
                      tail: widget.showTime,
                      time: widget.message.createdAt.timeMessage,
                      isSender: isSender,
                      seen: widget.showSeen && widget.message.seen,
                      constraints:
                          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                    ),
                  if (isSender)
                    if (widget.showTime)
                      Padding(
                        padding: EdgeInsets.only(bottom: widget.showSeen ? 18 : 0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: AvatarMemberWidget(
                            key: ValueKey(widget.message.sender?.avatar ?? ''),
                            avatar: widget.message.sender?.avatar ?? '',
                            size: 24,
                          ),
                        ),
                      )
                    else
                      kSpacingWidth24,
                ],
              ),
            ],
          );
  }
}
