//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kSpacingHeight24,
          ImageWidget(
            ImageConstants.imgNoResults,
            width: 213,
            height: 176,
          ),
          kSpacingHeight24,
          Text(
            'Chưa có thông tin',
            style: context.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.black, fontSize: 16),
          ),
          kSpacingHeight24,
        ],
      ),
    );
  }
}
