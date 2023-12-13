import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';

import '../../wallet_constant.dart';

class WaitingDialog extends StatelessWidget {
  final VoidCallback onAction;

  const WaitingDialog({super.key, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape: RoundedRectangleBorder(
        borderRadius: WalletConstant.borderRadius12,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontal,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            ImageWidget(
              ImageConstants.imgWaiting,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,
            ),
            const SizedBox(height: 20),
            Text(
              'Chờ xét duyệt',
              style: context.text.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Lệnh rút tiền đang chờ duyệt. Bạn sẽ nhận được thông báo khi quá trình xét duyệt hoàn thành',
              textAlign: TextAlign.center,
              style: context.text.bodyMedium?.copyWith(
                color: const Color(0xFF8C8C8C),
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              title: 'Xác nhận',
              height: 55,
              onTap: () {
                context.popNavigator();
                onAction.call();
              },
              disabled: false,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
