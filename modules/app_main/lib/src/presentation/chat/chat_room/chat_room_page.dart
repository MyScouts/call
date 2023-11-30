//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_cubit.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_chat_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/message_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
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
              final List<MessageModel> reverseMessages = messages.reversed.toList();
              return Scaffold(
                backgroundColor: AppColors.gray50,
                appBar: BaseAppBar(
                  isClose: false,
                  backgroundColor: AppColors.white,
                  titleWidget: Row(
                    children: [
                      AvatarChatWidget(
                        members: conversation.conversation.members,
                      ),
                      kSpacingWidth8,
                      Column(
                        children: [
                          Text(
                            conversation.conversation.name ?? '',
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
                ),
                body: Column(
                  children: [
                    if (messages.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            reverse: true,
                            itemBuilder: (_, index) {
                              if (index == reverseMessages.length && canLoadMore) {
                                _cubit.loadMore();
                                return const LoadingWidget();
                              } else {
                                return MessageWidget(
                                  key: ValueKey(reverseMessages[index].messageId),
                                  message: reverseMessages[index],
                                );
                              }
                            },
                            separatorBuilder: (_, __) => kSpacingHeight8,
                            itemCount:
                                canLoadMore ? reverseMessages.length + 1 : reverseMessages.length),
                      )
                    else
                      kSpacer,
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12 + MediaQuery.of(context).padding.bottom),
                      child: TextFormField(
                        controller: textController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: const Color(0xffE4E6EB),
                          contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send, color: AppColors.blueEdit),
                            onPressed: () {
                              if (textController.text.trim().isNotEmpty) {
                                _cubit.sendMessage(textController.text.trim());
                                textController.clear();
                              }
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                        ),
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
    super.dispose();
  }
}
