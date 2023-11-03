import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import '../../../../../core/utils/toast_message/toast_message.dart';
import '../../../../../data/models/responses/register_pdone_response.dart';
import '../../../upgrade_account_constants.dart';
import '../../../upgrade_ja/widgets/gradiant_button.dart';
import '../../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';

class UpgradeAccountVerifyOTPWidget extends StatefulWidget {
  final RegisterPDoneResponse res;

  const UpgradeAccountVerifyOTPWidget({
    super.key,
    required this.res,
  });

  @override
  State<UpgradeAccountVerifyOTPWidget> createState() =>
      _UpgradeAccountVerifyOTPWidgetState();
}

class _UpgradeAccountVerifyOTPWidgetState
    extends State<UpgradeAccountVerifyOTPWidget> with TimerMixin {
  UpdateInformationType get verifyType => widget.res.phone != null
      ? UpdateInformationType.phone
      : UpdateInformationType.email;

  String get text => verifyType == UpdateInformationType.phone
      ? widget.res.phone.formatPhone!
      : widget.res.email!;

  UpgradePDoneBloc get upgradePDoneBloc => context.read<UpgradePDoneBloc>();

  bool _isActive = false;
  String? _otpCode;
  late RegisterPDoneResponse registerPDoneResponse;

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is VerifyOtpLoading) {
      showLoading();
    } else if (state is VerifyOtpSuccess) {
      hideLoading();
      showToastMessage('Xác thực thành công');
      Navigator.pop(context, true);
    } else if (state is VerifyOtpFailure) {
      hideLoading();
      showToastMessage(
        'Mã xác thực không đúng hoặc hết hạn. Xin vui lòng thử lại!!!',
        ToastMessageType.error,
      );
    } else if (state is ResendOtpSuccess) {
      showToastMessage(
        'Yêu cầu gửi lại OTP thành công',
      );
      registerPDoneResponse = state.response;
    } else if (state is ResendOtpFailure) {
      showToastMessage(
        'Yêu cầu gửi lại OTP không thành công',
        ToastMessageType.error,
      );
    }
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => UpgradeAccountConstants.otpTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });

    registerPDoneResponse = widget.res;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _onListenerBloc,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Column(
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
                  'Mã OTP đã được gửi về ${verifyType.title(context)}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: OtpWidget(
                    onOtpChanged: (value) {
                      _otpCode = value;
                      if (value.length == UpgradeAccountConstants.otpLen &&
                          _isActive == false) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: GradiantButton(
                    onPressed: _isActive ? _verifyOTP : null,
                    child: Text(
                      'Xác thực',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOTP() {
    upgradePDoneBloc.add(
      RegisterPDoneVerifyOtpEvent(
        otp: _otpCode!,
        response: registerPDoneResponse,
      ),
    );
  }

  void _onTapResendOtp() {
    restartTimer();
    setState(() {});
    upgradePDoneBloc.add(
      ResendOtpEvent(
          email: widget.res.email,
          phoneCode: widget.res.phoneCode,
          phoneNumber: widget.res.phone),
    );
  }
}
