import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';
import '../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../authentication/authentication_constants.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';

class UpdatePDoneOtp extends StatefulWidget {
  UpgradePDoneBloc blocUpdate;
  UpdateProfilePayload payload;
  PDoneOptionRangeAge rangeAge;

  UpdatePDoneOtp({
    super.key,
    required this.blocUpdate,
    required this.payload,
    required this.rangeAge,
  });

  @override
  State<UpdatePDoneOtp> createState() => _UpdatePDoneOtpState();
}

class _UpdatePDoneOtpState extends State<UpdatePDoneOtp> with TimerMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
    super.initState();
  }

  String _otp = "";
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  bool _disabled = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScaffoldHideKeyboard(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: paddingHorizontal, vertical: 36),
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
                          text: " (+84) ${383916526}",
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
                    onTap: () {
                      _onVerify(context);
                    },
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
                              if (value > 0)
                                TextSpan(
                                  text: timerString,
                                  style: context.text.bodyMedium!.copyWith(
                                    color: AppColors.blue10,
                                  ),
                                ),
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
        ),
      ),
    );
  }

  _onVerify(BuildContext context) {
    widget.payload = widget.payload.copyWith(otp: _otp);
    widget.blocUpdate
        .add(UpdatePDoneProfileEvent(widget.payload, widget.rangeAge));
    Navigator.of(context).pop();
    showLoading();
    // context.read<UserCubit>().phoneCompletedRegister(
    //   CompletedPhoneRegisterPayload(
    //     phoneNumber: widget.phoneNumber,
    //     otp: _otp,
    //     phoneCode: widget.phoneCode.replaceAll("+", ""),
    //   ),
    // );
  }

  void _handleResendOTP() {
    widget.blocUpdate.add(UpdatePDoneSendOTP());
    showLoading();
    // context.read<UserCubit>().resendOTP(
    //   AuthenticationPhonePayload(
    //     password: widget.password,
    //     phoneCode: widget.phoneCode.replaceAll("+", ""),
    //     phoneNumber: widget.phoneNumber,
    //   ),
    // );
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => AuthenticationConstants.otpTimer;
}
