import 'package:app_main/src/app_dimens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleNetworkImage extends StatelessWidget {
  const CircleNetworkImage({
    super.key,
    required this.url,
    required this.size,
    this.border,
    this.isIgnoreCache = false,
    this.defaultImage
  });

  final String url;
  final Border? border;
  final bool isIgnoreCache;
  final double size;
  final Widget? defaultImage;

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
                        const SizedBox.shrink(),
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: url,
                        cacheKey: '$url-$imageSize',
                        maxWidthDiskCache: imageSize,
                        errorWidget: (context, url, error) =>
                            const SizedBox.shrink(),
                      ),
          ),
        ),
      ),
    );
  }
}
