import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/data/data.dart';
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_constant.dart';
import 'package:wallet/presentation/wallet_coodinator.dart';
import 'package:wallet/presentation/wallet_vnd/bank_account/bloc/bank_account_bloc.dart';

class VerifyOTPWithdrawScreen extends StatefulWidget {
  final WithdrawRequest request;
  static const String routeName = '/verify-otp-wallet';

  const VerifyOTPWithdrawScreen({super.key, required this.request});

  @override
  State<VerifyOTPWithdrawScreen> createState() =>
      _VerifyOTPWithdrawScreenState();
}

class _VerifyOTPWithdrawScreenState extends State<VerifyOTPWithdrawScreen>
    with TimerMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc.add(const BankAccountEvent.requestWithdrawOtp());
      startTimer();
    });

    super.initState();
  }

  String _otp = "";
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  bool _disabled = true;

  late final _bloc = context.read<BankAccountBloc>();

  _onVerify(BuildContext context) {
    showLoading();
    final request = WithdrawRequest(
      value: widget.request.value,
      bankAccountId: widget.request.bankAccountId,
      otp: _otp,
    );
    _bloc.add(BankAccountEvent.withdraw(request: request));
  }

  void _handleResendOTP() {
    showLoading();
    _bloc.add(const BankAccountEvent.resendWithdrawOtp());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      body: BlocListener<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          state.whenOrNull(
            withdrawLoaded: () {
              hideLoading();
              injector<WalletBloc>().add(const WalletEvent.getWalletInfo());
              context.showWaitingDialog(
                onAction: () {
                  context.backToWithdraw();
                },
              );
            },
            error: (err) {
              hideLoading();
              showToastMessage(err, ToastMessageType.error);
              _errorCtr.value = true;
            },
            resendOtpSuccess: () {
              restartTimer();
              hideLoading();
              showToastMessage('Gửi lại OTP thành công');
              setState(() {});
            },
          );
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nhập mã xác minh',
                      style: context.text.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Mã xác nhận đã được gửi về số điện thoại của bạn',
                      style: context.text.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    VerifyOTPInputWidget(
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
                      title: 'Xác nhận',
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
                              text: '',
                              children: [
                                if (value > 0)
                                  TextSpan(
                                      text: 'Gửi lại mã sau ',
                                      style: context.text.bodyMedium?.copyWith(
                                        color: const Color(0xFF6E6E6E),
                                      )),
                                TextSpan(
                                  text: timerString,
                                  style: context.text.bodyMedium!.copyWith(
                                    color: const Color(0xFF085CAF),
                                  ),
                                ),
                                if (value <= 0)
                                  TextSpan(
                                    text: 'Gửi lại',
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
      ),
    );
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => WalletConstant.timeInputLimit;
}
