import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import 'accept_group_team_contract_with_checkbox_widget.dart';

class ConfirmGroupTeamDialog extends StatefulWidget {
  final VoidCallback onAction;

  const ConfirmGroupTeamDialog({
    super.key,
    required this.onAction,
  });

  @override
  State<ConfirmGroupTeamDialog> createState() => _ConfirmGroupTeamDialogState();
}

class _ConfirmGroupTeamDialogState extends State<ConfirmGroupTeamDialog> {
  final _acceptTerm = ValueNotifier(false);

  @override
  void dispose() {
    _acceptTerm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
              'Để đảm bảo quyền lợi của cả 2 bên, vui lòng đọc kỹ hợp đồng và ký vào hợp đồng bằng cách tích vào ô bên dưới và nhấn đồng ý!',
              style: context.text.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6E6E6E),
                height: 20 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            AcceptGroupTeamContractWithCheckBoxWidget(
              acceptTerm: _acceptTerm,
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      backgroundColor: const Color(0xFFF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: context.popNavigator,
                    child: Text(
                      'Hủy',
                      style: context.text.bodyLarge?.copyWith(
                        color: const Color(0xFF6E6E6E),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      backgroundColor: const Color(0xFF4B84F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_acceptTerm.value) {
                        context.popNavigator();
                        widget.onAction.call();
                      } else {
                        showToastMessage(
                          'Vui lòng đọc và đồng ý Hợp đồng',
                          ToastMessageType.error,
                        );
                      }
                    },
                    child: Text(
                      'Đồng ý',
                      style: context.text.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 24 / 16,
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
    );
  }
}
