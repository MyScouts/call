import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../wallet_coordinator_external.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.startChat(Configurations.userIdOffice),
      child: Text.rich(
        TextSpan(
          style: context.text.titleMedium?.copyWith(
            color: WalletTheme.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          children: [
            // WidgetSpan(child: ImageWidget(IconConstants.contact)),
            TextSpan(
              text: ' Liên hệ hỗ trợ',
              style: context.text.titleMedium?.copyWith(
                color: WalletTheme.blueCheckedColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
