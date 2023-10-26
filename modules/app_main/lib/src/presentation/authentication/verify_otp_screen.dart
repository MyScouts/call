import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';
import 'package:design_system/design_system.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const String routeName = "verify-otp";
  final String phoneNumber;
  final String phoneCode;
  final String password;
  const VerifyOTPScreen({
    super.key,
    required this.phoneCode,
    required this.phoneNumber,
    required this.password,
  });

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  String _otp = "";
  bool _otpError = false;
  bool _disabled = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneCompletedRegisterSuccess) {
          hideLoading();
          context.startDashboardUtil();
        }

        if (state is PhoneCompletedRegisterFail) {
          hideLoading();
          showToastMessage(state.message);
          _otpError = true;
          setState(() {});
        }

        if (state is ResendOTPSuccess) {
          hideLoading();
          showToastMessage(S.current.messages_resend_otp_success.capitalize());
        }
      },
      child: ScaffoldHideKeyboard(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nhập mã xác minh",
                    style: context.text.titleLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      style: context.text.titleSmall,
                      text: "Mã xác nhận đã được gửi ",
                      children: [
                        TextSpan(
                          text: "(+${widget.phoneCode}) ${widget.phoneNumber}",
                          style: context.text.titleSmall!.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  OTPInputWidget(
                    onCompleted: (value) {
                      _disabled = false;
                      setState(() {});
                      debugPrint(value);
                      _otp = value;
                    },
                    onChange: () {
                      _disabled = true;
                      setState(() {});
                    },
                    isError: _otpError,
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: "Xác nhận",
                    onTap: _onVerify,
                    color: Colors.white,
                    disabled: _disabled,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child:
                        Text.rich(TextSpan(text: "Gửi lại mã sau?", children: [
                      const TextSpan(text: " "),
                      TextSpan(
                        text: "Gửi lại",
                        recognizer: TapGestureRecognizer()
                          ..onTap = _handleResendOTP,
                        style: context.text.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue10,
                        ),
                      ),
                    ])),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  _onVerify() {
    showLoading();
    context
        .read<UserCubit>()
        .phoneCompletedRegister(CompletedPhoneRegisterPayload(
          phoneNumber: widget.phoneNumber,
          otp: _otp,
          phoneCode: widget.phoneCode,
        ));
  }

  void _handleResendOTP() {
    showLoading();
    context.read<UserCubit>().resendOTP(
          AuthenticationPhonePayload(
            password: widget.password,
            phoneCode: widget.phoneCode,
            phoneNumber: widget.phoneNumber,
          ),
        );
  }
}
