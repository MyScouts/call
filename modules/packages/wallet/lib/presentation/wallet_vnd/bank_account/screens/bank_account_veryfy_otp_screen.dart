import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../shared/widgets/otp_box_widget.dart';
import '../../../wallet_constant.dart';
import '../../../wallet_coodinator.dart';
import '../bloc/bank_account_bloc.dart';

class VerifyBankAccountOTPScreen extends StatefulWidget {
  static const String routeName = '/verify-bank-account-otp';

  const VerifyBankAccountOTPScreen({super.key});

  @override
  State<VerifyBankAccountOTPScreen> createState() =>
      _VerifyBankAccountOTPScreenState();
}

class _VerifyBankAccountOTPScreenState extends State<VerifyBankAccountOTPScreen>
    with TimerMixin {
  late final _paddingBottom = MediaQuery.of(context).padding.bottom;
  late final _bloc = context.read<BankAccountBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _errorCtr.dispose();
    super.dispose();
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {
    // reset
  }

  @override
  int get timeInputLimit => WalletConstant.timeInputLimit;

  String _formatPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length <= 3) {
      return '';
    }
    return phoneNumber.replaceRange(
        phoneNumber.length - 3, phoneNumber.length, '***');
  }

  bool _disabled = true;
  String _otp = "";
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);

  _onVerify(BuildContext context) {
    final request = AddBankAccountRequest(
      token: '${_bloc.otp.token}',
      bankHolder: '${_bloc.addBankAccountParams.bankHolderName}',
      bankId: _bloc.addBankAccountParams.bank?.id ?? 1,
      bankNumber: '${_bloc.addBankAccountParams.bankNumber}',
      isDefault: _bloc.addBankAccountParams.isDefault ?? false,
      qrImage: _bloc.addBankAccountParams.qrImage,
      otp: _otp,
    );
    _bloc.add(
      BankAccountEvent.addBankAccount(request: request),
    );
  }

  void _handleResendOTP() {
    _bloc.add(
      const BankAccountEvent.getOtp(isResend: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          state.whenOrNull(
            addBankAccountLoading: showLoading,
            addBankAccountOtpNotMatch: () {
              hideLoading();
              showToastMessage(
                'Mã xác minh không đúng',
                ToastMessageType.error,
              );
              _errorCtr.value = true;
            },
            addBankAccountSuccess: (bankAccount) {
              hideLoading();
              _bloc.add(const BankAccountEvent.getBankAccounts());
              context.bankAccountDetails(
                bankAccount: bankAccount,
                bankAccountBloc: _bloc,
                createdSuccessfully: true,
              );
            },
            resendOtpLoading: () {
              showLoading();
            },
            resendOtpSuccess: () {
              hideLoading();
              restartTimer();
              setState(() {});
            },
            getOtpSuccess: () {
              hideLoading();
            },
          );
        },
        child: SafeArea(
          child: Padding(
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
}
