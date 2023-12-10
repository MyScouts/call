import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ui/ui.dart';
// ignore: depend_on_referenced_packages
import 'package:share_plus/share_plus.dart';

class QrCodeScreen extends StatefulWidget {
  static const String routeName = 'qr-code';
  final User userInfo;
  const QrCodeScreen({
    super.key,
    required this.userInfo,
  });

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  late File? _file;
  final ScreenshotController _screenshotCtrl = ScreenshotController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () => _initFile());
  }

  Future _initFile() async {
    _file = await _convertFile(init: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageWidget(
            ImageConstants.bgQrCode,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top,
            bottom: 30,
            child: _buildContent(),
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Container(
      padding: const EdgeInsets.only(
        left: paddingHorizontal,
        right: paddingHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCloseButton(
            alignment: Alignment.centerLeft,
            onPressed: () => Navigator.of(context).pop(),
            color: AppColors.white,
          ),
          const SizedBox(height: 50),
          _buildQrCode(),
          const Spacer(),
          _buildAction(),
        ],
      ),
    );
  }

  _buildQrCode() {
    return Screenshot(
      controller: _screenshotCtrl,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      QrImageView(
                        data: jsonEncode({
                          'type': 'diary',
                          'id': widget.userInfo.id,
                        }),
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width * .5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.userInfo.getdisplayName,
                        style: context.textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.white, width: 5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ImageWidget(
                      ImageConstants.defaultUserAvatar,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildAction() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final file = await _convertFile();
              await ImageGallerySaver.saveFile(file.path,
                  isReturnPathOfIOS: true);
              showToastMessage("Lưu mã QR thành công");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Lưu vào máy",
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              _file ??= await _convertFile();
              await Share.shareXFiles([XFile(_file!.path)]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Chia sẻ",
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _convertFile({bool init = false}) async {
    try {
      final image = await _screenshotCtrl.capture(
          delay: const Duration(milliseconds: 10));
      final directory = await getTemporaryDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(image!);
      return imagePath;
    } catch (e) {
      if (!init) {
        showToastMessage("Thao tác không thành công.", ToastMessageType.error);
      }
    }
  }
}
