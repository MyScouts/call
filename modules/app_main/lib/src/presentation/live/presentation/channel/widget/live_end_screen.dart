import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_tab/live_controller.dart';
import 'package:app_main/src/presentation/live/presentation/widget/live_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';

import '../../../../community/widgets/circle_image.dart';

class LiveEndScreen extends StatefulWidget {
  const LiveEndScreen({super.key});

  @override
  State<LiveEndScreen> createState() => _LiveEndScreenState();
}

class _LiveEndScreenState extends State<LiveEndScreen> {
  final listController = getIt<LiveController>();

  late final controller = context.read<LiveChannelController>();

  @override
  void initState() {
    listController.getListLive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final host = controller.members.value.firstWhereOrNull((e) => e.isOwner);

    return Stack(
      children: [
        Positioned.fill(
          child: ClipRect(
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: CachedNetworkImage(
                imageUrl: controller.info.medias.first.link,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: CloseButton(color: Colors.white),
              ),
              const Text(
                'Phiên Live đã kết thúc',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    _printDuration(
                        DateTime.now().difference(controller.info.createdAt)),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 17),
              if (host == null || host.info.avatar.trim().isEmpty)
                Align(
                  alignment: Alignment.center,
                  child: SizedBox.square(
                    dimension: 65,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(65 / 2),
                      child: ImageWidget(
                        ImageConstants.defaultUserAvatar,
                      ),
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.center,
                  child: CircleNetworkImage(
                    url: host.info.avatar,
                    size: 65,
                  ),
                ),
              const SizedBox(height: 17),
              Text(
                host?.info.name ?? 'Người dùng',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Obx(() {
                final lives = listController.live.value.lives ?? [];
                final reLives =
                    lives.where((e) => e.id != controller.info.id).toList();
                if (reLives.isNotEmpty) {
                  return Column(
                    children: [
                      const Text(
                        'Có thể bạn thích',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffB5B5B5),
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 17),
                      GridView.count(
                        padding: const EdgeInsets.all(16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        children: reLives.take(4).map<Widget>((e) {
                          return LiveWidget(
                            call:  Navigator.of(context).pop,
                            liveDetail: e,
                            viewer: listController.listLiveCount
                                    .firstWhereOrNull(
                                        (element) => element.liveId == e.id!)
                                    ?.memberCount ??
                                0,
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              }),
            ],
          ),
        )
      ],
    );
  }
}

String _printDuration(Duration duration) {
  String negativeSign = duration.isNegative ? '-' : '';
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
