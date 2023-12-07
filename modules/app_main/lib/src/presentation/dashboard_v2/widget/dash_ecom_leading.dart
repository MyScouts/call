import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';

class DashBoardEcoLeading extends StatelessWidget {
  const DashBoardEcoLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _LiveHeader(),
          SizedBox(height: 7.h),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _Image(path: Assets.icons_dashboard_mar_1.path),
                  _Image(path: Assets.icons_dashboard_mar_2.path),
                  _Image(path: Assets.icons_dashboard_mar_3.path),
                  _Image(path: Assets.icons_dashboard_mar_4.path),
                  _Image(path: Assets.icons_dashboard_mar_5.path),
                ].separated(SizedBox(width: 6.w)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: ImageWidget(path, borderRadius: 20.w),
    );
  }
}

class _LiveHeader extends StatelessWidget {
  const _LiveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWidget(Assets.icons_dashboard_trend_up.path),
        SizedBox(width: 6.w),
        Text(
          'MarShop bán chạy nhất',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
