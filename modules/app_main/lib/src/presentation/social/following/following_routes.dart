import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'screens/following_screen.dart';

@injectable
class FollowingRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        FollowingScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return FollowingScreen(
            user: args["user"],
            friendCount: args["friendCount"],
            followerCount: args["followerCount"],
            followeeCount: args["followeeCount"],
            followingType: args["followingType"],
          );
        },
      };
}
