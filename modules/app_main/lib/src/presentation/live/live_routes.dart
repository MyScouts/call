import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/join_channel_provider.dart';
import 'package:app_main/src/presentation/live/presentation/live_tab/live_home_search.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'live_wrapper_screen.dart';
import 'presentation/live_home/live_home_screen.dart';

@injectable
class LiveRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        LiveHomeScreen.routeName: (context) {
          return const LiveHomeScreen();
        },
        LiveStreamSearch.routeName: (context) {
          return const LiveStreamSearch();
        },
        LiveWrapperScreen.routerName: (context) {
          return const LiveWrapperScreen(isCreated: true);
        },
        JoinChannelProvider.routerName: (context) {
          final id = settings.arguments as int;
          return JoinChannelProvider(liveID: id);
        },
        JoinChannelPasswordProvider.routerName: (context) {
          final id = (settings.arguments as Map)['liveID'];
          final pass = (settings.arguments as Map)['password'];
          return JoinChannelPasswordProvider(liveID: id, password: pass);
        },
      };
}
