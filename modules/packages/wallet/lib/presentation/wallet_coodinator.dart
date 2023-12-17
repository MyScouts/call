import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet/data/data.dart';
import 'package:wallet/presentation/wallet_point/point_agency/screen/point_agency_screen.dart';
import 'package:wallet/presentation/wallet_vnd/dialog/waiting_dialog.dart';
import 'package:wallet/presentation/wallet_vnd/withdraw/screens/verify_otp_withdraw_screen.dart';
import 'package:wallet/presentation/transaction_history_detail_screen.dart';
import 'package:wallet/presentation/wallet_vnd/dialog/notification_dialog.dart';
import 'package:wallet/presentation/wallet_vnd/withdraw/screens/withdraw_screen.dart';

import '../core/configuratons/configurations.dart';
import '../core/utils/extension.dart';
import '../domain/domain.dart' hide User;
import 'shared/model/bank_account_and_bloc_params.dart';
import 'wallet_constant.dart';
import 'wallet_diamond/bloc/wallet_diamond_bloc.dart';
import 'wallet_screen.dart';
import 'wallet_transaction_history_screen.dart';
import 'wallet_vnd/bank_account/bloc/bank_account_bloc.dart';
import 'wallet_vnd/bank_account/screens/add_bank_account_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_account_details_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_account_veryfy_otp_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_accounts_screen.dart';
import 'wallet_vnd/bank_account/screens/confirm_information_screen.dart';
import 'wallet_vnd/dialog/delete_bank_account_dialog.dart';
import 'wallet_vnd/dialog/succes_dialog.dart';
import 'wallet_vnd/dialog/warning_dialog.dart';
import 'wallet_vnd/withdraw/screens/confirm_withdraw_transaction_screen.dart';

extension WalletCoordinator on BuildContext {
  Future<T?> startMyWallet<T>(User? user) {
    if (user != null) {
      WalletInjectedData.setUser = user;
    }

    return Navigator.of(this).pushNamed(WalletScreen.routeName);
  }

  Future<T?> pointAllAgencyExternal<T>() =>
      Navigator.of(this).pushNamed(PointAgencyScreen.routeName);

  Future<T?> bankAccounts<T>() {
    return Navigator.of(this).pushNamed(BankAccountsScreen.routeName);
  }

  void backToBankAccounts<T>() {
    return popUntilNavigator(ModalRoute.withName(BankAccountsScreen.routeName));
  }

  void backToMyWallet<T>() {
    return popUntilNavigator(ModalRoute.withName(WalletScreen.routeName));
  }

  Future<T?> addBankAccount<T>({required BankAccountBloc bankAccountBloc}) {
    return Navigator.of(this).pushNamed(
      AddBankAccountScreen.routeName,
      arguments: bankAccountBloc,
    );
  }

  Future<T?> verifyOtpBankAccount<T>(
      {required BankAccountBloc bankAccountBloc}) {
    return Navigator.of(this).pushNamed(
      VerifyBankAccountOTPScreen.routeName,
      arguments: bankAccountBloc,
    );
  }

  Future<T?> navigateCharDiamondToVND<T>() {
    return Navigator.of(this).pushNamed(
      WalletDiamondNestedRoute.chargeDiamondToVnd,
    );
  }

  Future<T?> bankAccountDetails<T>({
    required BankAccount bankAccount,
    required BankAccountBloc bankAccountBloc,
    bool createdSuccessfully = false,
  }) {
    final args = BankAccountParams(
      bankAccount: bankAccount,
      bankAccountBloc: bankAccountBloc,
    );
    if (createdSuccessfully) {
      return Navigator.of(this).pushReplacementNamed(
        BankAccountDetailsScreen.routeName,
        arguments: args,
      );
    }
    return Navigator.of(this).pushNamed(
      BankAccountDetailsScreen.routeName,
      arguments: args,
    );
  }

  Future<T?> confirmWithdrawTransaction<T>(
      {required WithdrawParams withdrawParams}) {
    return Navigator.of(this).pushNamed(
      ConfirmWithdrawTransactionScreen.routeName,
      arguments: withdrawParams,
    );
  }

  Future<void> showWarningDialog() async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => const WarningDialog(),
    );
  }

  Future<void> showSuccessDialog() async {
    await showDialog(
        context: this,
        barrierDismissible: false,
        builder: (_) => const SuccessDialog());
  }

  Future<void> showDeleteBankAccount(
      {required BankAccountBloc bloc, required int id}) async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: DeleteBankAccountDialog(bankAccountId: id),
      ),
    );
  }

  Future<T?> startTransactionHistory<T>({required WalletType walletType}) {
    return Navigator.of(this).pushNamed(
      WalletTransactionHistoryScreen.routeName,
      arguments: walletType,
    );
  }

  Future<T?> startTransactionHistoryDetails<T>(
      TransactionHistoryDetailParams params) {
    return Navigator.of(this).pushNamed(
      TransactionHistoryDetailScreen.routeName,
      arguments: params,
    );
  }

  Future<T?> startConfirmBankAccountInformation<T>({
    required AddBankAccountParams params,
    required BankAccountBloc bloc,
  }) {
    return Navigator.of(this).pushNamed(
      ConfirmInformationScreen.routeName,
      arguments: {'params': params, 'bloc': bloc},
    );
  }

  Future<T?> startWithdraw<T>() {
    return Navigator.of(this).pushNamed(WithdrawScreen.routeName);
  }

  Future<T?> startVerifyOTPScreen<T>(WithdrawRequest request) {
    return Navigator.of(this).pushNamed(
      VerifyOTPWithdrawScreen.routeName,
      arguments: request,
    );
  }

  Future<void> showNotificationDialog({
    String? actionTitle,
    VoidCallback? onAction,
    required String content,
  }) async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => NotificationDialog(
        content: content,
        actionTitle: actionTitle,
        onAction: onAction,
      ),
    );
  }

  Future<void> showWaitingDialog({
    required VoidCallback onAction,
  }) async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => WaitingDialog(onAction: onAction),
    );
  }

  void backToWithdraw<T>() {
    return popUntilNavigator(ModalRoute.withName(WithdrawScreen.routeName));
  }
}
