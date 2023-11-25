import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import '../../../../../wallet.dart';
import '../../../../data/datasources/models/request/withdraw_request.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/bloc/wallet_bloc.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../wallet_constant.dart';
import '../../bank_account/bloc/bank_account_bloc.dart';
import '../../widgets/bank_account_detail_widget.dart';

class ConfirmWithdrawTransactionScreen extends StatelessWidget {
  final WithdrawParams withdrawParams;
  static const String routeName = '/confirm-withdraw-transaction';

  const ConfirmWithdrawTransactionScreen(
      {Key? key, required this.withdrawParams})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Xác nhận giao dịch',
        hasBottom: true,
      ),
      body: BlocListener<BankAccountBloc, BankAccountState>(
        bloc: withdrawParams.bankAccountBloc,
        listener: (context, state) {
          state.whenOrNull(
            withdrawLoaded: () {
              context.hideLoading();
              injector<WalletBloc>().add(
                const WalletEvent.getVndWalletInfo(),
              );
              context.showSuccessDialog();
            },
            error: (err) => context.hideLoading(),
            withdrawLoading: () => context.showLoading(),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontal,
            vertical: 20,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tổng tiền rút',
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            withdrawParams.value.toAppCurrencyString(),
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Thuế TNCN (10%)',
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            withdrawParams.taxValue.toAppCurrencyString(),
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Tiền thực rút',
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            (withdrawParams.value - withdrawParams.taxValue)
                                .toAppCurrencyString(),
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'ID P-Done',
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            withdrawParams.pDoneId,
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Rút từ',
                            style: context.text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            withdrawParams.getSourceFromText,
                            style: context.text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.blue10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Divider(color: AppColors.grey73, thickness: 1),
                      const SizedBox(height: 15),
                      Text(
                        'Tài khoản giao dịch',
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      BankAccountDetailWidget(
                        decoration: const BoxDecoration(),
                        trailingIcon: const SizedBox(),
                        bankAccount: withdrawParams.bankAccount,
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: WalletConstant.borderRadius8,
                                side: const BorderSide(
                                  color: AppColors.blue10,
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () {
                              context.popNavigator();
                            },
                            child: Text(
                              'Hủy bỏ'.toUpperCase(),
                              style: context.text.titleLarge?.copyWith(
                                fontSize: 18,
                                color: AppColors.blue10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: GradiantButton(
                          onPressed: () {
                            if (withdrawParams.bankAccount.id != null) {
                              final request = WithdrawRequest(
                                value: withdrawParams.value,
                                bankAccountId: withdrawParams.bankAccount.id!,
                                fromSource:
                                    withdrawParams.sourceFrom.toLowerCase(),
                              );
                              withdrawParams.bankAccountBloc.add(
                                BankAccountEvent.withdraw(request: request),
                              );
                            }
                          },
                          child: Text('xác nhận'.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WithdrawParams {
  final num taxValue;
  final String pDoneId;
  final num value;
  final String sourceFrom;
  final BankAccount bankAccount;
  final BankAccountBloc bankAccountBloc;

  WithdrawParams({
    required this.taxValue,
    required this.bankAccount,
    required this.value,
    required this.pDoneId,
    required this.sourceFrom,
    required this.bankAccountBloc,
  });

  String get getSourceFromText => sourceFrom == 'v_live' ? 'V-Live' : 'V-Shop';
}
