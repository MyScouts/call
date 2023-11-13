import 'package:app_core/app_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class AppAvatarWidget extends StatelessWidget {
  final String? avatar;
  final String? defaultAvatar;
  final double radius;
  final double height;
  final double width;
  const AppAvatarWidget({
    super.key,
    this.avatar,
    this.defaultAvatar,
    this.height = 35,
    this.width = 35,
    this.radius = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.primaryColor),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: avatar ?? '',
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return ImageWidget(
              defaultAvatar ?? ImageConstants.defaultAvatar,
              borderRadius: radius,
            );
          },
        ),
      ),
    );
  }
}
