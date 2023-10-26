import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DropdownItemWidget extends StatelessWidget {
  final String? icon;
  final String? text;
  final Color? colorIcon;
  final Widget? rightWidget;

  const DropdownItemWidget({
    super.key,
    this.icon,
    this.text,
    this.colorIcon,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          ImageWidget(
            icon!,
            width: 22,
            height: 22,
            color: colorIcon ?? AppColors.grey20,
          ),
        const SizedBox(width: 6),
        if (text != null)
          Expanded(
            child: Text(
              text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    color: AppColors.grey20,
                  ),
            ),
          ),
        if (rightWidget != null)
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: rightWidget,
          )
      ],
    );
  }
}
