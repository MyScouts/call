import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ui/ui.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQrCodeScanScreen extends StatefulWidget {
  static const String routeName = 'qr-code-scan';
  const ScanQrCodeScanScreen({super.key});

  @override
  State<ScanQrCodeScanScreen> createState() => _ScanQrCodeScanScreenState();
}

class _ScanQrCodeScanScreenState extends State<ScanQrCodeScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQRWrapper(),
          Positioned(
            top: context.paddingTop,
            left: paddingHorizontal,
            right: paddingHorizontal,
            child: _buildHeader(),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      final code = scanData.code;
      if (code is String) {
        final data = jsonDecode(code) as Map<String, dynamic>;
        if (data['type'] == 'diary' && data["id"] != null) {
          print(data);
          context.startDiary(userId: data["id"]);
        }
      } else {
        Navigator.pop(context, scanData.code);
      }
      controller.dispose();
      return;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: CustomCloseButton(
          onPressed: () => Navigator.pop(context),
          alignment: Alignment.centerLeft,
          color: AppColors.white,
        )),
        Text(
          "Quét mã QR",
          style: context.text.titleLarge!.copyWith(color: AppColors.white),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.photo_library_outlined,
                color: AppColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildQRWrapper() {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
        ),
      ],
    );
  }
}
