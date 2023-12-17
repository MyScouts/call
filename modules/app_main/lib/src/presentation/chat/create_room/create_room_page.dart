//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/call/widgets/friend_widget.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/create_room/cubit/create_room_cubit.dart';
import 'package:app_main/src/presentation/chat/create_room/cubit/create_room_state.dart';
import 'package:app_main/src/presentation/chat/widgets/friend_select_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/friend_selected_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class CreateRoomPage extends StatefulWidget {
  static const routeName = 'CreateRoomPage';

  const CreateRoomPage({super.key});

  @override
  CreateRoomPageState createState() => CreateRoomPageState();
}

class CreateRoomPageState extends State<CreateRoomPage> {
  final CreateRoomCubit _cubit = getIt.get();
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
          (friends, listChoice, page, canLoadMore, keySearch, step) {
            return Scaffold(
              appBar: BaseAppBar(
                title: 'Tạo nhóm chat',
                isClose: false,
                actions: [
                  TextButton(
                    onPressed: () async {
                      if (step == 1) {
                        _cubit.nextStep();
                      } else {
                        if (_editingController.text.isNotEmpty) {
                         final int id = await _cubit.createRoom(_editingController.text);
                         context.replaceChatRoom(conversationId: id);
                        }
                      }
                    },
                    child: Text(
                      step == 1 ? 'Tiếp tục' : 'Tạo',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: (step == 2 && _editingController.text.isNotEmpty) || step == 1
                            ? AppColors.blueEdit
                            : const Color(0x26000000),
                      ),
                    ),
                  ),
                ],
              ),
              body: step == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (listChoice.isNotEmpty) ...[
                          SizedBox(
                            height: 84,
                            child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return FriendSelectedWidget(
                                    data: listChoice[index],
                                    onTap: () {
                                      _cubit.updateChoice(listChoice[index]);
                                    },
                                  );
                                },
                                separatorBuilder: (_, __) => kSpacingWidth12,
                                itemCount: listChoice.length),
                          ),
                          kSpacingHeight24,
                        ],
                        Text(
                          'Gợi ý',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyLightTextColor,
                          ),
                        ),
                        kSpacingHeight16,
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                              itemBuilder: (_, index) {
                                if (index == friends.length) {
                                  _cubit.loadMore();
                                  return const LoadingWidget();
                                } else {
                                  return FriendSelectWidget(
                                    data: friends[index],
                                    isSelected: listChoice.contains(friends[index]),
                                    onTap: () {
                                      _cubit.updateChoice(friends[index]);
                                    },
                                  );
                                }
                              },
                              separatorBuilder: (_, __) => kSpacingHeight12,
                              itemCount: canLoadMore ? friends.length + 1 : friends.length),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        kSpacingHeight24,
                        Text(
                          'Đặt tên nhóm chat mới',
                          style: context.textTheme.headlineLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        kSpacingHeight24,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Theme(
                            data: ThemeData(),
                            child: TextField(
                              controller: _editingController,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                hintText: 'Tên nhóm (Bắt buộc)',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.greyLightTextColor),
                              ),
                            ),
                          ),
                        ),
                        kSpacingHeight24,
                        Row(
                          children: [
                            kSpacingWidth16,
                            Text(
                              '${listChoice.length} người tham gia',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyLightTextColor,
                              ),
                            ),
                          ],
                        ),
                        kSpacingHeight16,
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                              itemBuilder: (_, index) {
                                return FriendWidget(
                                  data: listChoice[index],
                                  onTap: () {},
                                );
                              },
                              separatorBuilder: (_, __) => kSpacingHeight12,
                              itemCount: listChoice.length),
                        ),
                      ],
                    ),
            );
          },
          loading: () => const LoadingWidget(),
          error: (e) => const SizedBox(),
        );
      },
    );
  }
}
