import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import 'resource_widget.dart';

class WalletVNDResourceBuilder extends StatelessWidget {
  const WalletVNDResourceBuilder({super.key});

  @override
  Widget build(BuildContext context) {

    final userWallet = WalletInjectedData.userWallet;

    return Column(
      children: [
        ResourceWidget(title: 'Khả dụng', amount: userWallet.availableVnd.toAppCurrencyString()),
        const Divider(color: WalletTheme.dividerColor, thickness: 1),
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
                    title: 'Chờ xác nhận',
                    amount: userWallet.pendingVnd.toAppCurrencyString(),
                  ),
                ),
              ),
              Expanded(
                child: ResourceWidget(
                  title: 'Chờ rút',
                  amount: userWallet.withdrawingVnd.toAppCurrencyString(),
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
