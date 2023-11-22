import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../wallet_vnd_coodinator.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem(this.transactionHistory, {super.key});

  final TransactionHistory transactionHistory;

  Future<void> handleOnTap(BuildContext context) {
    return context.vndTransactionHistoryDetail(transactionHistory.id);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = transactionHistory.status
        .getBackgroundColor(transactionHistory.transactionType);
    return ListTile(
      onTap: () => handleOnTap(context),
      dense: true,
      tileColor: backgroundColor,
      title: Text(
        transactionHistory.content,
        style: context.text.titleMedium?.copyWith(
          color: WalletTheme.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        transactionHistory.createdAt?.toddMMHHmm() ?? '',
        style: context.text.displayMedium?.copyWith(
          color: WalletTheme.greyTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              final colorStatus = transactionHistory.status
                  .getColorStatus(transactionHistory.transactionType);
              return Text(
                colorStatus.parse(transactionHistory.value, isWithSymbol: true),
                style: context.text.titleMedium?.copyWith(
                  color: transactionHistory.status.numberColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          const SizedBox(height: 5),
          Text(
            transactionHistory.status
                .getTitleFromType(transactionHistory.transactionType),
            style: context.text.displayMedium?.copyWith(
              color: transactionHistory.status.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
