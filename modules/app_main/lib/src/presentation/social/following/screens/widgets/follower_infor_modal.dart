import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui/ui.dart';

class FollowerInforModal extends StatelessWidget {
  const FollowerInforModal({
    required this.textSpan1,
    this.textSpanName,
    this.textSpan2,
    super.key,
  });
  final String textSpan1;
  final String? textSpanName;
  final String? textSpan2;

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                'Thông báo',
                style: context.text.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () => context.pop(),
                child: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 34),
          RichText(
            text: TextSpan(
              style: context.text.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.grey76,
              ),
              children: [
                TextSpan(
                  text: textSpan1,
                ),
                if (textSpanName != null)
                  TextSpan(
                    text: textSpanName,
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                if (textSpan2 != null)
                  TextSpan(
                    text: textSpan2,
                  ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.blueEdit,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                'Xác nhận',
                style: context.text.titleMedium!.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
