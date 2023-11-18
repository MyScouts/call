import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/core/core.dart';

import '../../../../../wallet.dart';
import '../../shared/widgets/gradiant_button.dart';
import '../../wallet_constant.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonWidth = 170.0;
    const buttonHeight = 48.0;
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
                onTap: context.popNavigator,
                child: const Icon(Icons.close),
              ),
            ),
            ImageWidget(IconAppConstants.icWaiting),
            const SizedBox(height: 20),
            Text(
              'Thông tin không trùng khớp',
              style: context.text.titleLarge
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Text(
              'Mã không hợp lệ. Vui lòng nhập lại',
              style: context.text.bodyMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: GradiantButton(
                onPressed: context.popNavigator,
                height: buttonHeight,
                width: buttonWidth,
                child: Text(
                  'Đóng',
                  style: context.text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
