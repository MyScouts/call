import 'package:app_main/src/presentation/marshop/upgrade_marshop/register_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class MarkShopRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RegisterCustomerScreen.routeName: (context) {
          return const RegisterCustomerScreen();
        },
      };
}
