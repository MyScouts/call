import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'forgot_password/forgot_password_screen.dart';
import 'login/login_screen.dart';
import 'login/verify_otp_screen.dart';

@injectable
class AuthenticationRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        AuthenticateScreen.routeName: (context) {
          return const AuthenticateScreen();
        },
        VerifyOTPScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return VerifyOTPScreen(
            phoneCode: args['phoneCode'],
            phoneNumber: args['phoneNumber'],
            password: args["password"],
          );
        },
        ForgotPasswordScreen.routeName: (context) {
          return const ForgotPasswordScreen();
        },
      };
}
