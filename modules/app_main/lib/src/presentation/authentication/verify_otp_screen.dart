import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/authentication/components/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:design_system/design_system.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const String routeName = "verify-otp";
  final String phoneNumber;
  final String phoneCode;
  const VerifyOTPScreen({
    super.key,
    required this.phoneCode,
    required this.phoneNumber,
  });

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  String _otp = "";
  bool _otpError = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneCompletedRegisterSuccess) {
          hideLoading();
        }

        if (state is PhoneCompletedRegisterFail) {
          _otpError = true;
          setState(() {});
          hideLoading();
          showToastMessage(state.message);
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
                      debugPrint(value);
                      _otp = value;
                    },
                    isError: _otpError,
                  ),
                  const SizedBox(height: 30),
                  CustomSubmitButton(
                    title: "Xác nhận",
                    onTap: _onVerify,
                    color: Colors.white,
                    gradientBackgroundColor: const LinearGradient(
                      colors: [
                        Color(0xFF015CB5),
                        Color(0xFF0E86FC),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child:
                        Text.rich(TextSpan(text: "Gửi lại mã sau?", children: [
                      TextSpan(text: " "),
                      TextSpan(text: "Gửi lại"),
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
}
