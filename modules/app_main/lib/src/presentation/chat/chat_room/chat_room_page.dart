//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_cubit.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_chat_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/message_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class ChatRoomPage extends StatefulWidget {
  static const routeName = 'ChatRoomPage';
  final int? conversationId;
  final int? memberId;
  const ChatRoomPage({super.key, this.conversationId, this.memberId});

  @override
  ChatRoomPageState createState() => ChatRoomPageState();
}

class ChatRoomPageState extends State<ChatRoomPage> {
  final ChatRoomCubit _cubit = getIt.get();
  final scrollController = ScrollController();
  final textController = TextEditingController();

  @override
  void initState() {
    _cubit.init(conversationId: widget.conversationId, memberId: widget.memberId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, ChatRoomState>(
        bloc: _cubit,
        builder: (_, state) {
          return state.when(
            (messages, conversation, page, canLoadMore, loadMoreError) {
              return Scaffold(
                backgroundColor: AppColors.gray50,
                appBar: BaseAppBar(
                  isClose: false,
                  backgroundColor: AppColors.white,
                  titleWidget: Row(
                    children: [
                      AvatarChatWidget(
                        members: conversation.conversation.membersNotMe,
                      ),
                      kSpacingWidth8,
                      Column(
                        children: [
                          Text(
                            conversation.conversation.membersNotMe.first.member.fullName ?? '',
                            style: context.textTheme.labelLarge?.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          kSpacingHeight6,
                          const Text(''),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert),
                      color: AppColors.white,
                      onSelected: (i) {
                        if (i == 0) {
                          showDialog(
                              context: context,
                              builder: (_) => ConfirmChatDialog(
                                    title: 'Xóa cuộc trò chuyện',
                                    content:
                                        'Cuộc trò chuyện của bạn sẽ được xóa vĩnh viễn và không thể khôi phục',
                                    actionTitle: 'Xóa',
                                    onAction: () {
                                      _cubit
                                          .deleteConversation()
                                          .then((value) => Navigator.pop(context));
                                    },
                                  ));
                        } else if (i == 1) {
                        } else if (i == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => ConfirmChatDialog(
                                    title: 'Chặn ${conversation.conversation.membersNotMe.first.member.fullName}',
                                    content: '${conversation.conversation.membersNotMe.first.member.fullName} sẽ không thể :\n\n'
                                        ' • Xem bài viết trên trang cá nhân của bạn\n'
                                        ' • Nhắn tin cho bạn\n'
                                        ' • Thêm bạn làm bạn bè\n'
                                        ' • Nếu các bạn là bạn bè, chặn tài khoản đồng nghĩa với việc hủy kết bạn',
                                    actionTitle: 'Xác nhận',
                                    actionColor: AppColors.blueEdit,
                                    contentAlign: TextAlign.start,
                                    onAction: () {
                                      _cubit
                                          .blockUser(widget.memberId ??
                                              conversation
                                                  .conversation.membersNotMe.first.member.id)
                                          .then((value) => Navigator.pop(context));
                                    },
                                  ));
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                ImageWidget(
                                  IconAppConstants.icDeleteChat,
                                  width: 24,
                                  height: 24,
                                ),
                                kSpacingWidth20,
                                Text(
                                  'Xóa cuộc trò chuyện',
                                  style: context.text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: [
                                ImageWidget(
                                  IconAppConstants.icReportChat,
                                  width: 24,
                                  height: 24,
                                ),
                                kSpacingWidth20,
                                Text(
                                  'Báo cáo',
                                  style: context.text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              children: [
                                ImageWidget(
                                  IconAppConstants.icBlockChat,
                                  width: 24,
                                  height: 24,
                                ),
                                kSpacingWidth20,
                                Text(
                                  'Chặn tài khoản',
                                  style: context.text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    if (messages.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            reverse: true,
                            itemBuilder: (_, index) {
                              if (index == messages.length && canLoadMore) {
                                _cubit.loadMore();
                                return const LoadingWidget();
                              } else {
                                return MessageWidget(
                                  key: ValueKey(messages[index].messageId),
                                  message: messages[index],
                                );
                              }
                            },
                            separatorBuilder: (_, __) => kSpacingHeight8,
                            itemCount: canLoadMore ? messages.length + 1 : messages.length),
                      )
                    else
                      kSpacer,
                    Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8 + MediaQuery.of(context).padding.bottom,
                        left: 12,
                        right: 4,
                      ),
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController,
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                fillColor: AppColors.gray50,
                                hintText: 'Soạn tin nhắn',
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40)),
                              ),
                            ),
                          ),
                          Material(
                            color: AppColors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                if (textController.text.trim().isNotEmpty) {
                                  _cubit.sendMessage(textController.text.trim());
                                  FocusScope.of(context).unfocus();
                                  textController.clear();
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.send_rounded, color: AppColors.blueEdit),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            loading: () => const LoadingWidget(),
            error: (e) => const SizedBox(),
          );
        });
  }

  @override
  void dispose() {
    _cubit.readMessage();
    super.dispose();
  }
}
