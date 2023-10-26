import 'package:app_main/src/presentation/authentication/authenticate_screen.dart';
import 'package:app_main/src/presentation/authentication/verify_otp_screen.dart';
import 'package:flutter/material.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startLogin<T>({bool hasDashboard = false}) {
    return Navigator.of(this)
        .pushNamed(AuthenticateScreen.routeName, arguments: {
      'hasDashboard': hasDashboard,
    });
  }

  Future<T?> startLoginUtil<T>() {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      AuthenticateScreen.routeName,
      (route) => false,
    );
  }

  Future<T?> startVerifyOtp<T>({
    required String phoneNumber,
    required String phoneCode,
    required String password,
  }) {
    return Navigator.of(this).pushNamed(VerifyOTPScreen.routeName, arguments: {
      "phoneNumber": phoneNumber,
      "phoneCode": phoneCode,
      "password": password,
    });
  }

  // Future<T?> startEnterName<T>() {
  //   return Navigator.of(this).pushReplacementNamed(EnterNameScreen.routeName);
  // }

  // Future<T?> startForgotPassword<T>() {
  //   return Navigator.of(this).pushNamed(ForgotPasswordScreen.routeName);
  // }

  // Future<T?> startEnterNewPassword<T>({
  //   required String token,
  //   required String otp,
  //   required CredentialType type,
  //   required String username,
  // }) {
  //   return Navigator.of(this)
  //       .pushReplacementNamed(EnterNewPasswordScreen.routeName, arguments: {
  //     'token': token,
  //     'otp': otp,
  //     'type': type,
  //     'username': username,
  //   });
  // }
}
