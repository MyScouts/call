import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_group_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_base_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/widget/clock_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'app_icon_animation.dart';

class AppWidget extends StatelessWidget {
  final DashBoardItem app;

  const AppWidget({
    super.key,
    required this.app,
    this.textColor,
    this.disablePress = false,
    this.enableRemoveIcon = false,
    this.onRemoved,
  });

  final Color? textColor;
  final bool disablePress;
  final bool enableRemoveIcon;
  final Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: IgnorePointer(
              ignoring: disablePress,
              child: GestureDetector(
                onTap: () {
                  if (app.path != null) {
                    Navigator.of(context).pushNamed(app.path!);
                    return;
                  }
                },
                onLongPress: () {},
                child: AspectRatio(
                  aspectRatio: (app.width) / app.height,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ImageWidget(
                          app.backgroundImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (enableRemoveIcon)
                        Positioned(
                          left: -10,
                          top: -10,
                          child: GestureDetector(
                            onTap: onRemoved,
                            behavior: HitTestBehavior.opaque,
                            child: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 10,
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (app.title.isNotEmpty) const SizedBox(height: 5),
          if (app.title.isNotEmpty)
            Text(
              app.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleSmall!.copyWith(
                color: textColor ?? AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}

class AppWidgetBuilder extends AppWidget {
  const AppWidgetBuilder({
    super.key,
    required super.app,
    required this.controller,
    required super.onRemoved,
  });

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) {
        if (app.id == 'wg_clock') {
          return const ClockWidget();
        }
        if (app.id == 'wg_weather') {
          return WeatherWidget(key: key);
        }

        if (app is DashBoardGroupItem) {
          if(controller.enableEditMode) {
            return AppIconAnimation(
              child: AppGroupWidget(app: app),
            );
          }
          return AppGroupWidget(app: app);
        }

        if (controller.enableEditMode) {
          return AppIconAnimation(
            child: AppWidget(
              app: app,
              enableRemoveIcon: controller.enableEditMode,
              onRemoved: onRemoved,
            ),
          );
        }
        return AppWidget(
          app: app,
          enableRemoveIcon: controller.enableEditMode,
          onRemoved: onRemoved,
        );
      },
    );
  }
}
