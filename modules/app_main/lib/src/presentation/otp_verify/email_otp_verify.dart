import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';

class EmailOtpVerify extends StatefulWidget {
  const EmailOtpVerify({super.key, required this.email});

  final String email;

  @override
  State<EmailOtpVerify> createState() => _EmailOtpVerifyState();
}

class _EmailOtpVerifyState extends State<EmailOtpVerify> {
  late final controller = getIt<EmailVerifyController>();

  @override
  void initState() {
    super.initState();
    controller.genOtpEmail(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return OtpScreen(
      type: OtpVerifyType.email,
      onRequestVerify: (otp) async {
        try {
          showLoading();
          await controller.updateEmail(widget.email, otp);
          hideLoading();
          Navigator.of(context).pop(true);
        } catch (e) {
          hideLoading();
          showToastMessage('Mã xác thực không đúng', ToastMessageType.error);
        }
      },
      onResent: () {
        controller.genOtpEmail(widget.email);
      },
    );
  }
}

@injectable
class EmailVerifyController extends ChangeNotifier {
  final UserUsecase usecase;

  EmailVerifyController(this.usecase);

  Future<User> updateEmail(String email, String otp) async {
    return usecase.updateEmail({
      'email': email,
      'otp': otp,
    });
  }

  Future<bool> genOtpEmail(String email) {
    return usecase.genOtpEmail(email);
  }
}
