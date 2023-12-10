//import 'dart:developer' as developer;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AvatarMemberWidget extends StatelessWidget {
  final String avatar;
  final double size;
  final bool? isPDone;
  const AvatarMemberWidget({super.key, required this.avatar, required this.size, this.isPDone});

  @override
  Widget build(BuildContext context) {
    return AppAvatarWidget(
      avatar: avatar,
      width: size,
      height: size,
      isPDone: isPDone ?? false,
    );
  }
}
