import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import '../../wallet_constant.dart';

class NotificationDialog extends StatelessWidget {
  final String content;
  final String? actionTitle;
  final VoidCallback? onAction;

  const NotificationDialog({
    super.key,
    required this.content,
    this.actionTitle,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: WalletConstant.borderRadius10,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontal,
            vertical: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.close),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Thông báo',
                    style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: context.popNavigator,
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                content,
                style: context.text.titleLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF6E6E6E),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        backgroundColor: actionTitle != null
                            ? const Color(0xFFF4F4F4)
                            : const Color(0xFF4B84F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: context.popNavigator,
                      child: Text(
                        'Huỷ',
                        style: context.text.bodyLarge?.copyWith(
                          color: actionTitle != null
                              ? const Color(0xFF6E6E6E)
                              : AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 24 / 16,
                        ),
                      ),
                    ),
                  ),
                  if (actionTitle != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            backgroundColor: const Color(0xFF4B84F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            context.popNavigator();
                            onAction?.call();
                          },
                          child: Text(
                            'Huỷ liên kết',
                            style: context.text.bodyLarge?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              height: 24 / 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
