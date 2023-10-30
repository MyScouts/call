import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../upgrade_ja/widgets/gradiant_button.dart';

class ImageWithUploadButtonWidget extends StatelessWidget {
  final String img;
  final String textBtn;
  final VoidCallback onTap;
  final double btnHeight;
  final double imgHeight;
  final double fontSizeBtn;

  const ImageWithUploadButtonWidget({
    super.key,
    required this.img,
    required this.textBtn,
    required this.onTap,
    this.btnHeight = 28,
    this.fontSizeBtn = 10,
    this.imgHeight = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: imgHeight,
          child: ImageWidget(img, borderRadius: 10),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: GradiantButton(
            onPressed: onTap,
            height: btnHeight,
            child: Text(
              textBtn,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.white, fontSize: fontSizeBtn),
            ),
          ),
        )
      ],
    );
  }
}
