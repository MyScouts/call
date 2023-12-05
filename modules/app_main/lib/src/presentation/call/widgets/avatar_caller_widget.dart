//import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class AvatarCallerWidget extends StatelessWidget {
  final String? avatar;
  final double size;
  const AvatarCallerWidget({super.key, this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: avatar ?? '',
          errorWidget: (_, __, ___) => ImageWidget(
            ImageConstants.defaultUserAvatar,
            borderRadius: 100,
          ),
        ),
      ),
    );
  }
}
