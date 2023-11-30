import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/live_data.dart';
import 'live_bottom_controller.dart';
import 'user_listile.dart';

class ListFollowTab extends StatefulWidget {
  final LiveBottomController controller;
  final LiveData liveData;

  const ListFollowTab({super.key, required this.controller, required this.liveData});

  @override
  State<ListFollowTab> createState() => _ListFollowTabState();
}

class _ListFollowTabState extends State<ListFollowTab> {
  bool isInvited = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  widget.controller
                      .inviteFriend(widget.liveData.id.toString(),
                          widget.controller.listFollow.map((element) => element.followee.id!).toList())
                      .then((value) {
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
        const SizedBox(height: 8),
        Expanded(
          child: Obx(() {
            final list = widget.controller.listFollow;
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
                      context.startSelectUser(userId: list[index].followee.id!);
                    },
                    child: UserLisTile(
                      key: GlobalKey(),
                      isInvited: isInvited,
                      user: list[index].followee,
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
