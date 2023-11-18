import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart' as user;
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/authentication/authentication_constants.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../../data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import '../../../../domain/entities/update_account/update_profile_payload.dart';

class UpgradePDoneOTPScreen extends StatefulWidget {
  static const String routeName = 'upgrade-pdone-otp';
  final UpdateProfilePayload? payload;

  const UpgradePDoneOTPScreen({
    this.payload,
    super.key,
  });

  @override
  State<UpgradePDoneOTPScreen> createState() => _UpgradePDoneOTPScreenState();
}

class _UpgradePDoneOTPScreenState extends State<UpgradePDoneOTPScreen>
    with TimerMixin {
  final AuthCubit _bloc = injector.get();
  final UpgradeCubit _upgradeCubit = injector.get();
  late final userCubit = context.read<user.UserCubit>();
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  late User _authInfo;
  bool _disabled = true;
  String _otp = "";

  @override
  void initState() {
    _bloc.sendOTP();
    _authInfo = userCubit.currentUser!;
    print(_authInfo);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => startTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _bloc),
        BlocProvider(create: (context) => _upgradeCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
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
          ),
          BlocListener<UpgradeCubit, UpgradeState>(
            listener: (context, state) {
              if (state is OnUpgradePdoneOTP || state is OnUpgradeEkyc) {
                showLoading();
              }

              if (state is UpgradePdoneOTPSuccess ||
                  state is UpgradeEkycSuccess) {
                hideLoading();
                showToastMessage("Bạn đã nâng cấp PDone thành công.");
                context.pop(data: true);
              }

              if (state is UpgradePdoneOTPFail || state is UpgradeEkycFail) {
                final code = state is UpgradeEkycFail
                    ? state.code
                    : state is UpgradeEkycFail
                        ? state.code
                        : null;
                hideLoading();
                String message =
                    S.current.messages_server_internal_error.capitalize();
                switch (code) {
                  case "ALREADY_P_DONE_TYPE":
                    message = "Bạn chưa đủ tuổi để nâng cấp.";
                    break;
                  case "OTP_NOT_MATCH":
                    message = "Mã xác nhận không hợp lệ.";
                    break;
                  default:
                }
                showToastMessage(message, ToastMessageType.error);
              }
            },
          ),
        ],
        child: ScaffoldHideKeyboard(
          body: SafeArea(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
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
                              text:
                                  "(+${_authInfo.phoneCode}) ${_authInfo.phone}",
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
                        onTap: _handleUpgradePDone,
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
                                        ..onTap = () => _bloc.resendOTP(),
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
        ),
      ),
    );
  }

  _handleUpgradePDone() {
    if (widget.payload != null) {
      _upgradeCubit.upgradeEkyc(widget.payload!.copyWith(otp: _otp));
    } else {
      _upgradeCubit.onUpgradeOTP(UpgradePDonePayload(otp: _otp));
    }
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => AuthenticationConstants.otpTimer;
}