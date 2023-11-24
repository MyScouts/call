import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../shared/widgets/gradiant_button.dart';

class ConfirmExchangeDiamondDialog extends StatefulWidget {
  const ConfirmExchangeDiamondDialog({Key? key}) : super(key: key);

  @override
  State<ConfirmExchangeDiamondDialog> createState() =>
      _ConfirmExchangeDiamondDialogState();
}

class _ConfirmExchangeDiamondDialogState
    extends State<ConfirmExchangeDiamondDialog> {
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
            const Icon(
              Icons.error_outline_outlined,
              color: Color(0xFFFFAD0D),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Bạn chắc chắn muốn đổi qua VNĐ',
              style: context.text.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: WalletTheme.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonBack(),
                const SizedBox(width: 16),
                buttonAccept(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buttonBack() => SizedBox(
        width: 100,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: WalletTheme.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            side: const BorderSide(color: WalletTheme.primaryColor6),
          ),
          onPressed: context.popNavigator,
          child: Text(
            'Trở lại',
            style: context.text.bodyMedium!.copyWith(
              color: WalletTheme.primaryColor6,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );

  Widget buttonAccept() => GradiantButton(
        width: 100,
        onPressed: () => context.popNavigator(true),
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [AppColors.blue30, AppColors.blue20],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: Text(
          'Xác nhận',
          style: context.text.bodyMedium!.copyWith(
            color: WalletTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}
