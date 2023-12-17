import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/data/datasources/models/response/estimate_tax_response.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import '../../../../data/datasources/models/request/withdraw_request.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/bloc/wallet_bloc.dart';
import '../../bank_account/bloc/bank_account_bloc.dart';

class ConfirmWithdrawTransactionScreen extends StatefulWidget {
  final WithdrawParams withdrawParams;
  static const String routeName = '/confirm-withdraw-transaction';

  const ConfirmWithdrawTransactionScreen(
      {super.key, required this.withdrawParams});

  @override
  State<ConfirmWithdrawTransactionScreen> createState() =>
      _ConfirmWithdrawTransactionScreenState();
}

class _ConfirmWithdrawTransactionScreenState
    extends State<ConfirmWithdrawTransactionScreen> {
  late final _bloc = context.read<BankAccountBloc>();

  @override
  void initState() {
    _bloc.add(BankAccountEvent.estimateTax(value: widget.withdrawParams.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Xác nhận giao dịch',
      ),
      body: BlocConsumer<BankAccountBloc, BankAccountState>(
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
        buildWhen: (previous, current) =>
            current.whenOrNull(
              estimateTaxSuccess: (_) => true,
              error: (mess) => true,
            ) ??
            false,
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const LoadingWidget(),
              estimateTaxSuccess: (estimateTax) {
                return SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            _buildInfo(context, estimateTax: estimateTax),
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
                );
              });
        },
      ),
    );
  }

  _buildButtons(BuildContext context) {
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
                  final request = WithdrawRequest(
                    value: widget.withdrawParams.value,
                    bankAccountId: widget.withdrawParams.bankAccount.id!,
                    otp: '',
                  );
                  context.startVerifyOTPScreen(request);
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

  _buildInfo(BuildContext context, {required EstimateTaxResponse estimateTax}) {
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
          const SizedBox(height: 15),
          _buildInfoWidget(
            context,
            title: 'Tổng tiền rút',
            content: widget.withdrawParams.value.toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'Thuế TNCN (10%)',
            content: estimateTax.taxFeeVnd.toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'Tiền thực rút',
            content: estimateTax.withdrawingVnd.toAppCurrencyString(),
          ),
          _buildInfoWidget(
            context,
            title: 'ID P-DONE',
            content: widget.withdrawParams.pDoneId,
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
          const SizedBox(height: 15),
          _buildInfoWidget(
            context,
            title: 'Tên ngân hàng',
            content: '${widget.withdrawParams.bankAccount.bank?.shortName}',
          ),
          _buildInfoWidget(
            context,
            title: 'Số thẻ/ Số tài khoản',
            content: '${widget.withdrawParams.bankAccount.bankNumber}',
          ),
          _buildInfoWidget(
            context,
            title: 'Tên chủ tài khoản',
            content: '${widget.withdrawParams.bankAccount.bankHolder}',
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
  final String pDoneId;
  final num value;
  final BankAccount bankAccount;

  WithdrawParams({
    required this.bankAccount,
    required this.value,
    required this.pDoneId,
  });
}
