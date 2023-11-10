import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraResultScreen extends StatefulWidget {
  final XFile file;
  static const String routeName = "camera-result";
  const CameraResultScreen({super.key, required this.file});

  @override
  State<CameraResultScreen> createState() => _CameraResultScreenState();
}

class _CameraResultScreenState extends State<CameraResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.file.path)),
    );
  }
}
