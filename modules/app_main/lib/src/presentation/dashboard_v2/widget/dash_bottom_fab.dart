import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBottomFab extends StatefulWidget {
  const DashBottomFab({super.key, required this.onCLose});
  final VoidCallback onCLose;

  @override
  State<DashBottomFab> createState() => DashBottomFabState();
}

class DashBottomFabState extends State<DashBottomFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    animation = Tween<Offset>(begin: const Offset(0, 207), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    super.initState();
  }

  void forward() => controller.forward();

  void revert() => controller.reverse();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.translate(
          offset: animation.value,
          child: Container(
            width: (ScreenUtil().screenWidth - 32) / 6 + 16,
            height: 207,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            child: Column(
              children: <Widget>[
                _Item(
                  title: 'Bài viết',
                  image: Assets.icons_dashboard_edit.svg(),
                  onTap: () {
                    widget.onCLose();
                    context.showToastMessage(
                      'Tính năng đang được phát triển',
                      ToastMessageType.warning,
                    );
                  },
                ),
                _Item(
                  title: 'Video',
                  image: Assets.icons_dashboard_video.svg(),
                  onTap: () {
                    widget.onCLose();
                    context.showToastMessage(
                      'Tính năng đang được phát triển',
                      ToastMessageType.warning,
                    );
                  },
                ),
                _Item(
                  title: 'Thước phim',
                  image: Assets.icons_dashboard_video_play.svg(),
                  onTap: () {
                    widget.onCLose();
                    context.showToastMessage(
                      'Tính năng đang được phát triển',
                      ToastMessageType.warning,
                    );
                  },
                ),
              ].separated(const SizedBox(height: 19)),
            ),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  final Widget image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        height: 47,
        child: Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffBFE0FF), width: 3),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff66B2FF),
                    Color(0xff0080FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
              child: image,
            ),
            const SizedBox(height: 3),
            SizedBox(
              height: 14,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
