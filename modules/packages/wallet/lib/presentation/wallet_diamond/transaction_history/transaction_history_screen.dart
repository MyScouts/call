import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'bloc/transaction_history_bloc.dart';
import 'dialogs/dialogs.dart';
import 'widgets/widgets.dart';

class DiamondTransactionHistoryScreen extends StatefulWidget {
  static const routeName = '/diamond-transaction-history';

  const DiamondTransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<DiamondTransactionHistoryScreen> createState() =>
      _DiamondTransactionHistoryScreenState();
}

class _DiamondTransactionHistoryScreenState
    extends State<DiamondTransactionHistoryScreen> {
  Future<void> handleShowFilter() async {
    final bloc = context.read<DiamondTransactionHistoryBloc>();

    final defaultFilter = bloc.dataState.filter;

    final data = await showDialog<DiamondTransactionHistoryFilter>(
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
        title: 'Lịch sử giao dịch',
        actions: [
          IconButton(
            onPressed: handleShowFilter,
            icon: ImageWidget(IconAppConstants.group),
          ),
        ],
      ),
      body: const TransactionHistoryDataList(),
    );
  }
}
