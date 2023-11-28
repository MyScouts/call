import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../../core/theme/wallet_theme.dart';
import '../../../domain/entities/bank/bank.dart';

class BankWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Bank? bank;

  const BankWidget({super.key, this.bank, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: WalletTheme.borderColor),
        borderRadius: WalletConstant.borderRadius12,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ImageWidget(bank?.logo ?? '', fit: BoxFit.fitWidth),
          ),
          Expanded(
            child: Text(
              '${bank?.shortName}',
              textAlign: TextAlign.center,
              style: context.text.titleMedium?.copyWith(
                color: const Color(0xFF101B28),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 16 / 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
