import 'dart:async';

import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/join_channel_provider.dart';
import 'package:app_main/src/presentation/live/presentation/create/live_create_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/state/live_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LiveDataProvider(
      controller: controller,
      child: Obx(() {
        if (controller.isCreated.value) {
          return Stack(
            fit: StackFit.expand,
            children: [
              if (controller.password != null)
                JoinChannelPasswordProvider(
                  liveID: controller.id!,
                  password: controller.password!,
                )
              else
                JoinChannelProvider(liveID: controller.id!),
              if (controller.isStartStream.value)
                _StartLive(
                  onEnd: () {
                    controller.endStartStream();
                  },
                ),
            ],
          );
        }
        return const LiveCreateScreen();
      }),
    );
  }
}

class _StartLive extends StatefulWidget {
  const _StartLive({super.key, required this.onEnd});

  final VoidCallback onEnd;

  @override
  State<_StartLive> createState() => _StartLiveState();
}

class _StartLiveState extends State<_StartLive> {
  Timer? _timer;

  int end = 3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => start());
  }

  void start() {
    if (_timer != null) _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (end <= 0) {
        _timer?.cancel();
        widget.onEnd();
        return;
      }
      if (mounted) {
        setState(() {
          end -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: ColoredBox(
          color: Colors.black.withOpacity(0.2),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Livestream sẽ bắt đầu trong',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  end.toString(),
                  style: const TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
