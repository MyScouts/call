import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';

class DashBoardPsLeading extends StatelessWidget {
  const DashBoardPsLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      padding: EdgeInsets.all(10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _LiveHeader(),
          SizedBox(height: 12.h),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _Image(path: ImageConstants.defaultUserAvatar),
                  _Image(path: ImageConstants.defaultUserAvatar),
                  _Image(path: ImageConstants.defaultUserAvatar),
                  _Image(path: ImageConstants.defaultUserAvatar),
                  _Image(path: ImageConstants.defaultUserAvatar),
                ].separated(const SizedBox(width: 6)),
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
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageWidget(path, borderRadius: 20.w),
          Positioned(
            bottom: 1.w,
            right: 2.w,
            child: Container(
              height: 10.w,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff00DD58),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveHeader extends StatelessWidget {
  const _LiveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 8.w,
          width: 8.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff00DD58),
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          'Đang hoạt động',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
