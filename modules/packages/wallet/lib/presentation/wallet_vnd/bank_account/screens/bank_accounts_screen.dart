import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import '../../../../core/configuratons/configurations.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/bank_accounts_widget.dart';
import '../../../shared/widgets/tab_bar_widget.dart';
import '../../../shared/widgets/user_info_card.dart';
import '../../../wallet_constant.dart';
import '../../../wallet_diamond/bloc/wallet_diamond_bloc.dart';
import '../../../wallet_diamond/wallet_diamond_screen.dart';
import '../../widgets/vnd_asset_status.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountsScreen extends StatefulWidget {
  static const String routeName = '/my-bank-accounts';

  const BankAccountsScreen({Key? key}) : super(key: key);

  @override
  State<BankAccountsScreen> createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  late final bloc = context.read<BankAccountBloc>();
  final walletType = WalletType.coinVnd;

  @override
  void initState() {
    bloc.add(const BankAccountEvent.getBankAccounts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(context, title: 'Tài khoản ngân hàng'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.horizontal,
              10,
              context.horizontal,
              24,
            ),
            child: UserInfoCard(
              user: WalletInjectedData.user,
              walletInfo: WalletInjectedData.coinWalletInfo,
            ),
          ),
          const Divider(thickness: 8, color: WalletTheme.lightGrey),
          TabBarViewWidget(
            walletDOneComponent: const SizedBox(),
            walletCoinComponent: const SizedBox(),
            walletDiamondComponent: BlocProvider(
              create: (context) => WalletDiamondBloc(injector()),
              child: const WalletDiamondScreen(),
            ),
            walletVndComponent: Column(
              children: [
                VNDAssetStatus(vndWalletInfo: WalletInjectedData.vndWalletInfo),
                const Expanded(child: BankAccountWidget()),
              ],
            ),
            initialIndex: walletType.initialIndexTabBar,
          )
        ],
      ),
    );
  }
}
