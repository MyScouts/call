import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../upgrade_ja/widgets/gradiant_button.dart';

class UploadFrontFaceWidget extends StatelessWidget {
  final String imgFront;
  final String? uploadedImg;
  final String textBtn;
  final VoidCallback onTap;

  const UploadFrontFaceWidget({
    super.key,
    required this.imgFront,
    required this.textBtn,
    required this.onTap,
    this.uploadedImg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(22),
          padding: const EdgeInsets.all(22),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff5A7EEF),
                Color(0xff8BFFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: uploadedImg == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageWidget(ImageConstants.previewPerson),
                    Padding(
                      padding: const EdgeInsets.only(top: 80, right: 80),
                      child: ImageWidget(imgFront, width: 92),
                    ),
                  ],
                )
              : AspectRatio(
                  aspectRatio: 2,
                  child: ImageWidget(uploadedImg!, borderRadius: 10),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 44),
          child: GradiantButton(
            onPressed: onTap,
            height: 39,
            child: Center(
              child: Text(
                textBtn,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
