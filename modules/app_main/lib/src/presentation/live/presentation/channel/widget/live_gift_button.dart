import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../live_channel_screen.dart';

class LiveGiftButton extends StatelessWidget {
  const LiveGiftButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;
    return InkWell(
      onTap: () {
        context.showBottomGift(controller);
      },
      child: Ink(
        height: 60,
        width: 60,
        child: ImageWidget(IconAppConstants.icLiveGift),
      ),
    );
  }
}
