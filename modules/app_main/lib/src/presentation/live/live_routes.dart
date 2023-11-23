import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'live_home/live_home_screen.dart';

@injectable
class LiveRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        LiveHomeScreen.routeName: (context) {
          return const LiveHomeScreen();
        }
      };
}
