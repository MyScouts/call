import 'package:app_main/src/presentation/live/domain/entities/gift_card_list.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';

import '../live_channel_screen.dart';
import '../state/live_channel_controller.dart';

class LiveGiftButton extends StatefulWidget {
  const LiveGiftButton({super.key});

  @override
  State<LiveGiftButton> createState() => _LiveGiftButtonState();
}

class _LiveGiftButtonState extends State<LiveGiftButton> {
  String isIcon = IconAppConstants.icLiveGift;

  @override
  Widget build(BuildContext context) {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;

    return Obx(() {
      final times = controller.timesAnimation.value;

      return IgnorePointer(
        ignoring: times > 0,
        child: InkWell(
          onTap: () {
            context.showBottomGift(controller).then((value) {
              if (value is GiftCard) {
                setState(() {
                  isIcon = value.imageGift!;
                });
              }
            });
          },
          child: SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              children: [
                Opacity(
                  opacity: times > 0 ? 0.8 : 1,
                  child: Ink(
                    decoration:
                        times > 0 ? BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle) : null,
                    height: 60,
                    width: 60,
                    child: ImageWidget(isIcon),
                  ),
                ),
                Visibility(
                    visible: times > 0,
                    child: Center(
                        child: Text(
                      times.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ]),
                    )))
              ],
            ),
          ),
        ),
      );
    });
  }
}
