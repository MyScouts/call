import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'bloc/transaction_history_bloc.dart';
import 'dialogs/dialogs.dart';
import 'widgets/widgets.dart';

class TransactionHistoryScreen extends StatefulWidget {
  final TransactionHistoryVendor vendor;

  static const routeName = '/transaction-history';

  const TransactionHistoryScreen({
    super.key,
    required this.vendor,
  });

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  Future<void> handleShowFilter() async {
    final bloc = context.read<TransactionHistoryBloc>();

    final defaultFilter = bloc.dataState.filter;

    final data = await showDialog<TransactionHistoryFilter>(
      context: context,
      builder: (context) => TransactionFilterDialog(
        vendor: bloc.vendor,
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
