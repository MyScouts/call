import 'package:app_main/src/presentation/marshop/upgrade_marshop/upgrade_marshop_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class MarkShopRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        UpgradeMarshopScreen.routeName: (context) {
          return const UpgradeMarshopScreen();
        },
      };
}
