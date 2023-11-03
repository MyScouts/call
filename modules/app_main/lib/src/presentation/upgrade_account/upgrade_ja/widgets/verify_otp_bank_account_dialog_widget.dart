import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../upgrade_agree_policy.bloc.dart';

class VerifyOTPBankAccountDialogWidget extends StatefulWidget {
  final UpdateBankAccountPayload payload;

  const VerifyOTPBankAccountDialogWidget({
    super.key,
    required this.payload,
  });

  @override
  State<VerifyOTPBankAccountDialogWidget> createState() =>
      _VerifyOTPBankAccountDialogWidgetState();
}

class _VerifyOTPBankAccountDialogWidgetState
    extends State<VerifyOTPBankAccountDialogWidget> with TimerMixin {
  bool _isActive = false;

  final TextEditingController _otpController = TextEditingController();

  UserCubit get cubit => context.read<UserCubit>();

  UpdateBankAccountBloc get bloc => context.read<UpdateBankAccountBloc>();

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => 60;

  String token = '';

  void _updateBankAccount() {
    final payload = UpdateBankAccountPayload(
      token: token,
      bankHolder: widget.payload.bankHolder,
      bankId: widget.payload.bankId,
      bankNumber: widget.payload.bankNumber,
      isDefault: true,
      otp: _otpController.text,
    );
    bloc.add(GetDetailDataParam1Event(payload));
  }

  void _onTapResendOtp() {
    _otpController.clear();
    setState(() {});
    cubit.getOtp(isResend: true);
  }

  void _onListenerBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      _otpController.clear();
      showLoading();
    } else if (state is GetDetailDataSuccess) {
      hideLoading();
      Navigator.pop(context);
      context.startCongratulationRegisterDialog();
    } else if (state is GetDetailError) {
      hideLoading();
      showToastMessage(
          'Mã xác thực không đúng hoặc đã hết hạn', ToastMessageType.error);
    }
  }

  void _onListenerResendOTPBloc(BuildContext context, UserState state) {
    if (state is GetOTPSuccess) {
      token = state.otp.token ?? '';
    }
    if (state is ResendUserOTPSuccess) {
      restartTimer();
      showToastMessage('Yêu cầu gửi lại OTP thành công');
      token = state.otp.token ?? '';
    } else if (state is GetOTPFail) {
      showToastMessage(
        state.message,
        ToastMessageType.error,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
      cubit.getOtp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateBankAccountBloc, GetDetailState>(
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: Text(
            //     response.phone.formatPhone ?? '',
            //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
            //   ),
            // ),
            BlocListener<UserCubit, UserState>(
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
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
              child: OtpWidget(
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
                controller: _otpController,
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
                    title: 'Tiếp theo',
                    onTap: _updateBankAccount,
                    disabled: !_isActive,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
