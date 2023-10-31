import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class SettingRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SettingScreen.routeName: (context) {
          return const SettingScreen();
        },
      };
}
