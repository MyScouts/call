import 'package:app_main/src/presentation/authentication/forgot_password/forgot_password_verify_otp.dart';
import 'package:app_main/src/presentation/authentication/forgot_password/reset_password_screen.dart';
import 'package:app_main/src/presentation/authentication/login/login_screen.dart';
import 'package:app_main/src/presentation/authentication/login/verify_otp_screen.dart';
import 'package:app_main/src/presentation/authentication/widget/congratulation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'forgot_password/forgot_password_screen.dart';

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

  Future<T?> startForgotPassword<T>() {
    return Navigator.of(this).pushNamed(
      ForgotPasswordScreen.routeName,
    );
  }

  Future<T?> startVerifyOtp<T>({
    required String phoneNumber,
    required String phoneCode,
    required String password,
    required String birthDay,
    required int sex,
  }) {
    return Navigator.of(this).pushNamed(VerifyOTPScreen.routeName, arguments: {
      "phoneNumber": phoneNumber,
      "phoneCode": phoneCode,
      "password": password,
      "birthDay": birthDay,
      "sex": sex,
    });
  }

  Future<T?> showCongratulations<T>({Widget? content, Widget? button}) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return const CongratulationRegisterDialog();
      },
    );
  }

  Future<T?> startResetPasswordToken<T>({
    required String phoneNumber,
    required String phoneCode,
  }) {
    return Navigator.of(this).pushNamed(
      ForgotPasswordVerifyOTPScreen.routerName,
      arguments: {
        "phoneNumber": phoneNumber,
        "phoneCode": phoneCode,
      },
    );
  }

  Future<T?> startResetPasswordScreen<T>({
    required String phoneNumber,
    required String phoneCode,
    required String ott,
  }) {
    return Navigator.of(this).pushNamed(
      ResetPasswordScreen.routerName,
      arguments: {
        "phoneNumber": phoneNumber,
        "phoneCode": phoneCode,
        "ott": ott,
      },
    );
  }

  Future<T?> requiredLogin<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ActionDialog(
          title: "Bạn có muốn đăng nhập để dùng ứng dụng?",
          actionTitle: "Đăng nhập",
          onAction: () => context.startLoginUtil(),
        );
      },
    );
  }
}
