import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import 'attribute_generator.dart';

class TransactionHistoryDetailWithdrawWidget extends StatelessWidget {
  final TransactionHistoryDetail data;

  const TransactionHistoryDetailWithdrawWidget({
    super.key,
    required this.data,
  });

  Map<String, Widget> generateFormData(TransactionHistoryDetail data) {
    final totalWithdraw = int.parse(data.value);
    final tax = int.parse(data.taxValue);
    final realValue = totalWithdraw - tax;

    return {
      'Tổng tiền rút': Text(totalWithdraw.toAppCurrencyString()),
      'Thuế TNCN (10%)': Text(tax.toAppCurrencyString()),
      'Tiền thực nhận': Text(realValue.toAppCurrencyString()),
      'ID Người nhận': Text(data.receiverPDoneId),
      'Rút từ': Text(data.fromSource.title),
    };
  }

  Map<String, Widget> generateTransactionData(TransactionHistoryDetail data) {
    return {
      'Tên chủ tài khoản': Text(data.bankAccount?.bankHolder ?? ''),
      'Số tài khoản': Text(data.bankAccount?.bankNumber ?? ''),
      'Ngân hàng': Text(data.bankAccount?.bank?.name ?? ''),
      'Thời gian giao dịch': Text(data.createdAt?.toAppDateTimeFormat() ?? ''),
    };
  }

  @override
  Widget build(BuildContext context) {
    final formData = generateFormData(data);
    final transactionData = generateTransactionData(data);

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
            'Mã giao dịch ${data.code}',
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
                const SizedBox(height: 16),
                AttributeGenerator(
                  titleBar: MapEntry(
                    Text(
                      'Trạng thái',
                      style: context.text.titleMedium!.copyWith(
                        color: WalletTheme.grey76,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data.status.getTitleFromType(data.transactionType),
                          style: context.text.titleMedium!.copyWith(
                            color: data.status.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.circle,
                            color: data.status.textColor, size: 10),
                      ],
                    ),
                  ),
                  data: formData,
                ),
                const Divider(color: WalletTheme.greyDivider, thickness: 0.5),
                const SizedBox(height: 8),
                AttributeGenerator(
                  titleBar: MapEntry(
                    Text(
                      'Thông tin giao dịch',
                      style: context.text.titleMedium!.copyWith(
                        color: WalletTheme.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(),
                  ),
                  data: transactionData,
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
