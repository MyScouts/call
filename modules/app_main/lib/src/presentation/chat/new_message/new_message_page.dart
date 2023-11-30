//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/new_message/cubit/new_message_cubit.dart';
import 'package:app_main/src/presentation/chat/new_message/cubit/new_message_state.dart';
import 'package:app_main/src/presentation/chat/widgets/friend_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class NewMessagePage extends StatefulWidget {
  static const routeName = 'NewMessagePage';

  const NewMessagePage({super.key});

  @override
  NewMessagePageState createState() => NewMessagePageState();
}

class NewMessagePageState extends State<NewMessagePage> {
  final NewMessageCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Tin nhắn mới',
        isClose: false,
      ),
      body: BlocBuilder<NewMessageCubit, NewMessageState>(
        bloc: _cubit,
        builder: (context, state) {
          return state.when(
              (friends, page, canLoadMore, keySearch) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              itemBuilder: (_, index) {
                                if (index == friends.length) {
                                  _cubit.loadMore();
                                  return const LoadingWidget();
                                } else {
                                  return FriendWidget(
                                    data: friends[index],
                                  );
                                }
                              },
                              separatorBuilder: (_, __) => kSpacingHeight12,
                              itemCount: canLoadMore ? friends.length + 1 : friends.length),
                        ),
                      ],
                    ),
                  ),
              loading: () => const LoadingWidget(),
              error: (e) => const SizedBox());
        },
      ),
    );
  }
}
