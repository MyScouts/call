import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.avatar,
    this.isPDone = false,
    this.isAds = false,
    this.size = 42,
    this.showBorder = true,
    this.iconBottom,
    this.isStar = false,
    this.borderSize = 1.0,
    this.shape = BoxShape.circle,
    this.cacheWidth,
    this.cacheHeight,
    this.borderColor,
    this.iconBottomSize,
  });

  final String? avatar;
  final bool isPDone;
  final bool isAds;
  final bool isStar;
  final bool showBorder;
  final String? iconBottom;
  final double size;
  final double borderSize;
  final BoxShape shape;
  final Color? borderColor;
  final double? iconBottomSize;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    final image =
        (avatar?.isNotEmpty ?? false) ? avatar! : ImageConstants.defaultAvatar;
    final paddingRight = isStar ? 3.0 : 0.0;
    final paddingTop = isStar ? 6.0 : 0.0;

    return SizedBox(
      width: size + paddingRight,
      height: size + paddingTop,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: paddingTop, right: paddingRight),
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: shape,
              border: Border.all(
                width: borderSize,
                color: borderColor ?? Theme.of(context).primaryColor,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: SizedBox(
                width: size,
                height: size,
                child: ImageWidget(
                  image,
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                  cacheHeight: cacheHeight,
                  cacheWidth: cacheWidth,
                ),
              ),
            ),
          ),
          if (iconBottom?.isNotEmpty ?? false)
            Padding(
              padding: EdgeInsets.only(right: paddingRight),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ImageWidget(
                  iconBottom!,
                  width: size * 0.5,
                  height: size * 0.5,
                ),
              ),
            )
          else if (isPDone)
            Padding(
              padding: EdgeInsets.only(right: paddingRight),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ImageWidget(
                  isAds ? IconAppConstants.proAds : IconAppConstants.pro,
                  width: size * 0.35,
                  height: size * 0.35,
                ),
              ),
            ),
          if (isStar)
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 18,
                height: 18,
                child: ImageWidget(
                  IconAppConstants.star,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
