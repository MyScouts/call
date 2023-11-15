import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
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
  final ValueNotifier<String?> _result = ValueNotifier(null);
  final ValueNotifier<bool> _flashCtrl = ValueNotifier(false);
  Scanner.QRViewController? controller;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    _result.addListener(() {
      if (_result.value != null) {
        controller?.dispose();
        final code = _result.value!;
        if (code.isJSON() && jsonDecode(code) is! int) {
          final data = jsonDecode(code);
          if (data['type'] == 'diary' && data["id"] != null) {
            context.startReplaceDiary(userId: data["id"].toString());
            return;
          }

          if (data['type'] == 'team' && data["id"] != null) {
            context.startTeamDetailFromQR(
              id: data["id"],
              bossGroupId: data['bossGroupId'],
              name: data['name'],
            );
            return;
          }

          if ([QrCodeScanType.registerCustomer, QrCodeScanType.registerMarshop]
              .contains(widget.type)) {
            Navigator.pop(context, data['marshopId'].toString());
            return;
          }

          if (data['type'] == 'auth1') {
            context.confirmLoginQrCode(
              type: AuthClaimType.v1,
              code: data['code'],
            );
            return;
          }

          if (data['type'] == 'auth2') {
            context.confirmLoginQrCode(
              type: AuthClaimType.v2,
              code: data['code'],
              marshopId: data['marshopId'].toString(),
            );
            return;
          }
        } else {
          if ((code.toString().contains("_auth1") ||
              code.toString().contains("_auth2"))) {
            AuthClaimType type = code.toString().contains("_auth2")
                ? AuthClaimType.v2
                : AuthClaimType.v1;
            context.confirmLoginQrCode(
              type: type,
              code: code
                  .toString()
                  .replaceAll("_auth1", "")
                  .replaceAll("_auth2", ""),
            );
            return;
          }
          Navigator.pop(context, code);
        }
      }
    });
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
    controller.scannedDataStream.listen((scanData) async {
      _result.value = null;
      Future.delayed(const Duration(seconds: 2));
      _result.value = scanData.code;
      return;
    });
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
                    _result.value = result.text;
                  }
                }
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
}
