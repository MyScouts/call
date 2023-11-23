import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ExchangeStatusDialog extends StatelessWidget {
  final bool isSuccess;

  const ExchangeStatusDialog({
    Key? key,
    required this.isSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isSuccess)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF52C41A),
                size: 32,
              )
            else
              const Icon(
                Icons.error_outline_outlined,
                color: AppColors.red10,
                size: 32,
              ),
            const SizedBox(height: 16),
            Text(
              isSuccess ? 'Đổi kim cương thành công' : 'Đổi thất bại',
              style: context.text.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: WalletTheme.black22,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
