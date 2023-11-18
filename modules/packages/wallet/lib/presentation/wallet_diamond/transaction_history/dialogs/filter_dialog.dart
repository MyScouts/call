import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/gradiant_button.dart';

class TransactionFilterDialog extends StatefulWidget {
  final DiamondTransactionHistoryFilter? defaultFilter;

  const TransactionFilterDialog({Key? key, this.defaultFilter})
      : super(key: key);

  @override
  TransactionFilterDialogState createState() => TransactionFilterDialogState();
}

class TransactionFilterDialogState extends State<TransactionFilterDialog> {
  late DiamondTransactionHistoryFilter transactionData;

  set setTransactionData(DiamondTransactionHistoryFilter value) =>
      transactionData = value;

  void handleTimeFilter(DateTime value) {
    setTransactionData = transactionData.copyWith(date: value);
  }

  void handleTypeFilter(List<DiamondTransactionHistoryType> value) {
    setTransactionData = transactionData.copyWith(transactionType: value);

    setState(() {});
  }

  void handleStatusFilter(List<DiamondTransactionHistoryStatus> value) {
    setTransactionData = transactionData.copyWith(status: value);
  }

  void handleAccept() => context.popNavigator(transactionData);

  @override
  void initState() {
    transactionData =
        widget.defaultFilter ?? const DiamondTransactionHistoryFilter();
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
          titles:
              DiamondTransactionHistoryType.values.map((e) => e.title).toList(),
          values: DiamondTransactionHistoryType.values,
          onSelected: handleTypeFilter,
        ),
      ],
    );
  }

  Widget statusFilter() {
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
          titles: DiamondTransactionHistoryStatus.values
              .map((e) => e.title)
              .toList(),
          values: DiamondTransactionHistoryStatus.values,
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
