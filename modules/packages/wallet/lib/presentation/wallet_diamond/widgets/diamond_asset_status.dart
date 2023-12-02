import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/core.dart';
import '../../../data/datasources/models/response/wallet_info_response.dart';
import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import '../../wallet_constant.dart';
import '../wallet_diamond_constant.dart';

class DiamondAssetStatus extends StatelessWidget {
  final WalletInfoResponse vndWalletInfo;

  const DiamondAssetStatus({super.key, required this.vndWalletInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding:
          EdgeInsets.symmetric(vertical: 15, horizontal: context.horizontal),
      child: Stack(
        children: [
          ImageWidget(ImageConstants.walletTotalDiamond),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  vndWalletInfo.userWallet?.availableDiamond
                          ?.toAppCurrencyString(isWithSymbol: false) ??
                      '0',
                  style: context.textTheme.titleLarge!
                      .copyWith(fontSize: 32, color: const Color(0xffd31d7f)),
                ),
              ),
            ),
          ),
        ],
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
