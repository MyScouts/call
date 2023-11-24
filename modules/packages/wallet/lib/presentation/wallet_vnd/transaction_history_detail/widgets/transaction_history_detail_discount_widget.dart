import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import 'attribute_generator.dart';

class TransactionHistoryDetailDiscountWidget extends StatefulWidget {
  final TransactionHistoryDetail data;

  const TransactionHistoryDetailDiscountWidget({
    super.key,
    required this.data,
  });

  @override
  State<TransactionHistoryDetailDiscountWidget> createState() =>
      _TransactionHistoryDetailDiscountWidgetState();
}

class _TransactionHistoryDetailDiscountWidgetState
    extends State<TransactionHistoryDetailDiscountWidget> {
  Map<String, Widget> generateFormData(TransactionHistoryDetail data) {
    return {
      'Tiền nhận': Text(int.parse(data.value).toAppCurrencyString()),
      if (data.transactionType ==
          TransactionHistoryType.discountFromBuyAccount) ...{
        'ID người giới thiệu': Text(data.presenterPDoneId),
        'ID người đại diện': Text(data.representativePDoneId),
      },
      if (data.transactionType == TransactionHistoryType.discountFromOrder) ...{
        'ID người nhận': Text(data.receiverPDoneId),
        'ID người mua': Text(data.buyerPDoneId),
      },
      if (data.transactionType ==
          TransactionHistoryType.discountFromLivestream) ...{
        'ID người nhận': Text(data.receiverPDoneId),
        'Số Kim Cương quy đổi': Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(
              builder: (context) {
                final colorStatus =
                    data.status.getColorStatus(data.transactionType);
                return Text(
                  colorStatus.minusDiamondValue(data.diamondValue),
                  style: context.text.titleMedium?.copyWith(
                    color: data.status.numberColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            ImageWidget(IconAppConstants.group, width: 16),
          ],
        ),
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
