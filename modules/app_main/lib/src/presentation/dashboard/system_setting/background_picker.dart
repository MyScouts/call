import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_background_builder.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum _Step {
  pick,
  setup,
  confirm,
  pending;
}

class BackgroundPicker extends StatefulWidget {
  static const String routerName = 'bg_picker';

  const BackgroundPicker({super.key});

  @override
  State<BackgroundPicker> createState() => _BackgroundPickerState();
}

class _BackgroundPickerState extends State<BackgroundPicker> {
  int _page = 0;
  String _path = '';

  _Step _step = _Step.pick;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = context.findAncestorWidgetOfExactType<SystemSettingData>();
    _page = data?.page ?? 0;
    _path = getIt<DashboardSharePreferenceUseCase>().getDashBoardBg(
      'bg $_page',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_step == _Step.pick) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
            'Cài đặt hình nền',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _step = _Step.setup;
                  });
                },
                child: const Text(
                  'Đặt',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4B84F7),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(16.0),
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 88 / 178,
          children: bgs.map((e) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _path = e;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: _path == e ? const Color(0xff4B84F7) : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ImageWidget(e, borderRadius: 12),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageWidget(_path, fit: BoxFit.fill),
          if (_step == _Step.setup)
            Positioned(
              left: 32,
              right: 32,
              bottom: 40,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _step = _Step.pick;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.24),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _step = _Step.confirm;
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.24),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16)),
                    child: const Text(
                      'Thiết lập',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (_step == _Step.confirm)
            Positioned(
              left: 16,
              right: 16,
              bottom: 40,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      NotificationCenter.post(
                        channel: changeBg,
                        options: _path,
                      );
                      setState(() {
                        _step = _Step.pending;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).popUntil(
                          (route) =>
                              route.settings.name == DashBoardScreen.routeName,
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      'Đặt làm hình nền',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff007AFF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _step = _Step.pick;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff007AFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (_step == _Step.pending)
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.24),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformLoadingIndicator(size: 22),
                    Text(
                      'Đang cập nhật hình nền...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
