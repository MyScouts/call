import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'background_picker.dart';

class SystemSettingData extends InheritedWidget {
  final int page;

  const SystemSettingData({
    super.key,
    required this.page,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class SystemSetting extends StatelessWidget {
  static const String routerName = '/system-setting';

  const SystemSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Cài đặt hệ thống',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            _ItemView(
              path: IconAppConstants.icTranslate,
              title: 'Cài đặt ngôn ngữ',
            ),
            _ItemView(
              path: IconAppConstants.icPicture,
              title: 'Cài đặt hình nền',
              onClick: () => Navigator.of(context).pushNamed(
                BackgroundPicker.routerName,
              ),
            ),
            _ItemView(
              path: IconAppConstants.icSecurity,
              title: 'Cài đặt bảo mật',
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemView extends StatelessWidget {
  const _ItemView({
    super.key,
    required this.path,
    required this.title,
    this.onClick,
  });

  final String path;
  final String title;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 24,
              child: ImageWidget(path, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox.square(
              dimension: 16,
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Color(0xff667385),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
