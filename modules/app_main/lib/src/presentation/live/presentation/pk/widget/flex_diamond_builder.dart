import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/domain/entities/user_diamond_for_pk.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlexDiamondBuilder extends StatefulWidget {
  const FlexDiamondBuilder({super.key, required this.builder});

  final Function(int left, int right) builder;

  @override
  State<FlexDiamondBuilder> createState() => _FlexDiamondBuilderState();
}

class _FlexDiamondBuilderState extends State<FlexDiamondBuilder> {
  late final controller = context.read<LiveChannelController>();
  int _flexLeft = 1;
  int _flexRight = 1;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pkStep.value == PkStep.pending) {
        _flexLeft = 1;
        _flexRight = 1;

        return widget.builder(_flexLeft, _flexRight);
      }

      final diamonds = controller.diamondsPK.value;

      UserDiamondForPK? diamondLeft =
          diamonds.firstWhereOrNull((e) => e.userId == controller.hostOtherID);

      UserDiamondForPK? diamondRight =
          diamonds.firstWhereOrNull((e) => e.userId == controller.hostID);

      if ((diamondLeft?.diamondCount ?? 0) >
          (diamondRight?.diamondCount ?? 0)) {
        _flexLeft = 6;
        _flexRight = 4;
      } else if ((diamondLeft?.diamondCount ?? 0) <
          (diamondRight?.diamondCount ?? 0)) {
        _flexLeft = 4;
        _flexRight = 6;
      }

      return widget.builder(_flexLeft, _flexRight);
    });
  }
}