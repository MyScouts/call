import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class DashboardRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DashboardScreen.routeName: (context) {
          return const DashboardScreen();
        },
      };
}
