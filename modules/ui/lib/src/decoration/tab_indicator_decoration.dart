import 'package:flutter/material.dart';

class TabIndicatorDecoration extends BoxDecoration {
  final BoxPainter _painter;

  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;
  final bool useRedDot;

  TabIndicatorDecoration({
    this.alignment = Alignment.center,
    super.color = Colors.white,
    this.weight = 1.5,
    this.radius = 5.0,
    this.width = 22.0,
    this.useRedDot = false,
  }) : _painter = TabIndicatorDecorationPainter(
          color: color ?? Colors.white,
          weight: weight,
          radius: radius,
          alignment: alignment,
          width: width,
          useRedDot: useRedDot,
        );

  @override
  BoxPainter createBoxPainter([Function()? onChanged]) => _painter;
}

class TabIndicatorDecorationPainter extends BoxPainter {
  final Paint _paint;
  final Color color;
  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;
  final bool useRedDot;

  TabIndicatorDecorationPainter({
    required this.useRedDot,
    required this.alignment,
    required this.width,
    required this.color,
    required this.weight,
    required this.radius,
  }) : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    double xPos = offset.dx + size.width / 2;
    if (alignment == Alignment.centerLeft) {
      xPos = offset.dx + width + 15;
    }

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(
          xPos - width,
          size.height,
          xPos + width,
          size.height - weight,
        ),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      _paint,
    );

    if (useRedDot) {
      canvas.drawCircle(
          Offset(
            offset.dx + size.width - 14,
            offset.dy + 7,
          ),
          2,
          Paint()
            ..color = Colors.red
            ..isAntiAlias = true);
    }
  }
}
