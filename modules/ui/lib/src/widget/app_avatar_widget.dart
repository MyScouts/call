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
  final bool isPDone;
  const AppAvatarWidget({
    super.key,
    this.avatar,
    this.defaultAvatar,
    this.height = 35,
    this.width = 35,
    this.radius = 100,
    this.isPDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.primaryColor, width: 2),
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
        ),
        if (isPDone)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: context.theme.primaryColor,
              ),
              child: Text(
                "P",
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall!.copyWith(
                  color: AppColors.white,
                  height: 0,
                  fontSize: 11,
                ),
              ),
            ),
          )
      ],
    );
  }
}
