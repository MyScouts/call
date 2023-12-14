import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class UnconnectionModal extends StatelessWidget {
  const UnconnectionModal({
    required this.name,
    required this.avatar,
    required this.connectionTitle,
    required this.content,
    super.key,
  });
  final String name;
  final String avatar;
  final String connectionTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;
    
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: CircleAvatar(
              radius: imageSize,
              child: ClipOval(
                child: ImageWidget(
                  avatar,
                  width: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: context.text.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.grey76,
              ),
              children: [
                TextSpan(
                  text: content,
                ),
                TextSpan(
                  text: name,
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAction(
                title: 'Huỷ',
                backgroundColor: AppColors.gray50,
                textColor: AppColors.gray500,
                onTap: () => context.pop(),
                context: context,
              ),
              const SizedBox(width: 12),
              _buildAction(
                title: connectionTitle,
                backgroundColor: AppColors.red500,
                textColor: AppColors.white,
                onTap: () {
                  context.pop(data: true);
                },
                context: context,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAction({
    required Function onTap,
    required String title,
    required BuildContext context,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            title,
            style: context.text.titleMedium!.copyWith(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
