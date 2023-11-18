import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../wallet_constant.dart';
import 'wallet_point_constant.dart';
import 'wallet_point_coodinator.dart';

class WalletPointScreen extends StatelessWidget {
  const WalletPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAgency = WalletInjectedData.user.roleMemberCode == 'AGENCY' ||
        WalletInjectedData.user.roleMemberCode == 'GENERAL_AGENCY';
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: context.horizontal, vertical: 20),
      children: (isAgency
              ? [WalletPointActionType.pointAgency]
              : WalletPointActionType.values)
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
                  onPressed: () => onTapAction(context, type),
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
    );
  }

  void onTapAction(BuildContext context, WalletPointActionType type) {
    switch (type) {
      case WalletPointActionType.pointAgency:
        context.pointAllAgency();
        break;
      case WalletPointActionType.transactionHistory:
        context.pointTransactionHistory();
        break;
    }
  }
}
