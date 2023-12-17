import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';

class CreateOpenGroupRequestSuccessDialog extends StatefulWidget {
  final VoidCallback onAction;

  const CreateOpenGroupRequestSuccessDialog({
    super.key,
    required this.onAction,
  });

  @override
  State<CreateOpenGroupRequestSuccessDialog> createState() =>
      _CreateOpenGroupRequestSuccessDialogState();
}

class _CreateOpenGroupRequestSuccessDialogState
    extends State<CreateOpenGroupRequestSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: context.popNavigator,
                child: const Icon(Icons.close),
              ),
            ),
            Text(
              'Đã gửi thành công yêu cầu',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 24 / 16,
              ),
            ),
            const SizedBox(height: 25),
            const CircleAvatar(
              radius: 38,
              backgroundColor: Color(0xFF00A65F),
              child: Icon(Icons.check, color: Colors.white, size: 26),
            ),
            const SizedBox(height: 15),
            Text(
              'Yêu cầu đăng ký Boss Group thành công. Vui lòng chờ cho đến khi Admin phê duyệt!',
              style: context.text.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6E6E6E),
                height: 20 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            PrimaryButton(
              title: 'Hoàn thành',
              onTap: () {
                context.popNavigator();
                widget.onAction.call();
              },
              disabled: false,
              width: double.infinity,
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
