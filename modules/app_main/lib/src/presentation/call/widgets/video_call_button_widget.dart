
//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class VideoCallButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const VideoCallButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.bgButtonCall,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Column(
              children: [
                ImageWidget(
                  IconAppConstants.icCallVideo,
                  width: 24,
                  height: 24,
                ),
                kSpacingHeight2,
                Text(
                  'Gọi video',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}