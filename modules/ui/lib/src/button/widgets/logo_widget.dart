import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.logo,
    required this.title,
    this.color,
    this.colorBorder,
    this.onTap,
    this.sizeLogo = const Size(50, 50),
    this.paddingLogo = const EdgeInsets.all(1.0),
    this.borderWidth = 2.0,
    this.isPdone = false,
    this.maxLines = 2,
    this.fit,
  });

  final String? logo;
  final String title;
  final Size sizeLogo;
  final Color? color;
  final Color? colorBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry paddingLogo;
  final double borderWidth;
  final bool isPdone;
  final int maxLines;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: color,
                  border: colorBorder == null
                      ? null
                      : Border.all(color: colorBorder!, width: borderWidth),
                ),
                padding: paddingLogo,
                child: ImageWidget(
                  (logo?.isNotEmpty ?? false)
                      ? logo!
                      : ImageConstants.defaultAvatar,
                  width: sizeLogo.width - paddingLogo.horizontal,
                  height: sizeLogo.height - paddingLogo.horizontal,
                  fit: fit ?? BoxFit.fitWidth,
                  borderRadius: sizeLogo.width / 2,
                ),
              ),
              // if (isPdone)
              //   Positioned(
              //     bottom: 0,
              //     right: 0,
              //     child: ImageWidget(
              //       IconConstants.pro,
              //       fit: fit ?? BoxFit.cover,
              //       width: sizeLogo.width * 0.35,
              //       height: sizeLogo.height * 0.35,
              //     ),
              //   ),
            ],
          ),
          const SizedBox(height: 5),
          if (title.isNotEmpty)
            Text(
              title,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Colors.black.withOpacity(0.88),
                  ),
            ),
        ],
      ),
    );
  }
}
