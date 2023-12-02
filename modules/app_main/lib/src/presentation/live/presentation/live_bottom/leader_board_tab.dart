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

  Widget getAvatar(String avatar, int rank) {
    String stringImage;
    if (rank == 1) {
      stringImage = IconAppConstants.icTop1Awards;
    } else if (rank == 2) {
      stringImage = IconAppConstants.icTop2Awards;
    } else {
      stringImage = IconAppConstants.icTop3Awards;
    }
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Visibility(
            visible: rank == 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ImageWidget(
                  IconAppConstants.icTop1Back,
                  height: 74,
                )),
          ),
          Align(
              alignment: Alignment.center,
              child: ImageWidget(
                stringImage,
                height: 74,
                width: 74,
              )),
          Align(
            alignment: Alignment.center,
            child: AvatarWidget(
              avatar: avatar,
              size: 43,
            ),
          ),
          Visibility(
            visible: rank == 1,
            child: Align(
              alignment: Alignment.topCenter,
              child: ImageWidget(
                IconAppConstants.icCrown,
                height: 17,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = widget.controller.giftCardLive.value.giversInfo ?? [];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 144,
              child: Row(
                children: [
                  Expanded(
                      child: list.length >= 2
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 84,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0xffccccf2), Color(0x00efefef)],
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(list[1].giver?.displayName ?? '',
                                            style: const TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff4D4EA2))),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ImageWidget(
                                              IconAppConstants.icDiamond,
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(list[1].coinSrt ?? '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: getAvatar(list[1].giver?.avatar ?? '', 2),
                                    )),
                              ],
                            )
                          : const SizedBox()),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: list.isNotEmpty
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 100,
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0xffffe68e), Color(0x00fff7c7)],
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(list[0].giver?.displayName ?? '',
                                            style: const TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff783011))),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ImageWidget(
                                              IconAppConstants.icDiamond,
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(list[0].coinSrt ?? '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: getAvatar(list.firstOrNull?.giver?.avatar ?? '', 1)),
                              ],
                            )
                          : const SizedBox()),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: list.length >= 3
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 84,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0xfff9c1b1), Color(0x00f4f4f4)],
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(list[2].giver?.displayName ?? '',
                                            style: const TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff970800))),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ImageWidget(
                                              IconAppConstants.icDiamond,
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(list[2].coinSrt ?? '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: getAvatar(list[2].giver?.avatar ?? '', 3),
                                    )),
                              ],
                            )
                          : const SizedBox()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: index > 2,
                    child: GestureDetector(
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
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Visibility(
                      visible: index> 2,
                      child: const SizedBox(height: 0));
                },
                itemCount: list.length),
          ),
        ],
      );
    });
  }
}
