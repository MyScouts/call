import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../../di/di.dart';
import '../../../domain/usecases/live_usecases.dart';
import '../live_channel_screen.dart';

class LiveRoseButton extends StatelessWidget {
  const LiveRoseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;

    return InkWell(
      onTap: () async {
        final LiveUseCase useCase = getIt.get<LiveUseCase>();

        try {
          await useCase.sendGift(userId: controller.info.user!.id!, liveId: controller.info.id, giftId: 90, total: 1);
        } catch (e) {}
      },
      child: Ink(
        height: 60,
        width: 60,
        child: ImageWidget(IconAppConstants.icLiveRose),
      ),
    );
  }
}
