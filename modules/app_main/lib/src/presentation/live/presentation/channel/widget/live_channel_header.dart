import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'leave_live_confirm.dart';

class LiveChannelHeader extends StatelessWidget {
  const LiveChannelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffDFEBFD),
                  Color(0xff2697D6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(90),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff0058DB),
                      Color(0xff10306F),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Obx(() {
                  final host = controller.members.value
                      .firstWhereOrNull((e) => e.isOwner);
                  return IntrinsicHeight(
                    child: Row(
                      children: [
                        if (host == null || host.info.avatar.trim().isEmpty)
                          SizedBox.square(
                            dimension: 28,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(28 / 2),
                              child: ImageWidget(
                                ImageConstants.defaultUserAvatar,
                              ),
                            ),
                          )
                        else
                          CircleNetworkImage(
                            url: host.info.avatar,
                            size: 28,
                          ),
                        const SizedBox(width: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              host?.info.name ?? '',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox.square(
                                  dimension: 12,
                                  child: ImageWidget(
                                    IconAppConstants.icDiamond,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 28,
                          width: 28,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.add,
                            color: Color(0xff4B84F7),
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.showBottomSheetLive(controller);
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Obx(() {
                  if (controller.giftCardLive.value.giversInfo == null) {
                    return const SizedBox();
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.giftCardLive.value.giversInfo!
                        .mapIndexed((index, element) {
                          if (index == 0) {
                            return SizedBox(
                              height: 40,
                              width: 40,
                              child: Stack(
                                children: [
                                  ImageWidget(
                                    IconAppConstants.icTop1Awards,
                                    width: 40,
                                    height: 40,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      child: AvatarWidget(avatar: element.giver?.avatar, size: 25),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                          return SizedBox(
                            child: AvatarWidget(avatar: element.giver?.avatar, size: 30),
                          );
                        })
                        .take(2)
                        .toList()
                        .separated(const SizedBox(width: 8)),
                  );
                }),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      ImageWidget(IconAppConstants.icLiveMember),
                      const SizedBox(width: 2),
                      Obx(
                        () => Text(
                          controller.members.value.length.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CloseButton(
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => LeaveLiveConfirm(
                        onRemoved: () {
                          controller.leaveLive();
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
