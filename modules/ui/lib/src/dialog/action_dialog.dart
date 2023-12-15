// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../button/common_outline_button.dart';
import '../button/primary_button.dart';
import 'widgets/dialog_container_widget.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final String actionTitle;
  final String? content;
  final Widget? widget;
  final VoidCallback onAction;
  final VoidCallback? onCancel;
  final bool isBack;

  const ActionDialog({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onAction,
    this.content,
    this.onCancel,
    this.isBack = true,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Center(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (onCancel == null)
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: const Icon(Icons.close, color: AppColors.grey8),
                    ),
                  ),
              ],
            ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.red3),
                ),
              ),
            if (widget != null) widget!,
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Expanded(
                    child: PrimarySolidButton(
                      title: "Huỷ",
                      onTap: () {
                        Navigator.of(context).pop();
                        onCancel?.call();
                      },
                      color: Colors.grey[200],
                      textColor: Colors.grey,
                      disabled: false,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PrimarySolidButton(
                      title: actionTitle,
                      onTap: () {
                        if (isBack) {
                          Navigator.pop(context);
                        }
                        onAction.call();
                      },
                      disabled: false,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
