import 'package:app_main/src/presentation/live/domain/entities/gifter_info.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'live_bottom_controller.dart';

class ListFriendTab extends StatefulWidget {
  final LiveBottomController controller;

  const ListFriendTab({super.key, required this.controller});

  @override
  State<ListFriendTab> createState() => _ListFriendTabState();
}

class _ListFriendTabState extends State<ListFriendTab> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = widget.controller.dataGetInviteFriend.value.rows ?? [];
      return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                children: [
                  const SizedBox(width: 1.82),
                  AvatarWidget(
                    avatar: list[index].userFollow?.avatar,
                    size: 36,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(list[index].userFollow?.displayName ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        Row(
                          children: [
                            ImageWidget(IconAppConstants.icMaleSVG),
                            const SizedBox(width: 4),
                            const Row(
                              children: [
                                Text("Lv.15",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
