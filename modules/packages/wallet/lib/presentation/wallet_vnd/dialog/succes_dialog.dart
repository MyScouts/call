import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/presentation/presentation.dart';

import '../../wallet_constant.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape:
          RoundedRectangleBorder(borderRadius: WalletConstant.borderRadius10),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.horizontal12, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  context.backToMyWallet();
                },
                child: const Icon(Icons.close),
              ),
            ),
            const SizedBox(height: 25),
            ImageWidget(IconAppConstants.icApprovedTick),
            const SizedBox(height: 20),
            Text(
              'Lệnh rút tiền đang chờ xử lý',
              style: context.text.titleLarge
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
