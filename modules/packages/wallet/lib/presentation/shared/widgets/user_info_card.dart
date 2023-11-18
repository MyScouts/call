import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart' hide User;
import '../../wallet_constant.dart';
import 'user_asset.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  final CoinWalletInfo walletInfo;

  const UserInfoCard({
    super.key,
    required this.user,
    required this.walletInfo,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: WalletConstant.borderRadius10,
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [WalletTheme.purple30, AppColors.blue10],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 10),
              color: Colors.transparent,
              child: Row(
                children: [
                  AvatarWidget(
                    avatar: user.avatar,
                    size: 50,
                    isPDone: user.isPDone == true,
                    borderSize: 1.45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.displayName}',
                          style: context.text.titleLarge?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            (user.pDoneId?.isNotEmpty ?? false)
                                ? 'ID: ${user.pDoneId!}'
                                : '',
                            style: context.text.labelSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Divider(color: AppColors.white, thickness: 0.5),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAsset(
                    type: WalletType.coin,
                    amount: walletInfo.totalCoin
                        .toAppCurrencyString(isWithSymbol: false),
                  ),
                  UserAsset(
                    type: WalletType.diamond,
                    amount: walletInfo.totalDiamond
                        .toAppCurrencyString(isWithSymbol: false),
                  ),
                  UserAsset(
                    type: WalletType.coinVnd,
                    amount: walletInfo.totalVnd
                        .toAppCurrencyString(isWithSymbol: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
