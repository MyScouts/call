import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/change_password_screen.dart';
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
      backgroundColor: const Color(0xffF3F8FF),
      appBar: AppBar(
        shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        backgroundColor: const Color(0xffF3F8FF),
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: const Text(
          'Cài đặt chung',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Center(
            child: CloseButton(),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MainViewSetting(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xffE8EFFB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Màn hình chính',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Việc lựa chọn một trong ba màn C, P, E để làm màn'
                      ' hình chính sẽ giúp bạn có thể truy cập vào danh mục'
                      ' bạn muốn một cách nhanh chóng.',
                      style: TextStyle(
                        color: Color(0xff7F7E83),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
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
                          path: IconAppConstants.icSettingApp,
                          title: 'Cài đặt ứng dụng nhanh',
                          onClick: () {
                            NotificationCenter.post(channel: showAppStore);
                            Navigator.of(context).pop();
                          }),
                      _ItemView(
                        path: IconAppConstants.icSecurity,
                        title: 'Cài đặt bảo mật',
                        onClick: () => Navigator.of(context).pushNamed(
                          ChangePassword.routerName,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
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

class MainViewSetting extends StatefulWidget {
  const MainViewSetting({super.key});

  @override
  State<MainViewSetting> createState() => _MainViewSettingState();
}

class _MainViewSettingState extends State<MainViewSetting> {
  int? page = getIt<DashBoardScreenController>().mainPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Chọn màn hình chính',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8A898E)),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 103 / 223,
                        child: ImageWidget(
                          ImageConstants.screenshot1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Radio<int?>(
                        value: page,
                        groupValue: 0,
                        onChanged: (value) {
                          setState(() {
                            page = 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 103 / 223,
                        child: ImageWidget(
                          ImageConstants.screenshot2,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Radio<int?>(
                        value: page,
                        groupValue: 1,
                        onChanged: (value) {
                          setState(() {
                            page = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 103 / 223,
                        child: ImageWidget(
                          ImageConstants.screenshot3,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Radio<int?>(
                        value: page,
                        groupValue: 2,
                        onChanged: (value) {
                          setState(() {
                            page = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: page == null
                  ? null
                  : () {
                      getIt<DashBoardScreenController>().save(page!);
                      context.showToastMessage('Đặt màn hình chính thành công');
                    },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: page == null
                    ? const Color(0xffF4F4F4)
                    : Theme.of(context).primaryColor,
              ),
              child: Text(
                'Chọn làm màn hình chính',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: page == null ? const Color(0xffC8C8C8) : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
