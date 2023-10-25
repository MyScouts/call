import 'package:flutter/material.dart';

import 'login/login_screen.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startLogin<T>({bool hasDashboard = false}) {
    return Navigator.of(this).pushNamed(LoginScreen.routeName, arguments: {
      'hasDashboard': hasDashboard,
    });
  }

  Future<T?> startLoginUtil<T>() {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
  }

  // Future<T?> startVerifyOtp<T>({
  //   required String token,
  //   required String username,
  //   required CredentialType credentialType,
  //   required TypeOtpGenerate type,
  // }) {
  //   return Navigator.of(this).pushNamed(
  //     VerifyOtpScreen.routeName,
  //     arguments: {
  //       'token': token,
  //       'username': username,
  //       'type': type,
  //       'credentialType': credentialType,
  //     },
  //   );
  // }

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
