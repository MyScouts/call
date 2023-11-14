import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/authentication/forgot_password/forgot_password_verify_otp.dart';
import 'package:app_main/src/presentation/authentication/forgot_password/reset_password_screen.dart';
import 'package:app_main/src/presentation/authentication/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'forgot_password/forgot_password_screen.dart';
import 'login/login_screen.dart';
import 'login/verify_otp_screen.dart';

@injectable
class AuthenticationRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SplashScreen.routeName: (context) {
          return const SplashScreen();
        },
        AuthenticateScreen.routeName: (context) {
          return const AuthenticateScreen();
        },
        VerifyOTPScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return VerifyOTPScreen(
            phoneCode: args['phoneCode'],
            phoneNumber: args['phoneNumber'],
            password: args["password"],
            birthDay: args['birthDay'],
            sex: args['sex'],
          );
        },
        ForgotPasswordScreen.routeName: (context) {
          return const ForgotPasswordScreen();
        },
        ForgotPasswordVerifyOTPScreen.routerName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return ForgotPasswordVerifyOTPScreen(
            phoneCode: args['phoneCode'],
            phoneNumber: args['phoneNumber'],
          );
        },
        ResetPasswordScreen.routerName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return ResetPasswordScreen(
            phoneCode: args['phoneCode'],
            phoneNumber: args['phoneNumber'],
            ott: args['ott'],
          );
        },
      };
}
