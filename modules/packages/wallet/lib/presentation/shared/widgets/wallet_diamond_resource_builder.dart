import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import '../../../data/datasources/models/response/wallet_info_response.dart';
import 'resource_widget.dart';

class WalletDiamondResourceBuilder extends StatelessWidget {
  const WalletDiamondResourceBuilder({super.key, required this.userWallet});
  final UserWallet userWallet;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: WalletTheme.dividerColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ResourceWidget(
                    title: 'Khả dụng',
                    amount: userWallet.availableDiamond.toAppCurrencyString(isWithSymbol: false),
                  ),
                ),
              ),
              Expanded(
                child: ResourceWidget(
                  title: 'Chờ xác nhận',
                  amount: userWallet.pendingDiamond.toAppCurrencyString(isWithSymbol: false),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: WalletTheme.dividerColor, thickness: 6),
      ],
    );
  }
}
