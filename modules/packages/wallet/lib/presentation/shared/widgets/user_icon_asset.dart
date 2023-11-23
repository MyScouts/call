import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class UserIconAsset extends StatelessWidget {
  final String amount;
  final TextStyle? textStyle;
  final double? iconWidth;
  final String? iconPath;

  const UserIconAsset({
    Key? key,
    this.iconPath,
    required this.amount,
    this.textStyle,
    this.iconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconPath = this.iconPath ?? IconAppConstants.icLeaveTeam;

    return IntrinsicWidth(
      child: Row(
        children: [
          Text(
            amount,
            style: textStyle ??
                context.text.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue10,
                  fontSize: 14,
                ),
          ),
          const SizedBox(width: 5),
          ImageWidget(iconPath, width: iconWidth ?? 18),
        ],
      ),
    );
  }
}
