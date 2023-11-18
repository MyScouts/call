import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../wallet_point_coodinator.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem(this.transactionHistory, {super.key});

  final PointTransactionHistory transactionHistory;

  Future<void> handleOnTap(BuildContext context) =>
      context.pointTransactionHistoryDetail(transactionHistory.id);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => handleOnTap(context),
        dense: true,
        title: Text(
          transactionHistory.content,
          style: context.text.titleMedium?.copyWith(
            color: WalletTheme.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          (transactionHistory.createdAt ?? DateTime.now())
              .toAppDateTimeFormat(),
          style: context.text.displayMedium?.copyWith(
            color: WalletTheme.greyTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                final colorStatus =
                    transactionHistory.transactionType.toColorStatus();

                return Text(
                  colorStatus.parse(transactionHistory.value),
                  style: context.text.titleMedium?.copyWith(
                    color: colorStatus.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            const SizedBox(width: 5),
            ImageWidget(IconAppConstants.icArrowLeft, width: 20),
          ],
        ),
      );
}
