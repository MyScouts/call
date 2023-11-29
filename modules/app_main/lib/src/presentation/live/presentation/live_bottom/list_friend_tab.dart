import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/live_data.dart';
import 'live_bottom_controller.dart';
import 'user_listile.dart';

class ListFriendTab extends StatefulWidget {
  final LiveBottomController controller;
  final LiveData liveData;

  const ListFriendTab({super.key, required this.controller, required this.liveData});

  @override
  State<ListFriendTab> createState() => _ListFriendTabState();
}

class _ListFriendTabState extends State<ListFriendTab> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = widget.controller.dataGetInviteFriend.value.rows ?? [];
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
                context.startSelectUser(userId: list[index].userFollow!.id!);
              },
              child: UserLisTile(
                user: list[index].userFollow!,
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
    });
  }
}
