import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class LiveRoseButton extends StatelessWidget {
  const LiveRoseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Ink(
        height: 50,
        width: 50,
        child: ImageWidget(IconAppConstants.icLiveRose),
      ),
    );
  }
}
