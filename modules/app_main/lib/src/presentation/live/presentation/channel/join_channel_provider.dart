import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'live_channel_screen.dart';

class JoinChannelProvider extends StatelessWidget {
  static const String routerName = '/join_live';
  const JoinChannelProvider({super.key, required this.liveID});

  final int liveID;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => getIt<LiveChannelController>(),
      child: LiveChannelScreen(liveID: liveID),
    );
  }
}
