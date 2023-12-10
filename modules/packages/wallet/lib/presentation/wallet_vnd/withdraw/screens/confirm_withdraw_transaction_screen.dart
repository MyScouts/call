import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import '../../../../data/datasources/models/request/withdraw_request.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/bloc/wallet_bloc.dart';
import '../../bank_account/bloc/bank_account_bloc.dart';

class ConfirmWithdrawTransactionScreen extends StatelessWidget {
  final WithdrawParams withdrawParams;
  static const String routeName = '/confirm-withdraw-transaction';

  const ConfirmWithdrawTransactionScreen(
      {super.key, required this.withdrawParams});

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Xác nhận giao dịch',
      ),
      body: BlocListener<BankAccountBloc, BankAccountState>(
        bloc: withdrawParams.bankAccountBloc,
        listener: (context, state) {
          state.whenOrNull(
            withdrawLoaded: () {
              context.hideLoading();
              injector<WalletBloc>().add(
                const WalletEvent.getWalletInfo(),
              );
              context.showSuccessDialog();
            },
            error: (err) => context.hideLoading(),
            withdrawLoading: () => context.showLoading(),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: paddingBottom),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    _buildInfo(context),
                    const SizedBox(height: 15),
                    const Divider(
                      color: WalletTheme.dividerColor,
                      thickness: 8,
                    ),
                    const SizedBox(height: 15),
                    _buildBankAccountInfo(context),
                  ],
                ),
              ),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtons(BuildContext context){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.horizontal),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: context.popNavigator,
                  child: Text(
                    'Huỷ',
                    style: context.text.bodyLarge?.copyWith(
                      color: const Color(0xFF6E6E6E),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: PrimaryButton(
                onTap: () {
                  if (withdrawParams.bankAccount.id != null) {
                    final request = WithdrawRequest(
                      value: withdrawParams.value,
                      bankAccountId: withdrawParams.bankAccount.id!,
                    );
                    withdrawParams.bankAccountBloc.add(
                      BankAccountEvent.withdraw(request: request),
                    );
                  }
                },
                title: 'Xác nhận',
                disabled: false,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THÔNG TIN',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF667385),
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoWidget(
            context,
            title: 'Tổng tiền rút',
            content: withdrawParams.value.toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'Thuế TNCN (10%)',
            content: withdrawParams.taxValue.toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'Tiền thực rút',
            content: (withdrawParams.value - withdrawParams.taxValue)
                .toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'ID P-DONE',
            content: withdrawParams.pDoneId,
          ),
        ],
      ),
    );
  }

  _buildBankAccountInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TÀI KHOẢN GIAO DỊCH',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF667385),
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoWidget(
            context,
            title: 'Tên ngân hàng',
            content: '${withdrawParams.bankAccount.bank?.shortName}',
          ),
          _buildInfoWidget(
            context,
            title: 'Số thẻ/ Số tài khoản',
            content: '${withdrawParams.bankAccount.bankNumber}',
          ),
          _buildInfoWidget(
            context,
            title: 'Tên chủ tài khoản',
            content: '${withdrawParams.bankAccount.bankHolder}',
          ),
        ],
      ),
    );
  }

  _buildInfoWidget(BuildContext context,
      {required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF101B28),
              height: 20 / 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            content,
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF00452E),
              height: 20 / 14,
            ),
          ),
        ],
      ),
    );
  }
}

class WithdrawParams {
  final num taxValue;
  final String pDoneId;
  final num value;
  final BankAccount bankAccount;
  final BankAccountBloc bankAccountBloc;

  WithdrawParams({
    required this.taxValue,
    required this.bankAccount,
    required this.value,
    required this.pDoneId,
    required this.bankAccountBloc,
  });
}
