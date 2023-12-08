import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/transaction_history_detail_screen.dart';

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
import 'wallet_vnd/dialog/choose_bank_account_dialog.dart';
import 'wallet_vnd/dialog/delete_bank_account_dialog.dart';
import 'wallet_vnd/dialog/succes_dialog.dart';
import 'wallet_vnd/dialog/warning_dialog.dart';
import 'wallet_vnd/withdraw/screens/confirm_withdraw_transaction_screen.dart';
import 'wallet_vnd/withdraw/screens/create_withdraw_order_screen.dart';

extension WalletCoordinator on BuildContext {
  Future<T?> startMyWallet<T>(User? user) {
    if (user != null) {
      WalletInjectedData.setUser = user;
    }

    return Navigator.of(this).pushNamed(WalletScreen.routeName);
  }

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

  Future<T?> createWithdrawOrder<T>(
      {required BankAccountParams bankAccountParams}) {
    return Navigator.of(this).pushNamed<T>(
      CreateWithdrawOrderScreen.routeName,
      arguments: bankAccountParams,
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

  Future<void> showChooseBankAccountDialog(
      {required BankAccountBloc bankAccountBloc}) async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: bankAccountBloc,
        child: const ChooseBankAccountDialog(),
      ),
    );
  }

  // Future<void> showRegisterJaDialog(
  //     {required WalletType walletType,
  //     bool isPipLive = false,
  //     String? content}) async {
  //   await showDialog(
  //     context: this,
  //     barrierDismissible: false,
  //     builder: (_) => RegisterJADialog(
  //       walletType: walletType,
  //       isPipLive: isPipLive,
  //       content: content,
  //     ),
  //   );
  // }

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
}
