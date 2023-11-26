import 'package:flutter/material.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'widgets/widgets.dart';

class TransactionHistoryDetailScreen extends StatelessWidget {
  static const routeName = '/transaction-history-detail';

  final int id;

  const TransactionHistoryDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  Future<TransactionHistoryDetail> getTransactionHistoryDetail(int id) async {
    final data =
        await injector<WalletVndUseCase>().getTransactionHistoryDetail(id);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Chi tiet giao dich',
      ),
      body: FutureBuilder(
        future: getTransactionHistoryDetail(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return Builder(
              builder: (context) {
                switch (data.transactionType) {
                  case TransactionHistoryType.discountFromLivestream:
                  case TransactionHistoryType.discountFromOrder:
                  case TransactionHistoryType.discountFromBuyAccount:
                    return TransactionHistoryDetailDiscountWidget(
                      data: data,
                    );
                  case TransactionHistoryType.commissionFromLivestream:
                  case TransactionHistoryType.commissionFromOrder:
                  case TransactionHistoryType.commissionFromBuyAccount:
                    return TransactionHistoryDetailCommissionWidget(
                      data: data,
                    );

                  case TransactionHistoryType.withdraw:
                    return TransactionHistoryDetailWithdrawWidget(
                      data: data,
                    );
                }
              },
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
