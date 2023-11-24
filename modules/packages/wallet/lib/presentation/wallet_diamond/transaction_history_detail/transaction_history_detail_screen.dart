import 'package:flutter/material.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'widgets/widgets.dart';

class DiamondTransactionHistoryDetailScreen extends StatelessWidget {
  static const routeName = '/diamond-transaction-history-detail';

  final int id;

  const DiamondTransactionHistoryDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  Future<DiamondTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    final data =
        await injector<WalletDiamondUseCase>().getTransactionHistoryDetail(id);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Chi tiết giao dịch',
      ),
      body: FutureBuilder(
        future: getTransactionHistoryDetail(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return DiamondTransactionHistoryDetailWidget(data: data);
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
