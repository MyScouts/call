import 'package:app_main/src/presentation/pdone/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class PDoneRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        ProfileScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return ProfileScreen(
            userId: args['userId'],
          );
        },
      };
}
