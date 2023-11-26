import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import 'attribute_generator.dart';

class TransactionHistoryDetailCommissionWidget extends StatefulWidget {
  final TransactionHistoryDetail data;

  const TransactionHistoryDetailCommissionWidget({
    super.key,
    required this.data,
  });

  @override
  State<TransactionHistoryDetailCommissionWidget> createState() =>
      _TransactionHistoryDetailCommissionWidgetState();
}

class _TransactionHistoryDetailCommissionWidgetState
    extends State<TransactionHistoryDetailCommissionWidget> {
  Map<String, Widget> generateFormData(TransactionHistoryDetail data) {
    return {
      'Tiền nhận': Text(int.parse(data.value).toAppCurrencyString()),
      'ID người nhận': Text(data.receiverPDoneId),
      if (data.transactionType ==
          TransactionHistoryType.commissionFromOrder) ...{
        'ID người bán': Text(data.sellerPDoneId),
        'ID Người mua': Text(data.buyerPDoneId),
      },
      if (data.transactionType ==
          TransactionHistoryType.commissionFromBuyAccount) ...{
        'ID người giới thiệu': Text(data.presenterPDoneId),
        'ID người đại diện': Text(data.representativePDoneId),
      },
      if (data.transactionType ==
          TransactionHistoryType.commissionFromLivestream) ...{
        'ID thực hiện': Text(data.executorPDoneId),
      },
      'Nội dung': Text(data.content),
    };
  }

  @override
  Widget build(BuildContext context) {
    final formData = generateFormData(widget.data);

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF025DB4), Color(0xFF0E88FE)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Text(
            'Mã giao dịch ${widget.data.code}',
            style: context.text.titleMedium?.copyWith(
              color: WalletTheme.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                AttributeGenerator(
                  data: formData,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        const ContactWidget(),
        const SizedBox(height: 16),
      ],
    );
  }
}
