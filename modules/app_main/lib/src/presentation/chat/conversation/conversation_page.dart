import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_state.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class ConversationPage extends StatefulWidget {
  static const routeName = 'ConversationPage';

  const ConversationPage({super.key});

  @override
  ConversationPageState createState() => ConversationPageState();
}

class ConversationPageState extends State<ConversationPage> {
  final ConversationCubit _cubit = getIt.get();
  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConversationCubit, ConversationState>(
        bloc: _cubit,
        builder: (context, state) {
          return state.when(
              (conversations, friends, pageFriend, pageConversation, canLoadMoreFriend,
                      canLoadMoreConversation) =>
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: ListView.separated(
                            itemBuilder: (_,index) => AvatarWidget(avatar: friends[index].avatar, ),
                            separatorBuilder: (_,__) => k , itemCount: itemCount),
                      )
                    ],
                  ),
              loading: () => const LoadingWidget(),
              error: (e) => const SizedBox());
        },
      ),
    );
  }
}
