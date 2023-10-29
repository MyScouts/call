// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../button/common_outline_button.dart';
import '../button/primary_button.dart';
import 'widgets/dialog_container_widget.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final String actionTitle;
  final VoidCallback onAction;

  const ActionDialog({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(Icons.close, color: AppColors.grey8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 35, left: 32, right: 32),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    title: actionTitle,
                    onTap: () {
                      Navigator.pop(context);
                      onAction.call();
                    },
                    disabled: false,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CommonOutlineButton(
                    onPressed: Navigator.of(context).pop,
                    label: 'Huỷ',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
