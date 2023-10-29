import 'package:app_main/src/presentation/authentication/login/login_screen.dart';
import 'package:app_main/src/presentation/authentication/login/verify_otp_screen.dart';
import 'package:app_main/src/presentation/authentication/widget/congrutulation_dialog.dart';
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
}
