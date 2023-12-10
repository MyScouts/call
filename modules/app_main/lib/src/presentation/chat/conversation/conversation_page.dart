import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_state.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_member_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/conversation_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/user_active_widget.dart';
import 'package:design_system/design_system.dart';
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
    _cubit.init(loading: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocBuilder<ConversationCubit, ConversationState>(
          bloc: _cubit,
          builder: (context, state) {
            return state.when(
                (conversations, friends, pageFriend, pageConversation, canLoadMoreFriend,
                        canLoadMoreConversation) =>
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Row(
                            children: [
                              AvatarMemberWidget(
                                avatar: getIt
                                        .get<UserSharePreferencesUsecase>()
                                        .getUserInfo()
                                        ?.avatar ??
                                    '',
                                size: 40,
                                isPDone: getIt
                                    .get<UserSharePreferencesUsecase>()
                                    .getUserInfo()
                                    ?.getIsPDone,
                              ),
                              kSpacingWidth12,
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    isDense: false,
                                    hintText: "Tìm kiếm",
                                    hintStyle: context.text.titleMedium!
                                        .copyWith(color: AppColors.greyLightTextColor),
                                    enabled: false,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(Icons.search, color: AppColors.greyIcon),
                                    fillColor: AppColors.grey71,
                                    filled: true,
                                  ),
                                ),
                              ),
                              kSpacingWidth12,
                              GestureDetector(
                                onTap: () async {
                                  await context.startNewMessage();
                                  _cubit.loadNewConversation();
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.grey71,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                              kSpacingWidth12,
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.grey71,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: AppColors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                              kSpacingWidth12,
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kSpacingHeight12,
                        if (friends.isNotEmpty)
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  if (index == friends.length) {
                                    _cubit.loadMoreFriend();
                                    return const LoadingWidget();
                                  } else {
                                    return UserActiveWidget(
                                      data: friends[index],
                                    );
                                  }
                                },
                                separatorBuilder: (_, __) => kSpacingWidth16,
                                itemCount: canLoadMoreFriend ? friends.length + 1 : friends.length),
                          ),
                        kSpacingHeight16,
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 16),
                              itemBuilder: (_, index) {
                                if (index == conversations.length) {
                                  _cubit.loadMoreConversation();
                                  return const LoadingWidget();
                                } else {
                                  return ConversationWidget(
                                    data: conversations[index],
                                  );
                                }
                              },
                              separatorBuilder: (_, __) => kSpacingHeight24,
                              itemCount: canLoadMoreConversation
                                  ? conversations.length + 1
                                  : conversations.length),
                        ),
                      ],
                    ),
                loading: () => const LoadingWidget(),
                error: (e) => const SizedBox());
          },
        ),
      ),
    );
  }
}
