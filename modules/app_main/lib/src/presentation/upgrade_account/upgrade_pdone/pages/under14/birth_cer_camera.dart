import 'dart:io';
import 'dart:typed_data';

import 'package:app_core/app_core.dart';
import 'package:camera/camera.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ui/ui.dart';

class BirthCerCameraScreen extends StatefulWidget {
  const BirthCerCameraScreen({super.key});

  @override
  State<BirthCerCameraScreen> createState() => _BirthCerCameraScreenState();
}

class _BirthCerCameraScreenState extends State<BirthCerCameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  late List<CameraDescription> _cameras;
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  XFile? captureFile;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  initCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(
      _cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller!.setFlashMode(FlashMode.off);
      controller!.startImageStream((CameraImage availableImage) {
        processCameraImage(availableImage);
      });
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  Future<void> processCameraImage(CameraImage image) async {
    try {
      // print(image);
    } catch (e) {
      // print("Error processing image: $e");
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final bytes = planes.map((plane) => plane.bytes).toList();
    final allBytes =
        Uint8List(planes.fold(0, (count, plane) => count + plane.bytes.length));
    int offset = 0;

    for (final planeBytes in bytes) {
      allBytes.setRange(offset, offset + planeBytes.length, planeBytes);
      offset += planeBytes.length;
    }

    return allBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 36),
        child: captureFile == null ? _buildCam(context) : _buildResult(context),
      ),
    );
  }

  Widget _buildCam(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        if (controller != null)
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.5,
            child: CustomPaint(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: CameraPreview(controller!),
                ),
              ),
            ),
          ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tự động chụp",
              style: context.textTheme.titleSmall!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              child: CupertinoSwitch(
                activeColor: context.theme.primaryColor,
                value: false,
                onChanged: (value) {},
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () async {
            captureFile = await controller!.takePicture();
            Future.delayed(const Duration(milliseconds: 200), () {
              setState(() {});
            });
          },
          child: Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                color: context.theme.primaryColor,
                width: 1,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(90),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Image.file(
          File(captureFile!.path),
          height: MediaQuery.of(context).size.height*0.6,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Row(
            children: [
              Expanded(
                child: CommonOutlineButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      setState(() {
                        captureFile = null;
                      });
                    });
                  },
                  label: 'Chụp lại',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: PrimaryButton(
                  title: 'Đồng ý',
                  onTap: () {
                    Navigator.pop(context, captureFile);
                  },
                  disabled: false,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
