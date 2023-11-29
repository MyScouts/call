import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class MyProfileRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        MyProfileScreen.routeName: (context) {
          return const MyProfileScreen();
        },
      };
}
