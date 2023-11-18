import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../wallet_constant.dart';

class UserAsset extends StatelessWidget {
  final WalletType type;
  final String amount;
  final TextStyle? textStyle;
  final double iconWidth;
  final double iconHeight;
  final double spaceBetween;

  const UserAsset({
    Key? key,
    required this.type,
    required this.amount,
    this.textStyle,
    this.iconWidth = 22,
    this.iconHeight = 22,
    this.spaceBetween = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          ImageWidget(type.icon, width: iconWidth, height: iconHeight),
          SizedBox(width: spaceBetween),
          Text(
            amount,
            style: textStyle ??
                context.text.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
