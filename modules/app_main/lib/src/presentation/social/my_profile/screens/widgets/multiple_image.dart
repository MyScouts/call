import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum ImageInputType { asset, network, file }

typedef SizeMoreBuilder = Widget Function(int sizeMore);

class CommonMultiImageView extends StatelessWidget {
  const CommonMultiImageView._({
    required this.images,
    required this.imageInputType,
    this.width,
    this.height,
    this.boxShape,
    this.radius,
    this.sizeMoreBuilder,
    this.onTapImage1,
    this.onTapImage2,
    this.onTapImage3,
    Key? key,
  }) : super(key: key);

  const CommonMultiImageView.multiNetwork({
    required List<String> listNetwork,
    double? width,
    double? height,
    BoxShape? boxShape,
    double? radius,
    SizeMoreBuilder? sizeMoreBuilder,
    Function? onTapImage1,
    Function? onTapImage2,
    Function? onTapImage3,
    Key? key,
  }) : this._(
          key: key,
          images: listNetwork,
          imageInputType: ImageInputType.network,
          width: width,
          height: height,
          boxShape: boxShape,
          radius: radius,
          sizeMoreBuilder: sizeMoreBuilder,
          onTapImage1: onTapImage1,
          onTapImage2: onTapImage2,
          onTapImage3: onTapImage3,
        );

  const CommonMultiImageView.multiFile({
    required List<String> listFile,
    double? width,
    double? height,
    BoxShape? boxShape,
    double? radius,
    SizeMoreBuilder? sizeMoreBuilder,
     Function? onTapImage1,
    Function? onTapImage2,
    Function? onTapImage3,
    Key? key,
  }) : this._(
          key: key,
          images: listFile,
          imageInputType: ImageInputType.file,
          width: width,
          height: height,
          boxShape: boxShape,
          radius: radius,
          sizeMoreBuilder: sizeMoreBuilder,
          onTapImage1: onTapImage1,
          onTapImage2: onTapImage2,
          onTapImage3: onTapImage3,
        );

  final List<Object> images;
  final double? width;
  final double? height;
  final BoxShape? boxShape;
  final double? radius;
  final ImageInputType imageInputType;
  final SizeMoreBuilder? sizeMoreBuilder;
  final Function? onTapImage1;
  final Function? onTapImage2;
  final Function? onTapImage3;

  @override
  Widget build(BuildContext context) {
    final double _width = width ?? 300;
    final double _height =
        boxShape == BoxShape.circle ? _width : (height ?? 300);
    const BoxFit _fit = BoxFit.cover;
    final BoxShape _boxShape = boxShape ?? BoxShape.rectangle;

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(_getRadius(_boxShape, _width, radius)),
      child: SizedBox(
        width: _width,
        height: _height,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return _buildItem(
              images: images,
              imageInputType: imageInputType,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              fit: _fit,
              sizeMoreBuilder: sizeMoreBuilder,
              onTapImage1: onTapImage1,
          onTapImage2: onTapImage2,
          onTapImage3: onTapImage3,
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem({
    required List<Object> images,
    required ImageInputType imageInputType,
    required double maxWidth,
    required double maxHeight,
    required BoxFit fit,
    SizeMoreBuilder? sizeMoreBuilder,
    Function? onTapImage1,
    Function? onTapImage2,
    Function? onTapImage3,
  }) {
    final int bitmapsSize = images.length;
    const spacing = 6.0;

    switch (bitmapsSize) {
      case 1:
        return Wrap(
          children: [
            GestureDetector(
              onTap: () {
                if (onTapImage1 != null) {
                  onTapImage1();
                }
              },
              child: _buildImage(
                images.first,
                imageInputType: imageInputType,
                width: maxWidth,
                height: maxHeight,
                fit: fit,
              ),
            ),
          ],
        );
      case 2:
        return Wrap(
          spacing: spacing,
          children: [
            GestureDetector(
              onTap: () {
                if (onTapImage1 != null) {
                  onTapImage1();
                }
              },
              child: _buildImage(
                images.first,
                imageInputType: imageInputType,
                width: (maxWidth - spacing) / 2,
                height: maxHeight,
                fit: fit,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (onTapImage2 != null) {
                  onTapImage2();
                }
              },
              child: _buildImage(
                images[1],
                imageInputType: imageInputType,
                width: (maxWidth - spacing) / 2,
                height: maxHeight,
                fit: fit,
              ),
            ),
          ],
        );
      case 3:
        return Wrap(
          spacing: spacing,
          children: [
            GestureDetector(
              onTap: () {
                if (onTapImage1 != null) {
                  onTapImage1();
                }
              },
              child: _buildImage(
                images.first,
                imageInputType: imageInputType,
                width: (maxWidth - spacing) * 6 / 8,
                height: maxHeight,
                fit: fit,
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (onTapImage2 != null) {
                      onTapImage2();
                    }
                  },
                  child: _buildImage(
                    images[1],
                    imageInputType: imageInputType,
                    width: (maxWidth - spacing) * 2 / 8,
                    height: (maxHeight - spacing) / 2,
                    fit: fit,
                  ),
                ),
                const SizedBox(height: spacing),
                GestureDetector(
                  onTap: () {
                    if (onTapImage3 != null) {
                      onTapImage3();
                    }
                  },
                  child: _buildImage(
                    images[2],
                    imageInputType: imageInputType,
                    width: (maxWidth - spacing) * 2 / 8,
                    height: (maxHeight - spacing) / 2,
                    fit: fit,
                  ),
                ),
              ],
            ),
          ],
        );
      default:
        return Wrap(
          spacing: spacing,
          children: [
            GestureDetector(
              onTap: () {
                if (onTapImage1 != null) {
                  onTapImage1();
                }
              },
              child: _buildImage(
                images.first,
                imageInputType: imageInputType,
                width: (maxWidth - spacing) * 6 / 8,
                height: maxHeight,
                fit: fit,
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (onTapImage2 != null) {
                      onTapImage2();
                    }
                  },
                  child: _buildImage(
                    images[1],
                    imageInputType: imageInputType,
                    width: (maxWidth - spacing) * 2 / 8,
                    height: (maxHeight - spacing) / 2,
                    fit: fit,
                  ),
                ),
                const SizedBox(height: spacing),
                GestureDetector(
                  onTap: () {
                    if (onTapImage3 != null) {
                      onTapImage3();
                    }
                  },
                  child: _buildBlur(
                    child: _buildImage(
                      images[2],
                      imageInputType: imageInputType,
                      width: (maxWidth - spacing) * 2 / 8,
                      height: (maxHeight - spacing) / 2,
                      fit: fit,
                    ),
                    sizeMore: images.length - 3,
                    sizeMoreBuilder: sizeMoreBuilder,
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }

  Widget _buildBlur({
    required Widget child,
    required int sizeMore,
    SizeMoreBuilder? sizeMoreBuilder,
  }) {
    if (sizeMore == 0) {
      return child;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            child: child,
          ),
          sizeMoreBuilder != null
              ? sizeMoreBuilder(sizeMore)
              : Text(
                  '+$sizeMore',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildImage(
    Object image, {
    required double width,
    required double height,
    required BoxFit fit,
    required ImageInputType imageInputType,
  }) {
    if (imageInputType == ImageInputType.file) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.file(
          File(image as String),
          fit: fit,
          width: width,
          height: height,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: ImageWidget(
        image as String,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  double _getRadius(BoxShape boxShape, double size, double? radius) {
    switch (boxShape) {
      case BoxShape.rectangle:
        return radius ?? 0;
      case BoxShape.circle:
        return size / 2;
    }
  }
}