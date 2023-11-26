import 'package:collection/collection.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/app_refresher.dart';
import '../transaction_history.dart';
import 'transaction_history_item.dart';

class TransactionHistoryDataList extends StatefulWidget {
  const TransactionHistoryDataList({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryDataList> createState() =>
      _TransactionHistoryDataListState();
}

class _TransactionHistoryDataListState
    extends State<TransactionHistoryDataList> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();

    // return BlocBuilder<DiamondTransactionHistoryBloc, TransactionHistoryState>(
    //   buildWhen: (previous, current) => current is TransactionHistoryLoaded,
    //   builder: (context, state) {
    //     if (state is TransactionHistoryLoaded) {
    //       if (state.transactionHistories.isEmpty) {
    //         return const NoDataWidget();
    //       }
    //
    //       return _buildTransactionHistoryList(state.transactionHistories);
    //     }
    //
    //     if (state is TransactionHistoryStateError) {
    //       return Text(state.message);
    //     }
    //
    //     return const LoadingWidget();
    //   },
    // );
  }

// Widget _buildTransactionHistoryList(
//     List<DiamondTransactionHistory> transactionHistories) {
//
//   final transactionHistoryGroupByMonth = groupBy(
//     transactionHistories,
//     (data) => DateFormat('MM-yyyy').format(data.createdAt ?? DateTime.now()),
//   ).entries;
//
//   final bloc = context.read<DiamondTransactionHistoryBloc>();
//
//   return AppRefresher(
//     controller: bloc.refreshController,
//     onRefresh: bloc.onRefresh,
//     onLoading: bloc.onLoading,
//     child: ListView(
//       padding: const EdgeInsets.only(top: 16),
//       children: transactionHistoryGroupByMonth.map(
//         (e) {
//           final title = 'Tháng ${e.key.replaceAll('-', '/')}';
//           final transactionHistories = e.value;
//
//           return Column(
//             children: [
//               ListTile(
//                 title: Text(
//                   title,
//                   style: context.text.displayMedium?.copyWith(
//                     color: WalletTheme.greyTextColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 tileColor: WalletTheme.whiteTitle,
//                 dense: true,
//               ),
//               ...transactionHistories.map(TransactionHistoryItem.new),
//             ],
//           );
//         },
//       ).toList(),
//     ),
//   );
// }
}
