//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_cubit.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_chat_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/message_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:flutter/foundation.dart' as foundation;

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
  final textController = TextEditingController();
  final reportController = TextEditingController();
  final reportGroupController = TextEditingController();
  final nameController = TextEditingController();
  final FocusNode _focus = FocusNode();
  final scrollController = ScrollController();
  bool isShowScrollToEnd = false;
  bool emojiShowing = false;

  @override
  void initState() {
    _cubit.init(
        conversationId: widget.conversationId, memberId: widget.memberId);
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.offset > MediaQuery.of(context).size.height / 3) {
          if (!isShowScrollToEnd) {
            setState(() {
              isShowScrollToEnd = true;
            });
          }
        } else if (isShowScrollToEnd) {
          setState(() {
            isShowScrollToEnd = false;
          });
        }
      }
    });
    super.initState();
  }

  _onBackspacePressed() {
    textController
      ..text = textController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, ChatRoomState>(
      bloc: _cubit,
      builder: (_, state) {
        return state.when(
          (messages, conversation, friendStatus, myType, page, canLoadMore,
              loadMoreError) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  emojiShowing = false;
                  _focus.unfocus();
                });
              },
              child: Scaffold(
                backgroundColor: AppColors.gray50,
                floatingActionButton: !isShowScrollToEnd
                    ? null
                    : Container(
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.only(bottom: 56),
                        child: FloatingActionButton(
                          backgroundColor: AppColors.white,
                          elevation: 4,
                          onPressed: () {
                            scrollController.animateTo(
                              0.0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 1000),
                            );
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                appBar: BaseAppBar(
                  isClose: false,
                  backgroundColor: AppColors.white,
                  titleWidget: InkWell(
                    onTap: null,
                    child: Row(
                      children: [
                        AvatarChatWidget(
                          members: conversation.members,
                          membersNotMe: conversation.membersNotMe,
                          type: conversation.type,
                        ),
                        kSpacingWidth8,
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conversation.type == 1
                                    ? conversation.membersNotMe.first.member
                                            .displayName ??
                                        ''
                                    : conversation.name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              kSpacingHeight6,
                              const Text(''),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    if (conversation.type == 1)
                      Theme(
                        data: Theme.of(context).copyWith(
                          cardColor: AppColors.white,
                        ),
                        child: PopupMenuButton<int>(
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.black,
                          ),
                          color: AppColors.white,
                          surfaceTintColor: AppColors.white,
                          onSelected: (i) {
                            if (i == 0) {
                              removeConversation();
                            } else if (i == 1) {
                              reportUser(conversation);
                            } else if (i == 2) {
                              blockUser(conversation);
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
                                    kSpacingWidth4,
                                    Text(
                                      'Xóa cuộc trò chuyện',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.black,
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
                                    kSpacingWidth4,
                                    Text(
                                      'Báo cáo',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.black,
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
                                      IconAppConstants.icBlockAccount,
                                      width: 24,
                                      height: 24,
                                    ),
                                    kSpacingWidth4,
                                    Text(
                                      'Chặn tài khoản',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.negative,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    if (conversation.type == 2)
                      Theme(
                        data: Theme.of(context).copyWith(
                          cardColor: AppColors.white,
                        ),
                        child: PopupMenuButton<int>(
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.black,
                          ),
                          surfaceTintColor: AppColors.white,
                          color: AppColors.white,
                          onSelected: (i) {
                            switch (i) {
                              case 0:
                                context.toMemberPage(myType, conversation.id);
                                break;
                              case 1:
                                changeNameGroup(conversation);
                                break;
                              case 2:
                                removeConversation();
                                break;
                              case 3:
                                reportGroup(conversation);
                                break;
                              case 4:
                                context.toBlockMemberPage(conversation.id);
                                break;
                              case 5:
                                leave(conversation);
                                break;
                              case 6:
                                leaveMute(conversation);
                                break;
                            }
                          },
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem<int>(
                                value: 0,
                                child: Row(
                                  children: [
                                    Text(
                                      'Số thành viên',
                                      style: context.text.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    kSpacingWidth4,
                                    Text(
                                      '${conversation.members.length} thành viên',
                                      style: context.text.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.blueEdit,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (myType == 2 || myType == 3)
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: ImageWidget(
                                          IconAppConstants.icEdit,
                                        ),
                                      ),
                                      kSpacingWidth4,
                                      Text(
                                        'Đổi tên nhóm',
                                        style:
                                            context.text.bodyMedium?.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              PopupMenuItem<int>(
                                value: 2,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: ImageWidget(
                                        IconAppConstants.icDeleteChat,
                                      ),
                                    ),
                                    kSpacingWidth4,
                                    Text(
                                      'Xóa cuộc trò chuyện',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (myType == 1)
                                PopupMenuItem<int>(
                                  value: 3,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: ImageWidget(
                                          IconAppConstants.icReportGroup,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      kSpacingWidth4,
                                      Text(
                                        'Báo cáo',
                                        style:
                                            context.text.bodyMedium?.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (myType == 2 || myType == 3)
                                PopupMenuItem<int>(
                                  value: 4,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: ImageWidget(
                                          IconAppConstants.icBlockChat,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      kSpacingWidth4,
                                      Text(
                                        'Chặn thành viên',
                                        style:
                                            context.text.bodyMedium?.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              PopupMenuItem<int>(
                                value: 5,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: ImageWidget(
                                        IconAppConstants.icLeaveTeam,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    kSpacingWidth4,
                                    Text(
                                      'Rời nhóm',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 6,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: ImageWidget(
                                        IconAppConstants.icLeaveMute,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    kSpacingWidth4,
                                    Text(
                                      'Rời nhóm im lặng',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                  ],
                ),
                body: Column(
                  children: [
                    if (messages.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                            controller: scrollController,
                            addAutomaticKeepAlives: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            reverse: true,
                            itemBuilder: (_, index) {
                              if (index == messages.length && canLoadMore) {
                                _cubit.loadMore();
                                return const LoadingWidget();
                              } else {
                                return MessageWidget(
                                  key: ValueKey(messages[index].messageId),
                                  message: messages[index],
                                  showSeen: index == 0,
                                  showTime: index == 0 ||
                                      index - 1 >= 0 &&
                                          messages[index].sender?.id !=
                                              messages[index - 1].sender?.id,
                                );
                              }
                            },
                            separatorBuilder: (_, __) => kSpacingHeight8,
                            itemCount: canLoadMore
                                ? messages.length + 1
                                : messages.length),
                      )
                    else
                      kSpacer,
                    if (friendStatus != null &&
                        (friendStatus.relation.isBlocked ||
                            friendStatus.relation.isBlocking))
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (friendStatus.relation.isBlocking) ...[
                                Text('Bạn đã chặn ',
                                    style: context.text.bodyMedium),
                                Text(
                                  conversation.membersNotMe.first.member
                                          .displayName ??
                                      '',
                                  style: context.text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  conversation.membersNotMe.first.member
                                          .displayName ??
                                      '',
                                  style: context.text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(' đã chặn tin nhắn',
                                    style: context.text.bodyMedium),
                              ]
                            ],
                          ),
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8 + MediaQuery.of(context).padding.bottom,
                        left: 4,
                        right: 4,
                      ),
                      color: AppColors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Material(
                                color: AppColors.white,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    _focus.unfocus();
                                    if (emojiShowing) {
                                      setState(() {
                                        emojiShowing = false;
                                      });
                                    }
                                    _cubit.sendImage().then((value) {
                                      if (value != null && value.isNotEmpty) {
                                        showError(value);
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child:
                                        ImageWidget(IconAppConstants.icImage),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: textController,
                                  focusNode: _focus,
                                  minLines: 1,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.gray50,
                                    hintText: 'Soạn tin nhắn',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    suffixIconConstraints: const BoxConstraints(
                                      maxWidth: 40,
                                      maxHeight: 40,
                                    ),
                                    suffixIcon: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ImageWidget(
                                          IconAppConstants.icSmile,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          emojiShowing = !emojiShowing;
                                          _focus.unfocus();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: AppColors.white,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    if (textController.text.trim().isNotEmpty) {
                                      _cubit.sendMessage(
                                        textController.text.trim(),
                                      );
                                      if (_focus.hasFocus) {
                                        _focus.unfocus();
                                      }
                                      if (emojiShowing) {
                                        emojiShowing = false;
                                      }
                                      textController.clear();
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.send_rounded,
                                        color: AppColors.blueEdit),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Offstage(
                            offstage: !emojiShowing,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                height: 250,
                                child: EmojiPicker(
                                  textEditingController: textController,
                                  onBackspacePressed: _onBackspacePressed,
                                  config: Config(
                                    columns: 7,
                                    // Issue: https://github.com/flutter/flutter/issues/28894
                                    emojiSizeMax: 32 *
                                        (foundation.defaultTargetPlatform ==
                                                TargetPlatform.iOS
                                            ? 1.30
                                            : 1.0),
                                    verticalSpacing: 0,
                                    horizontalSpacing: 0,
                                    gridPadding: EdgeInsets.zero,
                                    initCategory: Category.RECENT,
                                    bgColor: const Color(0xFFF2F2F2),
                                    indicatorColor: Colors.blue,
                                    iconColor: Colors.grey,
                                    iconColorSelected: Colors.blue,
                                    backspaceColor: Colors.blue,
                                    skinToneDialogBgColor: Colors.white,
                                    skinToneIndicatorColor: Colors.grey,
                                    enableSkinTones: true,
                                    recentTabBehavior: RecentTabBehavior.RECENT,
                                    recentsLimit: 28,
                                    replaceEmojiOnLimitExceed: false,
                                    noRecents: const Text(
                                      'No Recents',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black26),
                                      textAlign: TextAlign.center,
                                    ),
                                    loadingIndicator: const SizedBox.shrink(),
                                    tabIndicatorAnimDuration:
                                        kTabScrollDuration,
                                    categoryIcons: const CategoryIcons(),
                                    buttonMode: ButtonMode.MATERIAL,
                                    checkPlatformCompatibility: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          loading: () => const LoadingWidget(),
          error: (e) => const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Vui lòng mở chặn để có thể trò chuyện với người này',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  void leaveMute(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Rời nhóm im lặng',
        content:
            'Các thành viên khác sẽ không nhận được\nthông báo về việc bạn rời nhóm\nBạn có chắc chắn muốn rời khỏi nhóm\nnày hay không? ',
        actionTitle: 'Rời nhóm',
        onAction: () {
          _cubit.leave(conversation.id, false).then(
                (value) => Navigator.pop(context),
              );
        },
      ),
    );
  }

  void leave(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Rời nhóm',
        content: 'Bạn có chắc chắn muốn rời khỏi nhóm này hay không?',
        actionTitle: 'Rời nhóm',
        onAction: () {
          _cubit.leave(conversation.id, true).then(
                (value) => Navigator.pop(context),
              );
        },
      ),
    );
  }

  void changeNameGroup(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Chỉnh sửa tên nhóm',
        actionTitle: 'Lưu',
        showCancel: false,
        actionColor: AppColors.blueEdit,
        contentWidget: TextFormField(
          controller: nameController,
          minLines: 3,
          maxLines: 5,
          maxLength: 50,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: 'Nhập tên nhóm',
            contentPadding: const EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onAction: () {
          if (nameController.text.isNotEmpty) {
            _cubit.changeNameGroup(conversation.id, nameController.text);
          }
        },
      ),
    );
  }

  void removeConversation() {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Xóa cuộc trò chuyện',
        content:
            'Cuộc trò chuyện của bạn sẽ được xóa vĩnh viễn và không thể khôi phục',
        actionTitle: 'Xóa',
        onAction: () {
          _cubit.deleteConversation().then(
                (value) => Navigator.pop(context),
              );
        },
      ),
    );
  }

  void showError(String content) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Thông báo',
        content: content,
        actionTitle: 'Xác nhận',
        showCancel: false,
        actionColor: AppColors.blueEdit,
      ),
    );
  }

  void blockUser(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Chặn ${conversation.membersNotMe.first.member.displayName}',
        content:
            '${conversation.membersNotMe.first.member.displayName} sẽ không thể :\n\n'
            ' • Xem bài viết trên trang cá nhân của bạn\n'
            ' • Nhắn tin cho bạn\n'
            ' • Thêm bạn làm bạn bè\n'
            ' • Nếu các bạn là bạn bè, chặn tài khoản đồng nghĩa với việc hủy kết bạn',
        actionTitle: 'Xác nhận',
        actionColor: AppColors.blueEdit,
        contentAlign: TextAlign.start,
        onAction: () {
          _cubit
              .blockUser(
                  widget.memberId ?? conversation.membersNotMe.first.member.id)
              .then(
                (value) => Navigator.pop(context),
              );
        },
      ),
    );
  }

  void reportUser(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Báo cáo',
        actionTitle: 'Gửi',
        showCancel: false,
        actionColor: AppColors.blueEdit,
        contentWidget: TextFormField(
          controller: reportController,
          minLines: 3,
          maxLines: 5,
          maxLength: 255,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: 'Nhập nội dung báo cáo...',
            contentPadding: const EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onAction: () {
          if (reportController.text.isNotEmpty) {
            _cubit.reportUser(
                widget.memberId ?? conversation.membersNotMe.first.member.id,
                reportController.text);
          }
        },
      ),
    );
  }

  void reportGroup(ConversationModel conversation) {
    showDialog(
      context: context,
      builder: (_) => ChatDialog(
        title: 'Báo cáo',
        actionTitle: 'Gửi',
        showCancel: false,
        actionColor: AppColors.blueEdit,
        contentWidget: TextFormField(
          controller: reportGroupController,
          minLines: 3,
          maxLines: 5,
          maxLength: 255,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: 'Nhập nội dung báo cáo...',
            contentPadding: const EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEAEDF0),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onAction: () {},
      ),
    );
  }

  @override
  void dispose() {
    _cubit.endChat();
    super.dispose();
  }
}
