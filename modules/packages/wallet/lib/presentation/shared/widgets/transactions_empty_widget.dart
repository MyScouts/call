import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class TransactionsEmptyWidget extends StatelessWidget {
  const TransactionsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWidget(
              ImageConstants.imgTransactionEmpty,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            const SizedBox(height: 16),
            Text(
              'Hiện chưa có giao dịch nào',
              textAlign: TextAlign.center,
              style: context.text.bodyMedium!.copyWith(
                color: const Color(0xFF101B28),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 24 / 16,
              ),
            ),
            Text(
              'Mua sắm ngay và thanh toán để nhận nhiều ưu đãi vô cùng hấp dẫn',
              textAlign: TextAlign.center,
              style: context.text.bodyMedium!.copyWith(
                color: const Color(0xFF6E6E6E),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 20 / 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
