import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../wallet_constant.dart';
import '../wallet_coodinator.dart';
import 'bloc/wallet_diamond_bloc.dart';
import 'wallet_diamond_constant.dart';
import 'wallet_diamond_coodinator.dart';

class WalletDiamondScreen extends StatelessWidget {
  const WalletDiamondScreen({Key? key, this.isPIP = false}) : super(key: key);
  final bool isPIP; //handle close popup register ja in PIP Live

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletDiamondBloc, WalletDiamondState>(
      listener: (context, state) {
        if (state is WalletDiamondNavigateToTransactionHistoryScreen) {
          context.diamondTransactionHistory();
        }
      },
      child: Navigator(
        key: WalletDiamondNestedRoute.navigatorKey,
        initialRoute: WalletDiamondNestedRoute.root,
        //handle close popup register ja in PIP Live
        onGenerateRoute: (settings) =>
            WalletDiamondNestedRoute.generateMainRoute(settings, isPIP: isPIP),
      ),
    );
  }
}

class WalletDiamondDefaultScreen extends StatelessWidget {
  final bool isPIP; //handle close popup register ja in PIP Live

  const WalletDiamondDefaultScreen({Key? key, this.isPIP = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: context.horizontal, vertical: 20),
        children: WalletDiamondActionType.values
            .map(
              (type) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: WalletTheme.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    onPressed: () => onTap(context, type),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.blue10,
                      shape: RoundedRectangleBorder(
                        borderRadius: WalletConstant.borderRadius8,
                      ),
                      side: const BorderSide(color: WalletTheme.transparent),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20,
                      ),
                      title: Text(
                        type.text,
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black10,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: WalletTheme.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void onTap(BuildContext context, WalletDiamondActionType type) {
    switch (type) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        if (context.userType == UserType.isPDone) {
          context.showRegisterJaDialog(
              walletType: WalletType.diamond,
              content: WalletConstant.registerJADialogText,
              isPipLive: isPIP);
        } else {
          WalletDiamondNestedRoute.navigatorKey.currentState?.pushNamed(
            WalletDiamondNestedRoute.chargeDiamondToVnd,
          );
          context.read<WalletDiamondBloc>().add(LoadWalletDiamondInfo());
        }
        break;
      case WalletDiamondActionType.transactionHistory:
        context
            .read<WalletDiamondBloc>()
            .add(NavigateToTransactionHistoryScreen());
        break;
    }
  }
}
