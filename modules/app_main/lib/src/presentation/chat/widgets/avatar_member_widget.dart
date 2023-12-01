//import 'dart:developer' as developer;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AvatarMemberWidget extends StatelessWidget {
  final String avatar;
  final double size;
  const AvatarMemberWidget({super.key, required this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: AvatarWidget(
        avatar: avatar,
        size: size,

      ),
    );
  }
}
