import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';

enum PkGameStatus {
  win,
  lose,
  draw;
}

class PkWinLoseBuilder extends StatefulWidget {
  const PkWinLoseBuilder({
    super.key,
    required this.liveID,
    required this.builder,
  });

  final int liveID;
  final Widget Function(PkGameStatus status) builder;

  @override
  State<PkWinLoseBuilder> createState() => _PkWinLoseBuilderState();
}

class _PkWinLoseBuilderState extends State<PkWinLoseBuilder> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    final diamonds = controller.diamondsPK.value;

    if (diamonds.isEmpty) return widget.builder(PkGameStatus.draw);

    if (diamonds.first.diamondCount == diamonds.last.diamondCount) {
      return widget.builder(PkGameStatus.draw);
    }

    final userWin = controller.members
        .firstWhereOrNull((e) => e.info.userID == diamonds.last.userId);

    if (userWin?.liveID == widget.liveID) {
      return widget.builder(PkGameStatus.win);
    }

    return widget.builder(PkGameStatus.lose);
  }
}
