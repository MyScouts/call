import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../../data/datasources/models/response/transactions_response.dart';

class WalletTransactionItemWidget extends StatelessWidget {
  final TransactionItem transactionItem;
  final WalletType walletType;
  final VoidCallback? onTap;

  const WalletTransactionItemWidget({
    super.key,
    required this.transactionItem,
    required this.walletType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: WalletConstant.borderRadius12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TransactionType.values
                        .firstWhere(
                          (type) =>
                              type.value == transactionItem.transactionType,
                        )
                        .title(
                          context,
                          receiverPDoneId: transactionItem.receiver?.pDoneId,
                        ),
                    style: context.text.titleMedium?.copyWith(
                      color: const Color(0xFF212121),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 20 / 14,
                    ),
                  ),
                  Text(
                    '${transactionItem.createdAt?.datePreOrder}',
                    style: context.text.titleMedium?.copyWith(
                      color: const Color(0xFF667385),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 16 / 12,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${TransactionType.values.firstWhere(
                            (type) =>
                                type.value == transactionItem.transactionType,
                          ).operator(context, receiverPDoneId: transactionItem.receiver?.pDoneId, walletType: walletType)} ${transactionItem.toValue.toAppCurrencyString(
                        isWithSymbol: false,
                      )}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 24 / 16,
                            color: const Color(0xFF4B84F7),
                          ),
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: walletType.iconTransaction(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    TransactionResolvedStatus.values
                        .firstWhere((status) =>
                            status.name == transactionItem.resolvedStatus)
                        .text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 20 / 14,
                          color: TransactionResolvedStatus.values
                              .firstWhere((status) =>
                                  status.name == transactionItem.resolvedStatus)
                              .color,
                        ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
