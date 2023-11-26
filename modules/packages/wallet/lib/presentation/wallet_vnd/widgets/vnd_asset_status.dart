import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../wallet.dart';

import '../../../core/theme/wallet_theme.dart';
import '../../../domain/entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../../shared/widgets/user_icon_asset.dart';
import '../../wallet_constant.dart';

class VNDAssetStatus extends StatelessWidget {
  final VndWalletInfo vndWalletInfo;

  const VNDAssetStatus({Key? key, required this.vndWalletInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vndWalletStatusTextStyle = context.vndWalletStatusTextStyle;
    final vndWalletStatusWidth = context.vndWalletStatusWidth;
    if (vndWalletInfo.withdraw == null) {
      return const SizedBox();
    }
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
          children: WalletVNDStatus.values
              .map(
                (status) => SizedBox(
                  width: vndWalletStatusWidth,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${status.text}\n\n',
                          style: vndWalletStatusTextStyle,
                        ),
                        WidgetSpan(
                          child: UserIconAsset(
                            amount: amount(status, vndWalletInfo),
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

  String amount(WalletVNDStatus status, VndWalletInfo vndWalletInfo) {
    switch (status) {
      case WalletVNDStatus.waiting:
        return vndWalletInfo.waiting.toAppCurrencyString(isWithSymbol: false);
      case WalletVNDStatus.available:
        return vndWalletInfo.available.toAppCurrencyString(isWithSymbol: false);
      case WalletVNDStatus.withdraw:
        return vndWalletInfo.withdraw.toAppCurrencyString(isWithSymbol: false);
    }
  }
}
