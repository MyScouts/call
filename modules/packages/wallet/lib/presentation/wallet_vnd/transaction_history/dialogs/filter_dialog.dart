import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../transaction_history_constant.dart';

class TransactionFilterDialog extends StatefulWidget {
  final TransactionHistoryVendor vendor;
  final TransactionHistoryFilter? defaultFilter;

  const TransactionFilterDialog({
    Key? key,
    this.defaultFilter,
    required this.vendor,
  }) : super(key: key);

  @override
  TransactionFilterDialogState createState() => TransactionFilterDialogState();
}

class TransactionFilterDialogState extends State<TransactionFilterDialog> {
  late TransactionHistoryFilter transactionData;

  set setTransactionData(TransactionHistoryFilter value) =>
      transactionData = value;

  void handleTimeFilter(DateTime value) {
    setTransactionData = transactionData.copyWith(date: value);
  }

  void handleTypeFilter(List<TransactionHistoryType> value) {
    setTransactionData = transactionData.copyWith(transactionType: value);

    setState(() {});
  }

  void handleStatusFilter(List<TransactionHistoryStatus> value) {
    setTransactionData = transactionData.copyWith(status: value);
  }

  void handleAccept() {
    final status = _filterWithdrawStatus(transactionData);

    final data = transactionData.copyWith(status: status);

    context.popNavigator(data);
  }

  List<TransactionHistoryStatus> _filterWithdrawStatus(
      TransactionHistoryFilter data) {
    final newData = [...data.status];

    if (!data.transactionType.contains(TransactionHistoryType.withdraw) &&
        data.status.contains(TransactionHistoryStatus.waitingWithdraw)) {
      newData.remove(TransactionHistoryStatus.waitingWithdraw);
    }

    return newData;
  }

  @override
  void initState() {
    transactionData = widget.defaultFilter ?? const TransactionHistoryFilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Lọc',
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: WalletTheme.black,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: context.popNavigator,
                    child: const Icon(Icons.close, color: WalletTheme.black),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              filterDivider(),
              timeFilter(),
              filterDivider(),
              typeFilter(),
              filterDivider(),
              statusFilter(),
              const SizedBox(height: 32),
              buttonAccept(),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterDivider() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Divider(color: WalletTheme.grey73, thickness: 1),
      );

  Widget timeFilter() => Row(
        children: [
          Text(
            'Thời gian',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: WalletTheme.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          TimeFilterButton(
            defaultDate: transactionData.date,
            onChanged: handleTimeFilter,
          ),
        ],
      );

  Widget typeFilter() {
    final types = widget.vendor == TransactionHistoryVendor.vShop
        ? TransactionHistoryConstant.vShopTypes
        : TransactionHistoryConstant.vLiveTypes;

    final titles = types.map(
      (e) {
        switch (widget.vendor) {
          case TransactionHistoryVendor.vShop:
            return e.vShopTitle;
          case TransactionHistoryVendor.vLive:
            return e.vLiveTitle;
        }
      },
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hình thức',
          style: context.text.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: WalletTheme.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        MultipleChoiceButton(
          defaultValue: transactionData.transactionType,
          titles: titles,
          values: types,
          onSelected: handleTypeFilter,
        ),
      ],
    );
  }

  Widget statusFilter() {
    final status = transactionData.transactionType.contains(
      TransactionHistoryType.withdraw,
    )
        ? TransactionHistoryConstant.withdrawTypeStatus
        : TransactionHistoryConstant.otherTypeStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trạng thái',
          style: context.text.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: WalletTheme.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        MultipleChoiceButton(
          defaultValue: transactionData.status,
          titles: status.map((e) => e.title).toList(),
          values: status,
          onSelected: handleStatusFilter,
        ),
      ],
    );
  }

  Widget buttonAccept() => GradiantButton(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [AppColors.blue30, AppColors.blue20],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        onPressed: handleAccept,
        child: Text(
          'Xác nhận'.toUpperCase(),
          style: context.text.bodyMedium!.copyWith(
            color: WalletTheme.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      );
}
