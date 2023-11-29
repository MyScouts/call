import 'package:app_main/src/presentation/live/domain/entities/gifter_info.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'live_bottom_controller.dart';

class LeaderBoardTab extends StatefulWidget {
  final LiveBottomController controller;

  const LeaderBoardTab({super.key, required this.controller});

  @override
  State<LeaderBoardTab> createState() => _LeaderBoardTabState();
}

class _LeaderBoardTabState extends State<LeaderBoardTab> {
  Widget iconLeader(int index) {
    if (index == 0) {
      return ImageWidget(
        IconAppConstants.icTop1Awards,
        width: 32,
        height: 32,
      );
    }
    if (index == 1) {
      return ImageWidget(
        IconAppConstants.icTop2Awards,
        width: 32,
        height: 32,
      );
    }
    if (index == 2) {
      return ImageWidget(
        IconAppConstants.icTop3Awards,
        width: 32,
        height: 32,
      );
    }
    return SizedBox(
      height: 32,
      width: 32,
      child: Text(
        index.toString(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = widget.controller.giftCardLive.value.giversInfo ?? [];
      return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.startSelectUser(userId: list[index].giver!.id!);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  children: [
                    iconLeader(index),
                    const SizedBox(width: 1.82),
                    AvatarWidget(
                      avatar: list[index].giver?.avatar,
                      size: 36,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(list[index].giver?.displayName ?? '',
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
                    Row(
                      children: [
                        Text(list[index].coinSrt,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(width: 4),
                        ImageWidget(
                          IconAppConstants.icDiamond,
                          width: 16,
                          height: 16,
                        )
                      ],
                    )
                  ],
                ),
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
