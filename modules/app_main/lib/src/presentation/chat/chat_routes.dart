import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/chat/add_member/add_member_page.dart';
import 'package:app_main/src/presentation/chat/block_member/block_member_page.dart';
import 'package:app_main/src/presentation/chat/create_room/create_room_page.dart';
import 'package:app_main/src/presentation/chat/member/member_page.dart';
import 'package:app_main/src/presentation/chat/new_message/new_message_page.dart';
import 'package:app_main/src/presentation/chat/view_image_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'chat_room/chat_room_page.dart';
import 'conversation/conversation_page.dart';

@injectable
class ChatRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        ConversationPage.routeName: (context) {
          return const ConversationPage();
        },
        NewMessagePage.routeName: (context) {
          return const NewMessagePage();
        },
        ChatRoomPage.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return ChatRoomPage(
            conversationId: args['conversationId'],
            memberId: args['memberId'],
          );
        },
        ViewImagePage.routeName: (context) {
          return ViewImagePage(
            urlImage: settings.arguments as String,
          );
        },
        CreateRoomPage.routeName: (context) {
          return const CreateRoomPage();
        },
        BlockMemberPage.routeName: (context) {
          return BlockMemberPage(
            conversationId: settings.arguments as int,
          );
        },
        AddMemberPage.routeName: (context) {
          return AddMemberPage(
            conversationId: settings.arguments as int,
          );
        },
        MemberPage.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return MemberPage(isAdmin: args['isAdmin'], conversationId: args['conversationId']);
        },
      };
}
