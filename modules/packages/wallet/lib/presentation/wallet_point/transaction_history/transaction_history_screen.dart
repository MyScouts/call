import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'bloc/transaction_history_bloc.dart';
import 'dialogs/dialogs.dart';
import 'widgets/widgets.dart';

class PointTransactionHistoryScreen extends StatefulWidget {
  static const routeName = '/point-transaction-history';

  const PointTransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PointTransactionHistoryScreen> createState() =>
      _PointTransactionHistoryScreenState();
}

class _PointTransactionHistoryScreenState
    extends State<PointTransactionHistoryScreen> {
  Future<void> handleShowFilter() async {
    final bloc = context.read<PointTransactionHistoryBloc>();

    final defaultFilter = bloc.dataState.filter;

    final data = await showDialog<PointTransactionHistoryFilter>(
      context: context,
      builder: (context) => TransactionFilterDialog(
        defaultFilter: defaultFilter,
      ),
    );

    if (data != null) {
      bloc.add(GetTransactionHistoryEvent(filter: data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Lich su giao dich',
        actions: [
          IconButton(
            onPressed: handleShowFilter,
            icon: ImageWidget(IconAppConstants.camera2),
          ),
        ],
      ),
      body: const TransactionHistoryDataList(),
    );
  }
}
