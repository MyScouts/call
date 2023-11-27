import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
class LiveHeartButton extends StatelessWidget {
  const LiveHeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Ink(
        height: 60,
        width: 60,
        child: ImageWidget(IconAppConstants.icLiveHeart),
      ),
    );
  }
}
