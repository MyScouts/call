import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

const showResendOTP = false;

class VerifyPhoneOTPDialogWidget extends StatefulWidget {
  final Function(String) onVerify;
  final String? phone;
  const VerifyPhoneOTPDialogWidget({
    super.key,
    required this.onVerify,
    this.phone,
  });

  @override
  State<VerifyPhoneOTPDialogWidget> createState() =>
      _VerifyPhoneOTPDialogWidgetState();
}

class _VerifyPhoneOTPDialogWidgetState extends State<VerifyPhoneOTPDialogWidget>
    with TimerMixin {
  bool _isActive = false;
  String? _otpCode;

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => 60;

  void _onTapResendOtp() {
    restartTimer();
    context.read<AuthCubit>().resendOTP();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: const Icon(
                Icons.close,
                color: AppColors.grey8,
              ),
            ),
          ),
          Text(
            'Mã OTP đã được gửi về số điện thoại ${widget.phone.formatPhone}',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: builderTimer(
              (context, value, child) {
                final timerString = value > 0 ? '(${value.toString()}s)' : '';
                if (value > 0) {
                  return Text(
                    'Gửi lại $timerString',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.blue31),
                  );
                }
                return RichText(
                  text: TextSpan(
                    text: 'Yêu cầu gửi lại mã',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppColors.blue31,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = _onTapResendOtp,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: OtpWidget(
              onOtpChanged: (value) {
                _otpCode = value;
                if (value.length == 6 && _isActive == false) {
                  setState(() {
                    _isActive = true;
                  });
                } else if (_isActive) {
                  setState(() {
                    _isActive = false;
                  });
                }
              },
              selectedColor: AppColors.blue10,
              textColor: AppColors.blue10,
              activeColor: AppColors.purple10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: PrimaryButton(
              title: 'Xác thực',
              onTap: () {
                if (!_isActive) return;
                widget.onVerify(_otpCode.toString());
              },
              disabled: !_isActive,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
