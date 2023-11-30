//import 'dart:developer' as developer;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class AvatarMemberWidget extends StatelessWidget {
  final String avatar;
  final double size;
  const AvatarMemberWidget({super.key, required this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ImageWidget(
        avatar,
        borderRadius: 100,
        width: size,
        height: size,
        errorWidget: ImageWidget(
          ImageConstants.defaultAvatar,
          borderRadius: 100,
        ),
      ),
    );
  }
}
