import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/authentication/authentication_constants.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
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
  final String birthDay;
  final int sex;
  const VerifyOTPScreen({
    super.key,
    required this.phoneCode,
    required this.phoneNumber,
    required this.password,
    required this.birthDay,
    required this.sex,
  });

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with TimerMixin {
  String _otp = "";
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  bool _disabled = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is PhoneCompletedRegisterSuccess) {
            hideLoading();
            context.showCongratulations();
          }

          if (state is PhoneCompletedRegisterFail) {
            hideLoading();
            showToastMessage(state.message, ToastMessageType.error);
            _errorCtr.value = true;
          }

          if (state is ResendOTPSuccess) {
            debugPrint("$state");
            restartTimer();
            hideLoading();
            setState(() {});
            showToastMessage(
              S.current.messages_resend_otp_success.capitalize(),
            );
          }
        },
        child: SafeArea(
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
                    S.current.enter_the_verification_code,
                    style: context.text.titleLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      style: context.text.bodySmall,
                      text: S.current.confirmation_code_has_been_sent,
                      children: [
                        TextSpan(
                          text: " (${widget.phoneCode}) ${widget.phoneNumber}",
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
                      _errorCtr.value = false;
                      setState(() {});
                    },
                    errorCtr: _errorCtr,
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: S.current.confirm,
                    onTap: _onVerify,
                    color: Colors.white,
                    disabled: _disabled,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: timeCtr,
                    builder: (context, value, child) {
                      final timerString =
                          value > 0 ? '(${value.toString()}s)' : '';
                      return Center(
                        child: Text.rich(
                          TextSpan(
                            text: S.current.resend_the_code_later,
                            children: [
                              const TextSpan(text: " "),
                              if (value > 0) TextSpan(text: timerString),
                              if (value <= 0)
                                TextSpan(
                                  text: S.current.resend,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _handleResendOTP,
                                  style: context.text.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blue10,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
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
    context.read<UserCubit>().phoneCompletedRegister(
          CompletedPhoneRegisterPayload(
            phoneNumber: widget.phoneNumber,
            otp: _otp,
            phoneCode: widget.phoneCode.replaceAll("+", ""),
          ),
        );
  }

  void _handleResendOTP() {
    showLoading();
    context.read<UserCubit>().resendOTP(
          RegisterPhonePayload(
            password: widget.password,
            phoneCode: widget.phoneCode.replaceAll("+", ""),
            phoneNumber: widget.phoneNumber,
            birthday: widget.birthDay,
            sex: widget.sex,
          ),
        );
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => AuthenticationConstants.otpTimer;
}
