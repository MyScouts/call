import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
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
  final PDoneActionType type;

  const VerifyPhoneOTPDialogWidget({
    super.key,
    required this.response,
    required this.type,
  });

  @override
  State<VerifyPhoneOTPDialogWidget> createState() => _VerifyPhoneOTPDialogWidgetState();
}

class _VerifyPhoneOTPDialogWidgetState extends State<VerifyPhoneOTPDialogWidget> with TimerMixin {
  late UpgradeAccountResponse response;
  bool _isActive = false;
  String? _otpCode;

  UpgradeAccountVerifyPhoneBloc get bloc => context.read<UpgradeAccountVerifyPhoneBloc>();

  ResendOTPPhoneBloc get resendOtpBloc => context.read<ResendOTPPhoneBloc>();

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => 60;

  void _verifyOTP() {
    bloc.add(
      GetDetailDataParam2Event(
        VerifyPhoneOtpPayload(
          otp: _otpCode!,
          token: response.token,
          teamId: response.teamId,
        ),
        widget.type,
      ),
    );
  }

  void _onTapResendOtp() {
    restartTimer();
    setState(() {});

    resendOtpBloc.add(GetDetailDataParam1Event(widget.type));
  }

  void _onListenerBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<bool>) {
      hideLoading();
      showToastMessage('Xác thực thành công');
      Navigator.pop(context, true);
    } else if (state is GetDetailError) {
      hideLoading();
      showToastMessage('Mã xác thực không đúng hoặc đã hết hạn', ToastMessageType.error);
    }
  }

  void _onListenerResendOTPBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataSuccess<UpgradeAccountResponse>) {
      showToastMessage('Yêu cầu gửi lại OTP thành công');
      final String? teamId = response.teamId;
      response = state.data.copyWith(teamId: teamId);
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
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                response.phone.formatPhone ?? '',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            BlocListener<ResendOTPPhoneBloc, GetDetailState>(
              listener: _onListenerResendOTPBloc,
              child: Center(
                child: builderTimer(
                  (context, value, child) {
                    final timerString = value > 0 ? '(${value.toString()}s)' : '';
                    if (value > 0) {
                      return Text(
                        'Gửi lại $timerString',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.blue31),
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
              child: PrimaryButton(title: 'Xác thực', onTap: _isActive ? _verifyOTP : null, disabled: false),
            ),
          ],
        ),
      ),
    );
  }
}
