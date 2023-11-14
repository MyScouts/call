import 'package:app_main/src/app_dimens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class CircleNetworkImage extends StatelessWidget {
  const CircleNetworkImage({
    super.key,
    required this.url,
    required this.size,
    this.border,
    this.isIgnoreCache = false,
    this.defaultImage,
    this.errorUrl,
  });

  final String url;
  final Border? border;
  final bool isIgnoreCache;
  final double size;
  final Widget? defaultImage;
  final String? errorUrl;

  @override
  Widget build(BuildContext context) {
    final imageSize = (size * pixelRatio).round();
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        border: border,
        color: Colors.grey,
      ),
      child: SizedBox.square(
        dimension: size,
        child: Padding(
          padding: EdgeInsets.all(
            border != null ? (border?.dimensions.horizontal ?? 0) / 2 : 0.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: url.isEmpty
                ? defaultImage ?? const SizedBox.shrink()
                : isIgnoreCache
                    ? Image.network(
                        url,
                        width: size,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            ImageWidget(
                          errorUrl ?? ImageConstants.defaultAvatar,
                          borderRadius: 100,
                        ),
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: url,
                        cacheKey: '$url-$imageSize',
                        maxWidthDiskCache: imageSize,
                        errorWidget: (context, error, stackTrace) =>
                            ImageWidget(
                          errorUrl ?? ImageConstants.defaultAvatar,
                          borderRadius: 100,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
