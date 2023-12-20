import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/data/datasources/models/request/wallet_transactions_request.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/datetime_filter_sheet.dart';
import 'package:wallet/presentation/shared/widgets/transaction_filter_sheet.dart';
import 'package:wallet/presentation/shared/widgets/wallet_transaction_item_widget.dart';
import 'package:wallet/presentation/transaction_history_detail_screen.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../core/theme/wallet_theme.dart';
import 'shared/bloc/wallet_bloc.dart';

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
  DateTime _selectedDate = DateTime.now();

  FilterOption _selectedFilter = FilterOption(status: [], type: []);

  num get _fromTimestamp => DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        0,
        0,
        0,
      ).millisecondsSinceEpoch;

  num get _toTimestamp => DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        23,
        59,
        59,
      ).millisecondsSinceEpoch;
  late final _bloc = injector<WalletBloc>();

  @override
  void initState() {
    _bloc.add(
      WalletEvent.getWalletTransactionList(
        walletType: widget.walletType,
        request: WalletTransactionsRequest(
          fromTimestamp: _fromTimestamp,
          toTimestamp: _toTimestamp,
        ),
      ),
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
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  builder: (BuildContext context) {
                    return TransactionFilterSheet(
                      walletType: widget.walletType,
                      initValue: _selectedFilter,
                      onResetFilter: () {
                        _bloc.add(
                          WalletEvent.getWalletTransactionList(
                            walletType: widget.walletType,
                            request: WalletTransactionsRequest(
                              fromTimestamp: _fromTimestamp,
                              toTimestamp: _toTimestamp,
                            ),
                          ),
                        );
                      },
                      onFilterSelected: (FilterOption value) {
                        _selectedFilter = value;

                        _bloc.add(
                          WalletEvent.filterTransaction(
                            filter: _selectedFilter,
                          ),
                        );
                      },
                    );
                  },
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 23),
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Color(0xFF667385),
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateFilterWidget(),
          _buildSelectedStatus(),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  _buildSelectedStatus() {
    return BlocBuilder<WalletBloc, WalletState>(
      bloc: _bloc,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Wrap(
          spacing: 5,
          runSpacing: 10,
          children: [
            ..._selectedFilter.type.map(
              (type) => _buildSelectedStatusChip(
                title: type.filterText(walletType: widget.walletType),
                onRemove: () {
                  _selectedFilter.type.remove(type);

                  if (_selectedFilter.type.isNotEmpty &&
                      _selectedFilter.status.isNotEmpty) {
                    _bloc.add(
                      WalletEvent.filterTransaction(filter: _selectedFilter),
                    );
                  } else {
                    _bloc.add(
                      WalletEvent.getWalletTransactionList(
                        walletType: widget.walletType,
                        request: WalletTransactionsRequest(
                          fromTimestamp: _fromTimestamp,
                          toTimestamp: _toTimestamp,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            ..._selectedFilter.status.map(
              (status) => _buildSelectedStatusChip(
                title: status.text,
                onRemove: () {
                  _selectedFilter.status.remove(status);
                  if (_selectedFilter.type.isNotEmpty &&
                      _selectedFilter.status.isNotEmpty) {
                    _bloc.add(
                      WalletEvent.filterTransaction(filter: _selectedFilter),
                    );
                  } else {
                    _bloc.add(
                      WalletEvent.getWalletTransactionList(
                        walletType: widget.walletType,
                        request: WalletTransactionsRequest(
                          fromTimestamp: _fromTimestamp,
                          toTimestamp: _toTimestamp,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSelectedStatusChip({
    required String title,
    required VoidCallback onRemove,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0xFFD0D6DD)),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Text(
              title,
              style: context.text.bodyMedium?.copyWith(
                color: const Color(0xFF101B28),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onRemove.call,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: const Color(0xFF101B28).withOpacity(0.08),
                child: const Icon(
                  Icons.close,
                  color: WalletTheme.textColor,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateFilterWidget() {
    return BlocBuilder<WalletBloc, WalletState>(
      bloc: _bloc,
      builder: (context, state) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            builder: (BuildContext context) {
              return DatetimeFilterSheet(
                initialDateTime: _selectedDate,
                onDateSelected: (date) {
                  _selectedDate = date;
                  final request = WalletTransactionsRequest(
                    fromTimestamp: _fromTimestamp,
                    toTimestamp: _toTimestamp,
                  );
                  _selectedFilter = FilterOption(status: [], type: []);
                  _bloc.add(
                    WalletEvent.getWalletTransactionList(
                      walletType: widget.walletType,
                      request: request,
                    ),
                  );
                },
              );
            },
          );
        },
        child: Container(
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
        ),
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
              padding: const EdgeInsets.only(left: 15, right: 15),
              children: transactions
                  .map(
                    (item) => WalletTransactionItemWidget(
                      transactionItem: item,
                      walletType: widget.walletType,
                      onTap: () => context.startTransactionHistoryDetails(
                        TransactionHistoryDetailParams(
                          id: '${item.id}',
                          walletType: widget.walletType,
                        ),
                      ),
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
