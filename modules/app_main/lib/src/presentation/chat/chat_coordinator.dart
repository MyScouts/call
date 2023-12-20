import 'package:app_main/src/presentation/chat/add_member/add_member_page.dart';
import 'package:app_main/src/presentation/chat/block_member/block_member_page.dart';
import 'package:app_main/src/presentation/chat/chat_room/chat_room_page.dart';
import 'package:app_main/src/presentation/chat/conversation/conversation_page.dart';
import 'package:app_main/src/presentation/chat/create_room/create_room_page.dart';
import 'package:app_main/src/presentation/chat/member/member_page.dart';
import 'package:app_main/src/presentation/chat/new_message/new_message_page.dart';
import 'package:app_main/src/presentation/chat/view_image_page.dart';
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

  Future<T?> startViewImage<T>(String url) {
    return Navigator.of(this).pushNamed(ViewImagePage.routeName, arguments: url);
  }

  Future<T?> startCreateRoom<T>() {
    return Navigator.of(this).pushNamed(CreateRoomPage.routeName);
  }

  Future<T?> toMemberPage<T>(int type, int conversationId) {
    return Navigator.of(this).pushNamed(MemberPage.routeName, arguments: {
      'type': type,
      'conversationId': conversationId,
    });
  }

  Future<T?> toBlockMemberPage<T>(int conversationId) {
    return Navigator.of(this).pushNamed(BlockMemberPage.routeName, arguments: conversationId);
  }

  Future<T?> toAddMemberPage<T>(int conversationId) {
    return Navigator.of(this).pushNamed(AddMemberPage.routeName, arguments: conversationId);
  }

  Future<T?> replaceChatRoom<T>({
    int? conversationId,
  }) {
    return Navigator.of(this).pushReplacementNamed(ChatRoomPage.routeName, arguments: {
      'conversationId': conversationId,
    });
  }
}
