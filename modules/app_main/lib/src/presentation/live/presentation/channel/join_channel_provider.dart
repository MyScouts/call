import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'live_channel_screen.dart';

class JoinChannelProvider extends StatelessWidget {
  static const String routerName = '/join_live';

  const JoinChannelProvider({super.key, required this.liveID});

  final int liveID;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => getIt<LiveChannelController>()),
        BlocProvider(create: (_) => getIt<LiveMessageBloc>()),
      ],
      child: LiveChannelScreen(liveID: liveID),
    );
  }
}
