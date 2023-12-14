import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PkDiamondProcess extends StatelessWidget {
  const PkDiamondProcess({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Obx(() {
      final meInLive = controller.pkData!.lives.firstWhereOrNull(
              (e) => e.user!.id == controller.me.value.info.userID) !=
          null;

      final diamondPk = controller.diamondsPK.value;

      Widget left;
      Widget right;
      LiveData? host;

      if (meInLive) {
        host = controller.pkData!.lives.firstWhereOrNull(
            (e) => e.user!.id != controller.me.value.info.userID);
      } else {
        host = controller.pkData!.lives
            .firstWhereOrNull((e) => e.user!.id != controller.hostID);
      }

      final diamondLeft =
          diamondPk.firstWhereOrNull((e) => e.userId == host!.user!.id);

      final diamondRight =
          diamondPk.firstWhereOrNull((e) => e.userId != host!.user!.id);

      left = AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Container(
          color: const Color(0xffFE1D67),
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Text(
            '${diamondLeft?.diamondCount ?? 0}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      );

      right = AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Container(
          color: const Color(0xff00BBE4),
          padding: const EdgeInsets.symmetric(horizontal: 9),
          alignment: Alignment.centerRight,
          child: Text(
            '${diamondRight?.diamondCount ?? 0}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      );

      int flexLeft = 1;
      int flexRight = 1;

      if ((diamondLeft?.diamondCount ?? 0) >
          (diamondRight?.diamondCount ?? 0)) {
        flexLeft = 6;
        flexRight = 4;
      } else if ((diamondLeft?.diamondCount ?? 0) <
          (diamondRight?.diamondCount ?? 0)) {
        flexLeft = 4;
        flexRight = 6;
      }

      return Container(
        height: 22,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffFFC656), width: 3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: flexLeft, child: left),
            Expanded(flex: flexRight, child: right),
          ],
        ),
      );
    });
  }
}
