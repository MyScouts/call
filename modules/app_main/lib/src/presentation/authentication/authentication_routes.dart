import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../core/router/route_module.dart';
import 'login/login_screen.dart';

@injectable
class AuthenticationRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        LoginScreen.routeName: (context) {
          return const LoginScreen();
        },
      };
}
