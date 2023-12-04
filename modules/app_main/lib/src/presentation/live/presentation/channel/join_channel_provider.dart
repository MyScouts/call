import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'live_channel_screen.dart';

class JoinChannelProvider extends StatelessWidget {
  static const String routerName = '/join_live';

  const JoinChannelProvider({
    super.key,
    required this.liveID,
  });

  final int liveID;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => getIt<LiveChannelController>()),
        BlocProvider(create: (_) => getIt<LiveMessageBloc>()),
      ],
      child: Builder(
        builder: (_) {
          if (PipHandler.showPip.value) {
            PipHandler.disposeController();
          }
          return LiveChannelScreen(liveID: liveID);
        },
      ),
    );
  }
}

class JoinChannelPasswordProvider extends StatelessWidget {
  static const String routerName = '/join_live_pass';

  const JoinChannelPasswordProvider({
    super.key,
    required this.liveID,
    required this.password,
  });

  final int liveID;
  final String password;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          lazy: false,
          create: (_) => getIt<LiveChannelController>()
            ..setPassword(password),
        ),
        BlocProvider(create: (_) => getIt<LiveMessageBloc>()),
      ],
      child: Builder(
        builder: (_) {
          if (PipHandler.showPip.value) {
            PipHandler.disposeController();
          }
          return LiveChannelScreen(liveID: liveID);
        },
      ),
    );
  }
}
