import 'package:app_main/src/presentation/live/domain/entities/gifter_info.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/presentation/live_bottom/live_bottom_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../channel/state/live_channel_controller.dart';

class ViewerTab extends StatefulWidget {
  final LiveChannelController controller;
  final LiveBottomController liveBottomController;

  const ViewerTab({super.key, required this.controller, required this.liveBottomController});

  @override
  State<ViewerTab> createState() => _ViewerTabState();
}

class _ViewerTabState extends State<ViewerTab> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.startSelectUser(userId: widget.controller.members[index].info.userID);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  children: [
                    Text((index + 1).toString(),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff8B8E9A))),
                    const SizedBox(width: 10),
                    AvatarWidget(
                      avatar: widget.controller.members[index].info.avatar,
                      size: 36,
                      isPDone: widget.controller.members[index].info.type > 0,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(widget.controller.members[index].info.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              const SizedBox(width: 8),
                              Visibility(
                                visible: widget.controller.members[index].isOwner,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(colors: [Color(0xff3679F6), Color(0xff79F7DD)])),
                                  child: const Text("Chủ phòng",
                                      style: TextStyle(
                                          fontSize: 8, fontWeight: FontWeight.w700, height: 1, color: Colors.white)),
                                ),
                              )
                            ],
                          ),
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
                    Obx(() {
                      final count = widget.liveBottomController.giftCardLive.value.giversInfo?.firstWhereOrNull(
                          (element) => element.giver?.id == widget.controller.members[index].info.userID);
                      return Visibility(
                        visible: !widget.controller.members[index].isOwner,
                        child: Row(
                          children: [
                            Text(count?.coinSrt ?? '',
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
                        ),
                      );
                    })
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 0);
          },
          itemCount: widget.controller.members.length);
    });
  }
}
