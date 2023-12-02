// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../button/common_outline_button.dart';
import '../button/primary_button.dart';
import 'widgets/dialog_container_widget.dart';

class ChatDialog extends StatelessWidget {
  final String title;
  final String actionTitle;
  final Color? actionColor;
  final String? content;
  final Widget? contentWidget;
  final TextAlign? contentAlign;
  final VoidCallback onAction;
  final VoidCallback? onCancel;
  final bool isBack;
  final bool showCancel;

  const ChatDialog({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onAction,
    this.content,
    this.onCancel,
    this.isBack = true,
    this.showCancel = true,
    this.actionColor,
    this.contentAlign,
    this.contentWidget,
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
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (onCancel == null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: const Icon(Icons.close, color: AppColors.black),
                      ),
                    ),
                  ),
              ],
            ),
            kSpacingHeight24,
            if (content != null)
              Text(
                content!,
                textAlign: contentAlign ?? TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.textSecondary, fontSize: 14),
              ),
            if(contentWidget != null)
              contentWidget!,
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  if (showCancel) ...[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          onCancel?.call();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfff4f4f4)),
                          child: Center(
                            child: Text(
                              'Huỷ',
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textSecondary,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    kSpacingWidth12,
                  ],
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (isBack) {
                          Navigator.pop(context);
                        }
                        onAction.call();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: actionColor ?? AppColors.red500),
                        child: Center(
                          child: Text(
                            actionTitle,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 16),
                          ),
                        ),
                      ),
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
