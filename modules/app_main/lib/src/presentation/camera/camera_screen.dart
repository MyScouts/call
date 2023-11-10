import 'dart:typed_data';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:camera/camera.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CameraScreen extends StatefulWidget {
  static const String routeName = 'camera';
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // CameraController? controller;
  // late List<CameraDescription> _cameras;
  // final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  // final textRecognizer = GoogleMlKit.vision.textRecognizer();

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    // _cameras = await availableCameras();
    // controller = CameraController(
    //   _cameras[0],
    //   ResolutionPreset.max,
    //   enableAudio: false,
    //   imageFormatGroup: ImageFormatGroup.yuv420,
    // );
    // controller!.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   controller!.setFlashMode(FlashMode.off);
    //   controller!.startImageStream((CameraImage availableImage) {
    //     processCameraImage(availableImage);
    //   });
    //   setState(() {});
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         // Handle access errors here.
    //         break;
    //       default:
    //         // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
  }

  Future<void> processCameraImage(CameraImage image) async {
    try {
      print(image);
    } catch (e) {
      print("Error processing image: $e");
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
    return Container();
    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         const Spacer(),
    //         if (controller != null)
    //           Container(
    //             alignment: Alignment.center,
    //             height: MediaQuery.of(context).size.height * 0.5,
    //             child: CustomPaint(
    //               // foregroundPainter: BorderPainter(),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: AspectRatio(
    //                   aspectRatio: 2 / 3,
    //                   child: CameraPreview(controller!),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         const SizedBox(height: 50),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Tự động chụp",
    //               style: context.textTheme.titleSmall!.copyWith(
    //                 color: context.theme.primaryColor,
    //               ),
    //             ),
    //             SizedBox(
    //               child: CupertinoSwitch(
    //                 activeColor: context.theme.primaryColor,
    //                 value: false,
    //                 onChanged: (value) {},
    //               ),
    //             )
    //           ],
    //         ),
    //         const SizedBox(height: 20),
    //         GestureDetector(
    //           onTap: () async {
    //             XFile file = await controller!.takePicture();
    //             Future.delayed(const Duration(milliseconds: 200), () {
    //               context.startCameraResult(file: file);
    //               // Navigator.pop(context, file);
    //             });
    //           },
    //           child: Container(
    //             width: 70,
    //             height: 70,
    //             padding: const EdgeInsets.all(5),
    //             decoration: BoxDecoration(
    //               color: AppColors.white,
    //               borderRadius: BorderRadius.circular(90),
    //               border: Border.all(
    //                 color: context.theme.primaryColor,
    //                 width: 1,
    //               ),
    //             ),
    //             child: Container(
    //                 decoration: BoxDecoration(
    //                   color: context.theme.primaryColor,
    //                   borderRadius: BorderRadius.circular(90),
    //                 ),
    //                 child: const Icon(
    //                   Icons.camera_alt,
    //                   color: AppColors.white,
    //                   size: 30,
    //                 )),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height + 20;
    double sw = size.width + 20;
    double cornerSide = 10;

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(50, -10)
      ..quadraticBezierTo(-30, -10, -20, 50)
      ..moveTo(-20, sh - cornerSide)
      ..quadraticBezierTo(-20, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
