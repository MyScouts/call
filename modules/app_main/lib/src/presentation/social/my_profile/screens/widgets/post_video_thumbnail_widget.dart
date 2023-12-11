import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostVideoThumbnailWidget extends StatelessWidget {
  const PostVideoThumbnailWidget({
    super.key,
    required this.child,
    required this.onTap,
  });
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 172.h,
      color: AppColors.black,
      child: GestureDetector(
        onTap: () => onTap(),
        child: child,
      ),
    );
  }
}
