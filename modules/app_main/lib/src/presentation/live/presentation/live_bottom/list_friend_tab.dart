import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../di/di.dart';
import '../../domain/entities/live_data.dart';
import 'live_bottom_controller.dart';
import 'user_listile.dart';

class ListFriendTab extends StatefulWidget {
  final bool isHost;
  final LiveBottomController controller;
  final LiveData liveData;

  const ListFriendTab({super.key, required this.controller, required this.liveData, required this.isHost});

  @override
  State<ListFriendTab> createState() => _ListFriendTabState();
}

class _ListFriendTabState extends State<ListFriendTab> {
  bool isInvited = false;
  final userMe = getIt.get<UserInfoSharePreferencesUsecase>().getUserInfo();

  List<User> get listUser {
    if (widget.isHost) {
      return widget.controller.listFollow;
    }
    return widget.controller.listFriends;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: widget.controller.textController,
              style: context.text.titleMedium!.copyWith(color: Colors.grey),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: false,
                hintText: "Nhập ID tài khoản muốn tìm",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE9E9E9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE9E9E9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                prefixIcon: const Icon(Icons.search, color: AppColors.grey14),
                // fillColor: const Color(0XFFF2F2F2),
                // filled: true,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Danh sách người hâm mộ của bạn',
                style: TextStyle(color: Color(0xff8C8C8C), fontWeight: FontWeight.w400, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  EasyDebounce.debounce('invite all', const Duration(seconds: 1), () {
                    unawaited(widget.controller
                        .inviteFriend(widget.liveData.id.toString(), listUser.map((element) => element.id!).toList()));
                    setState(() {
                      isInvited = true;
                    });
                  });
                },
                child: const Text(
                  'Mời tất cả',
                  style: TextStyle(color: Color(0xff4B84F7), fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Obx(() {
            final list = listUser;
            if (list.isEmpty) {
              return const Center(
                child: Text("Bạn không có bạn bè"),
              );
            }
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.startSelectUser(userId: list[index].id!);
                    },
                    child: UserLisTile(
                      key: GlobalKey(),
                      user: list[index],
                      isInvited: isInvited,
                      onChanged: (User value) {
                        widget.controller.inviteFriend(widget.liveData.id.toString(), [value.id!]);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 0);
                },
                itemCount: list.length);
          }),
        ),
      ],
    );
  }
}
