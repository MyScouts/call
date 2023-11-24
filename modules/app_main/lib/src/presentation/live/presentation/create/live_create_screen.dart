import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_type.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/state/live_create_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';

class LiveCreateScreen extends StatefulWidget {
  const LiveCreateScreen({super.key});

  @override
  State<LiveCreateScreen> createState() => _LiveCreateScreenState();
}

class _LiveCreateScreenState extends State<LiveCreateScreen> {
  late final LiveCreateController controller;
  LiveType _type = LiveType.public;
  String _title = '';
  List<LiveCategoryDetail> _cates = [];
  MediaFile? _file;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller =
        context.findAncestorWidgetOfExactType<LiveDataProvider>()!.controller;
  }

  void createLive() async {
    context.showLoading();
    final data = await controller.createLive({
      'title': _title,
      'type': _type.name,
      if (_type.isPasswordLocked) 'password': "haha",
      'categoryIds': _cates.map((e) => e.id).toList(),
    });
    if (mounted) {
      context.hideLoading();
    }
    if (data != null) {
      controller.startStream();
    }
  }

  void mediaPicker() async {
    final files = await getIt<MediaPicker>().pickImagesFromGallery();
    if (files == null) return;
    if (files.isEmpty) return;
    _file = files.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.state.value == LiveCreateState.loading) {
          return const Center(
            child: PlatformLoadingIndicator(size: 30),
          );
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            const _RtcRender(),
            Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRect(
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaY: 5,
                                  sigmaX: 5,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        if (_file == null)
                                          GestureDetector(
                                            onTap: mediaPicker,
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              width: 56,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  4.0,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        if (_file != null)
                                          GestureDetector(
                                            onTap: mediaPicker,
                                            behavior: HitTestBehavior.opaque,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Image.file(
                                                File(_file!.path),
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 40,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  context.showTitleInput(
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _title = value;
                                                      });
                                                    },
                                                    title: _title,
                                                  );
                                                },
                                                behavior:
                                                    HitTestBehavior.opaque,
                                                child: Text(
                                                  _title.trim().isEmpty
                                                      ? 'Tiêu đề phát trực tiếp'
                                                      : _title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    height: 1.2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            GestureDetector(
                                              onTap: () {
                                                context.showLiveTypePicker(
                                                  onChanged: (type) {
                                                    setState(() {
                                                      _type = type;
                                                    });
                                                  },
                                                  type: _type,
                                                );
                                              },
                                              behavior: HitTestBehavior.opaque,
                                              child: _LiveType(type: _type),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                context.showCategoryPicker(
                                  categories: _cates,
                                  onChanged: (cate) {
                                    setState(() {
                                      _cates = cate;
                                    });
                                  },
                                );
                              },
                              behavior: HitTestBehavior.opaque,
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ui.ImageFilter.blur(
                                    sigmaY: 5,
                                    sigmaX: 5,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            _cates.isNotEmpty
                                                ? _cates
                                                    .take(3)
                                                    .map((e) => e.name)
                                                    .join(', ')
                                                : 'Chọn chủ đề livestream',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                        const RotatedBox(
                                          quarterTurns: 2,
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CloseButton(color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                child: GestureDetector(
                  onTap: () {
                    if (_title.trim().isEmpty) {
                      showToastMessage(
                        'Vui lòng nhập tiêu đề',
                        ToastMessageType.error,
                      );
                      return;
                    }
                    if (_cates.isEmpty) {
                      showToastMessage(
                        'Vui lòng chọn chủ đề',
                        ToastMessageType.error,
                      );
                      return;
                    }
                    if (_title.trim().isEmpty) {
                      showToastMessage(
                        'Vui lòng nhập tiêu đề',
                        ToastMessageType.error,
                      );
                      return;
                    }

                    createLive();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 70,
                        child: ImageWidget(IconAppConstants.icCreateLive),
                      ),
                      const Text(
                        'Tạo Live',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _LiveType extends StatelessWidget {
  const _LiveType({super.key, required this.type});

  final LiveType type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: const Color(0xff8C8C8C)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.5),
        child: Row(
          children: [
            ImageWidget(type.pathImage, color: Colors.white),
            const SizedBox(width: 4.5),
            Text(
              type.text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(width: 6),
            ImageWidget(IconAppConstants.icArrowDown),
          ],
        ),
      ),
    );
  }
}

class _RtcRender extends StatelessWidget {
  const _RtcRender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        context.findAncestorWidgetOfExactType<LiveDataProvider>()!.controller;

    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: controller.service.engine,
        canvas: const VideoCanvas(
          uid: 0,
          renderMode: RenderModeType.renderModeHidden,
        ),
      ),
    );
  }
}
