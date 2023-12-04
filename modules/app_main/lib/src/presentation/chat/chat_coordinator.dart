import 'package:app_main/src/presentation/chat/chat_room/chat_room_page.dart';
import 'package:app_main/src/presentation/chat/conversation/conversation_page.dart';
import 'package:app_main/src/presentation/chat/new_message/new_message_page.dart';
import 'package:flutter/material.dart';

extension ChatCoordinator on BuildContext {
  Future<T?> startToConversation<T>() {
    return Navigator.of(this).pushNamed(ConversationPage.routeName);
  }

  Future<T?> startNewMessage<T>() {
    return Navigator.of(this).pushNamed(NewMessagePage.routeName);
  }

  Future<T?> startChatRoom<T>({
    int? conversationId,
    int? memberId,
  }) {
    return Navigator.of(this).pushNamed(ChatRoomPage.routeName, arguments: {
      'conversationId': conversationId,
      'memberId': memberId,
    });
  }
}
