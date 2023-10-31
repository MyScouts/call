import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
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
        RegisterMarshopScreen.routeName: (context) {
          return const RegisterMarshopScreen();
        },
      };
}
