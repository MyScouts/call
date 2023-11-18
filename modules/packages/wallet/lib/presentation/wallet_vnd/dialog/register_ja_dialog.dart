import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';

import '../../../../wallet.dart';
import '../../shared/widgets/gradiant_button.dart';
import '../../wallet_constant.dart';
import '../../wallet_coordinator_external.dart';

class RegisterJADialog extends StatelessWidget {
  final WalletType walletType;
  //kiểm tra là live thu nhỏ
  final bool isPipLive;
  final String? content;

  const RegisterJADialog({
    Key? key,
    required this.walletType,
    this.isPipLive = false,
    this.content,
  }) : super(key: key);

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
                  //ở màn live thu nhỏ về được màn ví.
                  isPipLive ? Navigator.pop(context) : context.backToMyWallet();
                },
                child: const Icon(Icons.close),
              ),
            ),
            ImageWidget(
              ImageConstants.warning,
              width: 180,
            ),
            const SizedBox(height: 35),
            Text(
              content ??
                  'Để sử dụng ${walletType.walletNameInDialog} bạn cần phải đăng ký mã JA\n(Đăng ký JA bạn cần trên 15 tuổi)',
              textAlign: TextAlign.center,
              style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 18, height: 1.5),
            ),
            const SizedBox(height: 30),
            GradiantButton(
              width: 160,
              gradient: const LinearGradient(
                colors: [
                  AppColors.blue10,
                  AppColors.blue10,
                ],
              ),
              onPressed: () {
                context.popNavigator();
                context.startUpgradeJA();
              },
              child: const Text('Đăng ký ngay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
