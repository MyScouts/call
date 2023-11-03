import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../../../data/models/responses/upgrade_account_response.dart';
import '../../../../domain/entities/commity_action_type.dart';
import '../upgrade_agree_policy.bloc.dart';

const showResendOTP = false;

class VerifyPhoneOTPDialogWidget extends StatefulWidget {
  final UpgradeAccountResponse response;

  const VerifyPhoneOTPDialogWidget({
    super.key,
    required this.response,
  });

  @override
  State<VerifyPhoneOTPDialogWidget> createState() =>
      _VerifyPhoneOTPDialogWidgetState();
}

class _VerifyPhoneOTPDialogWidgetState extends State<VerifyPhoneOTPDialogWidget>
    with TimerMixin {
  late UpgradeAccountResponse response;
  bool _isActive = false;
  final TextEditingController _otpController = TextEditingController();

  UpgradeAccountVerifyPhoneBloc get bloc =>
      context.read<UpgradeAccountVerifyPhoneBloc>();

  ResendOTPPhoneBloc get resendOtpBloc => context.read<ResendOTPPhoneBloc>();

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => 60;

  void _verifyOTP() {
    bloc.add(
      GetDetailDataParam1Event(
        VerifyPhoneOtpPayload(
          otp: _otpController.text,
          token: response.token,
        ),
      ),
    );
  }

  void _onTapResendOtp() {
    restartTimer();
    setState(() {});

    resendOtpBloc.add(GetDetailDataParam1Event(PDoneActionType.registerJA));
  }

  void _onListenerBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<bool>) {
      hideLoading();
      Navigator.pop(context, true);
      context.startDialogSendRequestJASuccess();

    } else if (state is GetDetailError) {
      hideLoading();
      _otpController.clear();
      showToastMessage(
          'Mã xác thực không đúng hoặc đã hết hạn', ToastMessageType.error);
    }
  }

  void _onListenerResendOTPBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataSuccess<UpgradeAccountResponse>) {
      showToastMessage('Yêu cầu gửi lại OTP thành công');
      _otpController.clear();
    } else if (state is GetDetailError) {
      showToastMessage(
        'Yêu cầu gửi lại OTP không thành công',
        ToastMessageType.error,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });

    response = widget.response;
  }

  @override
  void dispose() {
    if (!mounted) {
      _otpController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpgradeAccountVerifyPhoneBloc, GetDetailState>(
      listener: _onListenerBloc,
      child: Material(
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
              'Mã OTP đã được gửi về số điện thoại',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                response.phone.formatPhone ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            BlocListener<ResendOTPPhoneBloc, GetDetailState>(
              listener: _onListenerResendOTPBloc,
              child: Center(
                child: builderTimer(
                  (context, value, child) {
                    final timerString =
                        value > 0 ? '(${value.toString()}s)' : '';
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.blue31,
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapResendOtp,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: OtpWidget(
                controller: _otpController,
                onOtpChanged: (value) {
                  _otpController.text = value;
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
              child: ValueListenableBuilder(
                valueListenable: ValueNotifier(_isActive),
                builder: (_, __, ___) {
                  return PrimaryButton(
                      title: 'Xác thực',
                      onTap: _verifyOTP,
                      disabled: !_isActive);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
