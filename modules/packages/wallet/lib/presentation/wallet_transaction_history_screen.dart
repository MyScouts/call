import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/data/datasources/models/request/wallet_transactions_request.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/app_refresher.dart';
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
  DateTime _selectedFromDate = DateTime.now().subtract(
    const Duration(days: 30),
  );
  DateTime _selectedToDate = DateTime.now();

  FilterOption _selectedFilter = FilterOption(status: [], type: []);
  late final _bloc = injector<WalletBloc>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    _bloc.dataState.setWalletType = widget.walletType;
    _bloc.dataState.setRequest = WalletTransactionsRequest(
      fromTimestamp: _selectedFromDate.millisecondsSinceEpoch,
      toTimestamp: _selectedToDate.millisecondsSinceEpoch,
    );
    _bloc.onRefresh();
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
                        _bloc.onRefresh();
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
                  _bloc.add(
                    WalletEvent.filterTransaction(filter: _selectedFilter),
                  );
                },
              ),
            ),
            ..._selectedFilter.status.map(
              (status) => _buildSelectedStatusChip(
                title: status.text,
                onRemove: () {
                  _selectedFilter.status.remove(status);
                  _bloc.add(
                    WalletEvent.filterTransaction(filter: _selectedFilter),
                  );
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
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: GestureDetector(
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
                      initialDateTime: _selectedFromDate,
                      onDateSelected: (date) {
                        _selectedFromDate = date;
                        final request = WalletTransactionsRequest(
                          fromTimestamp:
                              _selectedFromDate.millisecondsSinceEpoch,
                          toTimestamp: _selectedToDate.millisecondsSinceEpoch,
                        );
                        _selectedFilter = FilterOption(status: [], type: []);
                        initData();
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Từ ngày',
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
                            _selectedFromDate.formatDate(),
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
          ),
          Expanded(
            child: GestureDetector(
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
                      initialDateTime: _selectedToDate,
                      onDateSelected: (date) {
                        _selectedToDate = date;
                        final request = WalletTransactionsRequest(
                          fromTimestamp:
                              _selectedFromDate.millisecondsSinceEpoch,
                          toTimestamp: _selectedToDate.millisecondsSinceEpoch,
                        );
                        _selectedFilter = FilterOption(status: [], type: []);
                        initData();
                      },
                    );
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Đến ngày',
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
                            _selectedToDate.formatDate(),
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
          ),
        ],
      ),
    );
  }

  _buildList() {
    return BlocConsumer<WalletBloc, WalletState>(
      bloc: _bloc,
      listener: (context, state) {
        state.whenOrNull(
          getWalletTransactionListSuccess: (transactions) {
            _bloc.add(
              WalletEvent.filterTransaction(filter: _bloc.dataState.filter),
            );
          },
        );
      },
      buildWhen: (previous, current) =>
          current.whenOrNull(
            getWalletTransactionListFailed: (err) => true,
            filterTransactionSuccess: (transactions) => true,
            error: (mess) => true,
          ) ??
          false,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingWidget(),
          error: (message) => Center(child: Text(message)),
          filterTransactionSuccess: (transactions) {
            if (transactions.isEmpty) {
              return const TransactionsEmptyWidget();
            }
            final transactionHistoryGroupByDate = groupBy(
              transactions,
              (data) =>
                  (data.createdAt ?? DateTime.now()).toLocal().formatDate(),
            ).entries;

            return AppRefresher(
              controller: _bloc.refreshController,
              onRefresh: _bloc.onRefresh,
              onLoading: _bloc.onLoading,
              child: ListView(
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: transactionHistoryGroupByDate.map(
                  (item) {
                    final title = 'Ngày ${item.key}';
                    final transactionHistories = item.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 15),
                          child: Text(
                            title,
                            style: context.text.displayMedium?.copyWith(
                              color: const Color(0xFF6E6E6E),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 16 / 12,
                            ),
                          ),
                        ),
                        ...transactionHistories.map(
                          (e) => WalletTransactionItemWidget(
                            transactionItem: e,
                            walletType: widget.walletType,
                            onTap: () => context.startTransactionHistoryDetails(
                              TransactionHistoryDetailParams(
                                id: '${e.id}',
                                walletType: widget.walletType,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
