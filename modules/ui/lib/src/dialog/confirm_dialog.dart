import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'widgets/dialog_container_widget.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String actionTitle;
  final String? content;
  final VoidCallback onAction;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onAction,
    this.content,
    this.contentStyle,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(
              title,
              style: titleStyle ??
                  Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.red3,
                      ),
              textAlign: TextAlign.start,
            ),
          ),
          if (content != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Text(
                content!,
                textAlign: TextAlign.start,
                style: contentStyle ??
                    Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF667385),
                          height: 1.4,
                        ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Text(
                    'Huỷ',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onAction.call();
                  },
                  child: Text(
                    actionTitle,
                    textAlign: TextAlign.end,
                    style: titleStyle ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.red3,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
