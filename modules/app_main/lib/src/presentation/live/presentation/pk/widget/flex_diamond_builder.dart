import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/domain/entities/user_diamond_for_pk.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlexDiamondBuilder extends StatefulWidget {
  const FlexDiamondBuilder({super.key, required this.builder});

  final Function(
    int left,
    int right,
    int leftCount,
    int rightCount,
  ) builder;

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
      final diamonds = controller.diamondsPK.value;

      if (controller.pkStep.value == PkStep.pending) {
        _flexLeft = 1;
        _flexRight = 1;

        return widget.builder(_flexLeft, _flexRight, 0, 0);
      }

      UserDiamondForPK? diamondLeft =
          diamonds.firstWhereOrNull((e) => e.userId == controller.hostID);

      UserDiamondForPK? diamondRight =
          diamonds.firstWhereOrNull((e) => e.userId == controller.hostOtherID);

      final leftCount = (diamondLeft?.diamondCount ?? 0);
      final rightCount = (diamondRight?.diamondCount ?? 0);

      if (leftCount > rightCount) {
        _flexLeft = 6;
        _flexRight = 4;
      } else if (leftCount < rightCount) {
        _flexLeft = 4;
        _flexRight = 6;
      } else {
        _flexLeft = 1;
        _flexRight = 1;
      }

      return widget.builder(
        _flexLeft,
        _flexRight,
        leftCount,
        rightCount,
      );
    });
  }
}
