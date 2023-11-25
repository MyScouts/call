import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import 'resource_widget.dart';

class WalletDiamondResourceBuilder extends StatelessWidget {
  const WalletDiamondResourceBuilder({super.key});

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
                  child: const ResourceWidget(
                    title: 'Khả dụng',
                    amount: '854.281.212',
                  ),
                ),
              ),
              const Expanded(
                child: ResourceWidget(
                  title: 'Chờ xác nhận',
                  amount: '854.281.212',
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
