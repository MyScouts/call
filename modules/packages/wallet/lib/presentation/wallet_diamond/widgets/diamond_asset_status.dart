import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import '../../wallet_constant.dart';
import '../wallet_diamond_constant.dart';

class DiamondAssetStatus extends StatelessWidget {
  final DiamondWalletInfo vndWalletInfo;

  const DiamondAssetStatus({Key? key, required this.vndWalletInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: WalletTheme.lightGrey),
      padding:
          EdgeInsets.symmetric(vertical: 15, horizontal: context.horizontal),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: WalletDiamondStatus.values
              .map(
                (status) => SizedBox(
                  width: context.vndWalletStatusWidth,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${status.text}\n\n',
                          style: context.vndWalletStatusTextStyle,
                        ),
                        WidgetSpan(
                          child: UserIconAsset(
                            amount: amount(status, vndWalletInfo),
                            iconPath: IconAppConstants.icArrowLeft,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  String amount(WalletDiamondStatus status, DiamondWalletInfo walletInfo) {
    switch (status) {
      case WalletDiamondStatus.pending:
        return walletInfo.waiting.toAppCurrencyString(isWithSymbol: false);
      case WalletDiamondStatus.available:
        return walletInfo.available.toAppCurrencyString(isWithSymbol: false);
    }
  }
}
