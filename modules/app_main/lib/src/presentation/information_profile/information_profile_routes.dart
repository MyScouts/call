import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/information_profile/screens/information_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class InfoProfileRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        InformationProfileScreen.routeName: (context) {
          return const InformationProfileScreen();
        },
      };
}
