import 'package:app_main/app_main.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_group_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_base_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/widget/clock_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/live_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/live_widget_2.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_banner_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/widget_team.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'app_icon_animation.dart';

class AppWidget extends StatelessWidget {
  final DashBoardItem app;
  final bool fromAppStore;

  const AppWidget({
    super.key,
    required this.app,
    this.textColor,
    this.disablePress = false,
    this.enableRemoveIcon = false,
    this.onRemoved,
    this.fromAppStore = false,
    this.onAdd,
  });

  final Color? textColor;
  final bool disablePress;
  final bool enableRemoveIcon;
  final Function()? onRemoved;
  final Function()? onAdd;

  bool get authenticate => isAuthenticate.value;

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
                  if (authenticate) {
                    if (enableRemoveIcon) return;
                    context.handleStartAppWidget(id: app.id, path: app.path);
                    return;
                  }
                  context.requiredLogin();
                  return;
                },
                child: Builder(
                  builder: (_) {
                    Widget child = Stack(
                      clipBehavior: Clip.none,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Color.fromRGBO(0, 0, 0, 0.20),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ImageWidget(
                              app.backgroundImage,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (enableRemoveIcon && !fromAppStore)
                          Positioned(
                            left: -10,
                            top: -10,
                            child: GestureDetector(
                              onTap: onRemoved,
                              behavior: HitTestBehavior.opaque,
                              child: const SizedBox.square(
                                dimension: 25,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 15,
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (enableRemoveIcon && fromAppStore && onAdd == null)
                          Positioned(
                            right: -15,
                            top: -20,
                            child: GestureDetector(
                              onTap: onRemoved,
                              behavior: HitTestBehavior.opaque,
                              child: const SizedBox.square(
                                dimension: 40,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xffFF3B30),
                                    radius: 10,
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (enableRemoveIcon && fromAppStore && onAdd != null)
                          Positioned(
                            right: -15,
                            top: -20,
                            child: GestureDetector(
                              onTap: onAdd,
                              behavior: HitTestBehavior.opaque,
                              child: const SizedBox.square(
                                dimension: 40,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff00D379),
                                    radius: 10,
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );

                    if (app.id.contains('banner')) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: child,
                      );
                    }

                    return AspectRatio(
                      aspectRatio: (app.width) / app.height,
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ),
          if (app.title.isNotEmpty) const SizedBox(height: 5),
          if (app.title.isNotEmpty)
            AutoSizeText(
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
          return ClockWidget(
            enableRemoveIcon: controller.enableEditMode,
            onRemoved: onRemoved,
          );
        }
        if (app.id == 'wg_weather') {
          return WeatherWidget(
            key: key,
            enableEditMode: controller.enableEditMode,
            onRemoved: onRemoved,
          );
        }

        if (app.id == 'wg_live_1') {
          return const LiveWidget(enableEditMode: false);
        }

        if (app.id == 'wg_live_2') {
          return const LiveWidget2(enableEditMode: false);
        }

        if (app.id == 'wg_team') {
          return const WidgetTeam(enableEditMode: false);
        }

        if (app.id == 'wg_weather_banner') {
          return WeatherBannerWidget(
            enableEditMode: controller.enableEditMode,
            onRemoved: onRemoved,
          );
        }

        if (app is DashBoardGroupItem) {
          if (controller.enableEditMode) {
            return AppIconAnimation(
              child: AppGroupWidget(app: app),
            );
          }
          return AppGroupWidget(app: app);
        }

        if (app.id == "wg_banner") {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppWidget(
              app: app,
              enableRemoveIcon: controller.enableEditMode,
              onRemoved: onRemoved,
            ),
          );
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

class AppWidgetGroupBuilder extends AppWidget {
  const AppWidgetGroupBuilder({
    super.key,
    required super.app,
    required super.onRemoved,
    this.enableEditMode = false,
  });

  final bool enableEditMode;

  @override
  Widget build(BuildContext context) {
    if (app.id == 'wg_clock') {
      return const ClockWidget();
    }
    if (app.id == 'wg_weather') {
      return WeatherWidget(
        key: key,
        enableEditMode: false,
      );
    }

    if (app.id == 'wg_live_1') {
      return const LiveWidget(enableEditMode: false);
    }

    if (app.id == 'wg_weather_banner') {
      return const WeatherBannerWidget();
    }

    if (app is DashBoardGroupItem) {
      if (enableEditMode) {
        return AppIconAnimation(
          child: AppGroupWidget(app: app),
        );
      }
      return AppGroupWidget(app: app);
    }

    if (enableEditMode) {
      return AppIconAnimation(
        child: AppWidget(
          app: app,
          enableRemoveIcon: enableEditMode,
          onRemoved: onRemoved,
        ),
      );
    }
    return AppWidget(
      app: app,
      enableRemoveIcon: enableEditMode,
      onRemoved: onRemoved,
    );
  }
}

class AppStoreWidgetBuilder extends AppWidget {
  const AppStoreWidgetBuilder({
    super.key,
    required super.app,
    required super.onRemoved,
    this.enableEditMode = false,
    super.onAdd,
  });

  final bool enableEditMode;

  @override
  Widget build(BuildContext context) {
    if (enableEditMode) {
      return AppIconAnimation(
        child: AppWidget(
          app: app,
          enableRemoveIcon: enableEditMode,
          onRemoved: onRemoved,
          fromAppStore: true,
          onAdd: onAdd,
        ),
      );
    }
    return AppWidget(
      app: app,
      enableRemoveIcon: enableEditMode,
      onRemoved: onRemoved,
      fromAppStore: true,
      onAdd: onAdd,
    );
  }
}
