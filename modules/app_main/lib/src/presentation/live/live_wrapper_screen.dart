import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/live_channel_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/live_create_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/state/live_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveDataProvider extends InheritedWidget {
  final LiveCreateController controller;

  const LiveDataProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class LiveWrapperScreen extends StatefulWidget {
  const LiveWrapperScreen({
    super.key,
    this.isCreated = false,
  });

  final bool isCreated;

  static const String routerName = '/live';

  @override
  State<LiveWrapperScreen> createState() => _LiveWrapperScreenState();
}

class _LiveWrapperScreenState extends State<LiveWrapperScreen> {
  late final LiveCreateController controller = getIt<LiveCreateController>();

  @override
  Widget build(BuildContext context) {
    if (widget.isCreated) {
      return LiveDataProvider(
        controller: controller,
        child: Obx(() {
          if (controller.isCreated.value) {
            return const LiveChannelScreen();
          }
          return const LiveCreateScreen();
        }),
      );
    }
    return const LiveChannelScreen();
  }
}
