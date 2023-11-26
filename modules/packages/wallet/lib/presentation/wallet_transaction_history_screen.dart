import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/presentation/shared/widgets/transaction_filter_sheet.dart';
import 'package:wallet/presentation/shared/widgets/wallet_transaction_item_widget.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../core/theme/wallet_theme.dart';
import 'shared/bloc/wallet_bloc.dart';
import 'shared/widgets/transactions_empty_widget.dart';

class WalletTransactionHistoryScreen extends StatefulWidget {
  final WalletType walletType;
  static const routeName = '/wallet-transaction-history';

  const WalletTransactionHistoryScreen({
    super.key,
    required this.walletType,
  });

  @override
  State<WalletTransactionHistoryScreen> createState() =>
      _WalletTransactionHistoryScreenState();
}

class _WalletTransactionHistoryScreenState
    extends State<WalletTransactionHistoryScreen> {
  final _selectedDate = DateTime.now();
  late final _bloc = injector<WalletBloc>();

  @override
  void initState() {
    _bloc.add(
      WalletEvent.getWalletTransactionList(walletType: widget.walletType),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Lịch sử giao dịch',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF212121),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     showModalBottomSheet(
            //       context: context,
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.vertical(top: Radius.circular(12))
            //       ),
            //       builder: (BuildContext context) {
            //         return const TransactionFilterSheet();
            //       },
            //     );
            //   },
            //   padding: const EdgeInsets.symmetric(horizontal: 23),
            //   icon: const Icon(
            //     Icons.filter_alt_outlined,
            //     color: Color(0xFF667385),
            //     size: 30,
            //   ),
            // )
          ],
        ),
      ),
      body: Column(
        children: [
          // _filterWidget(),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _filterWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thời gian',
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.8,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate.text(),
                  style: context.text.titleMedium?.copyWith(
                    color: const Color(0xFF101B28),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildList() {
    return BlocBuilder<WalletBloc, WalletState>(
      bloc: _bloc,
      buildWhen: (previous, current) =>
          current.whenOrNull(
            getWalletTransactionListLoading: () => true,
            getWalletTransactionListFailed: (err) => true,
            getWalletTransactionListSuccess: (transactions) => true,
            error: (mess) => true,
          ) ??
          false,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingWidget(),
          error: (message) => Center(child: Text(message)),
          getWalletTransactionListSuccess: (transactions) {
            if (transactions.isEmpty) {
              return const TransactionsEmptyWidget();
            }

            return ListView(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              children: transactions
                  .map(
                    (item) => WalletTransactionItemWidget(
                      transactionItem: item,
                      walletType: widget.walletType,
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}
