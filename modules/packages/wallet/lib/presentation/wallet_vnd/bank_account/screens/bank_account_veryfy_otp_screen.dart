import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
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
  bool _isActive = false;
  late final _paddingBottom = MediaQuery.of(context).padding.bottom;
  final _otpCodeController = TextEditingController();
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
    _otpCodeController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Nhập mã xác minh',
        hasBottom: true,
      ),
      body: BlocListener<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          state.whenOrNull(
            addBankAccountLoading: showLoading,
            addBankAccountOtpNotMatch: () {
              hideLoading();
              return context.showWarningDialog();
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
              _otpCodeController.clear();
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
            padding: EdgeInsets.fromLTRB(
              context.horizontal,
              25,
              context.horizontal,
              _paddingBottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Mã xác thực đã gửi qua',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                    children: [
                      TextSpan(
                        text: ' Tin nhắn ',
                        style: context.text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      const TextSpan(text: 'đến số điện thoại của bạn'),
                      TextSpan(
                        text: 'Nhập mã OTP\n',
                        style: context.text.titleLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: WalletTheme.grey75,
                        ),
                      ),
                    ],
                  ),
                ),
                OtpBoxWidget(
                  activeColor: AppColors.blue10,
                  inActiveColor: WalletTheme.greyBorder,
                  selectedColor: AppColors.blue10,
                  textColor: WalletTheme.greyTextColor,
                  controller: _otpCodeController,
                  onOtpChanged: (value) {
                    if (value.length == WalletConstant.otpLength &&
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GradiantButton(
                    onPressed: _isActive
                        ? () {
                            final request = AddBankAccountRequest(
                              token: '${_bloc.otp.token}',
                              bankHolder:
                                  '${_bloc.addBankAccountParams.bankHolderName}',
                              bankId: _bloc.addBankAccountParams.bank?.id ?? 1,
                              bankNumber:
                                  '${_bloc.addBankAccountParams.bankNumber}',
                              isDefault:
                                  _bloc.addBankAccountParams.isDefault ?? false,
                              qrImage: _bloc.addBankAccountParams.qrImage,
                              otp: _otpCodeController.text,
                            );
                            _bloc.add(
                              BankAccountEvent.addBankAccount(request: request),
                            );
                          }
                        : null,
                    child: Text('Tiếp theo'.toUpperCase()),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ValueListenableBuilder<int>(
                    valueListenable: timeCtr,
                    builder: (context, value, child) {
                      final timerString =
                          value > 0 ? ' (${value.toString()}s)' : '';
                      if (timeCtr.value > 0) {
                        return RichText(
                          text: TextSpan(
                            text: 'Vui lòng chờ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.greyLightTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                            children: [
                              TextSpan(
                                text: timerString,
                                style: context.text.titleMedium?.copyWith(
                                  color: WalletTheme.greyTextColor,
                                  fontSize: 14,
                                ),
                              ),
                              const TextSpan(
                                text: ' để nhận lại mã xác nhận',
                              )
                            ],
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          _bloc.add(
                            const BankAccountEvent.getOtp(isResend: true),
                          );
                        },
                        child: Text(
                          'Gửi lại mã',
                          style: context.text.titleMedium?.copyWith(
                            color: WalletTheme.greyTextColor,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
