import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostVideoThumbnailWidget extends StatelessWidget {
  const PostVideoThumbnailWidget({
    super.key,
    required this.child,
    this.onTap,
    this.width,
    this.height,
    this.radius,
  });
  final Widget child;
  final Function? onTap;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 172.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: AppColors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: child,
        ),
      ),
    );
  }
}
