import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_constants.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' as Scanner;
import 'package:ui/ui.dart';

import '../../blocs/user/user_cubit.dart';

class ScanQrCodeScanScreen extends StatefulWidget {
  static const String routeName = 'qr-code-scan';
  final bool showMyQr;
  final QrCodeScanType? type;
  const ScanQrCodeScanScreen({
    super.key,
    this.showMyQr = true,
    this.type,
  });

  @override
  State<ScanQrCodeScanScreen> createState() => _ScanQrCodeScanScreenState();
}

class _ScanQrCodeScanScreenState extends State<ScanQrCodeScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late final userCubit = context.read<UserCubit>();
  late User _authInfo;
  final ValueNotifier<bool> _flashCtrl = ValueNotifier(false);
  Scanner.QRViewController? controller;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
  }

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
          Positioned(
            right: 0,
            left: 0,
            bottom: 100,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  controller?.toggleFlash();
                  _flashCtrl.value = (await controller!.getFlashStatus())!;
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: _flashCtrl,
                    builder: (context, value, child) {
                      return Icon(
                        value
                            ? Icons.flashlight_on_sharp
                            : Icons.flashlight_off_sharp,
                        color: AppColors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (widget.showMyQr)
            Positioned(
                bottom: 20,
                left: paddingHorizontal,
                right: paddingHorizontal,
                child: GestureDetector(
                  onTap: () => context.startQrCode(userInfo: _authInfo),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageWidget(IconAppConstants.icQrCode),
                        const SizedBox(width: 5),
                        Text(
                          "Mã QR của tôi",
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.theme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
        ],
      ),
    );
  }

  void _onQRViewCreated(Scanner.QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) => _handleListener(scanData.code),
    );
  }

  void _onPermissionSet(
      BuildContext context, Scanner.QRViewController ctrl, bool p) {
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
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  final decoder =
                      QRCodeDartScanDecoder(formats: [BarcodeFormat.QR_CODE]);
                  Result? result = await decoder.decodeFile(image);
                  if (result != null) {
                    return _handleListener(result.text);
                  }
                }
                showToastMessage("Mã QR không hợp lệ", ToastMessageType.error);
              },
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
          child: Scanner.QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: Scanner.QrScannerOverlayShape(
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

  _handleListener(String? code) {
    if (code == null) return;
    controller?.pauseCamera();
    if (code.isJSON() && jsonDecode(code) is! int) {
      final data = jsonDecode(code);
      if (data['type'] == 'diary' && data["id"] != null) {
        return _validationRoute([], () {
          context.startReplaceDiary(userId: data["id"].toString());
        });
      }

      if (data['type'] == 'team' && data["id"] != null) {
        return _validationRoute([], () {
          context.startTeamDetailFromQR(
            id: data["id"],
            bossGroupId: data['bossGroupId'],
            name: data['name'],
          );
        });
      }

      if ([QrCodeScanType.registerCustomer, QrCodeScanType.registerMarshop]
          .contains(widget.type)) {
        return _validationRoute(
            [QrCodeScanType.registerCustomer, QrCodeScanType.registerMarshop],
            () {
          Navigator.pop(context, data['marshopId'].toString());
        });
      }

      if (data['type'] == 'auth1') {
        return _validationRoute([], () {
          context.confirmLoginQrCode(
            type: AuthClaimType.v1,
            code: data['code'],
            pDoneId: data['pDoneId'] ?? "",
          );
        });
      }

      if (data['type'] == 'auth2') {
        return _validationRoute([], () {
          context.confirmLoginQrCode(
            type: AuthClaimType.v2,
            code: data['code'],
            marshopId: data['marshopId'].toString(),
            pDoneId: data['pDoneId'] ?? "",
          );
        });
      }
    }
    showToastMessage("Mã QR không hợp lệ", ToastMessageType.error);
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        controller?.resumeCamera();
      },
    );
  }

  _validationRoute(List<QrCodeScanType> types, Function callback) {
    if (widget.type == null ||
        types.isNotEmpty && types.contains(widget.type)) {
      return callback();
    }
    showToastMessage("Mã QR không hợp lệ", ToastMessageType.error);
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        controller?.resumeCamera();
      },
    );
    return true;
  }
}
