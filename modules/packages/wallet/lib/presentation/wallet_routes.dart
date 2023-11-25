import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:wallet/presentation/wallet_transaction_history_screen.dart';
import 'package:wallet/presentation/wallet_diamond/screens/charge_diamond_to_vnd_screen.dart';

import '../../wallet.dart';
import '../domain/specs/enums/transaction_history.dart';
import 'shared/bloc/wallet_bloc.dart';

import 'shared/model/bank_account_and_bloc_params.dart';
import 'wallet_diamond/bloc/wallet_diamond_bloc.dart';
import 'wallet_diamond/wallet_diamond_routes.dart';
import 'wallet_point/wallet_point_routes.dart';
import 'wallet_screen.dart';
import 'wallet_vnd/bank_account/bloc/bank_account_bloc.dart';
import 'wallet_vnd/bank_account/screens/add_bank_account_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_account_details_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_account_veryfy_otp_screen.dart';
import 'wallet_vnd/bank_account/screens/bank_accounts_screen.dart';
import 'wallet_vnd/transaction_history/transaction_history.dart';
import 'wallet_vnd/transaction_history_detail/transaction_history_detail.dart';
import 'wallet_vnd/wallet_vnd_routes.dart';
import 'wallet_vnd/withdraw/screens/confirm_withdraw_transaction_screen.dart';
import 'wallet_vnd/withdraw/screens/create_withdraw_order_screen.dart';

@injectable
class WalletRoutes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        get<AppWalletRoutes>(),
        get<WalletVndRoutes>(),
        get<WalletPointRoutes>(),
        get<WalletDiamondRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [];
}

@injectable
class AppWalletRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        WalletScreen.routeName: (context) {
          return BlocProvider.value(
            value: injector<WalletBloc>(),
            child: const WalletScreen(),
          );
        },
        BankAccountsScreen.routeName: (context) {
          return BlocProvider(
            create: (context) => BankAccountBloc(injector()),
            child: const BankAccountsScreen(),
          );
        },
        AddBankAccountScreen.routeName: (context) {
          final bankAccountBloc = settings.arguments as BankAccountBloc;
          return BlocProvider.value(
            value: bankAccountBloc,
            child: const AddBankAccountScreen(),
          );
        },
        VerifyBankAccountOTPScreen.routeName: (context) {
          final bankAccountBloc = settings.arguments as BankAccountBloc;
          return BlocProvider.value(
            value: bankAccountBloc,
            child: const VerifyBankAccountOTPScreen(),
          );
        },
        BankAccountDetailsScreen.routeName: (context) {
          final args = settings.arguments as BankAccountParams;
          return BlocProvider.value(
            value: args.bankAccountBloc,
            child: BankAccountDetailsScreen(bankAccount: args.bankAccount),
          );
        },
        CreateWithdrawOrderScreen.routeName: (context) {
          final args = settings.arguments as BankAccountParams;
          return BlocProvider.value(
            value: args.bankAccountBloc,
            child: CreateWithdrawOrderScreen(bankAccount: args.bankAccount),
          );
        },
        TransactionHistoryScreen.routeName: (context) {
          final vendor = settings.arguments as TransactionHistoryVendor;
          return BlocProvider(
            create: (context) => TransactionHistoryBloc(vendor, injector())
              ..add(GetTransactionHistoryEvent()),
            child: TransactionHistoryScreen(vendor: vendor),
          );
        },
        TransactionHistoryDetailScreen.routeName: (context) {
          final id = settings.arguments as int;
          return TransactionHistoryDetailScreen(id: id);
        },
        ConfirmWithdrawTransactionScreen.routeName: (context) {
          final args = settings.arguments as WithdrawParams;
          return ConfirmWithdrawTransactionScreen(withdrawParams: args);
        },
// <<<<<<< HEAD
//         WalletTransactionHistoryScreen.routeName: (context) {
//           return const WalletTransactionHistoryScreen();
// =======
        WalletDiamondNestedRoute.chargeDiamondToVnd: (context) {
          return BlocProvider.value(
            value: injector<WalletDiamondBloc>()..add(LoadWalletDiamondInfo()),
            child: const ChargeDiamondToVndScreen(),
          );
// >>>>>>> phuc/wallet_2511
        },
      };
}
