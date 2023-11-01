import 'package:flutter/material.dart';

class StepperDecoration extends BoxDecoration {
  final BoxPainter _painter;

  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final bool showShadown;
  final bool isShowItemUnselected;

  StepperDecoration({
    this.alignment = Alignment.center,
    super.color = Colors.white,
    this.weight = 1.5,
    this.radius = 5.0,
    this.width = 22.0,
    this.isFirst = false,
    this.isLast = false,
    this.isSelected = false,
    this.showShadown = true,
    this.isShowItemUnselected = true,
  }) : _painter = StepperDecorationPainter(
          color: color ?? Colors.white,
          weight: weight,
          radius: radius,
          alignment: alignment,
          width: width,
          isFirst: isFirst,
          isLast: isLast,
          isSelected: isSelected,
          showShadown: showShadown,
          isShowItemUnselected: isShowItemUnselected,
        );

  @override
  BoxPainter createBoxPainter([Function()? onChanged]) => _painter;
}

class StepperDecorationPainter extends BoxPainter {
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final bool isShowItemUnselected;
  final bool showShadown;
  final Color color;
  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;

  StepperDecorationPainter({
    required this.isSelected,
    required this.alignment,
    required this.width,
    required this.color,
    required this.weight,
    required this.radius,
    this.isShowItemUnselected = true,
    this.showShadown = true,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;

    if (isSelected && showShadown) {
      final Paint shadowPaint = Paint()
        ..color = Colors.grey.withOpacity(0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

      final pathShadown = Path();
      paintItem(pathShadown, offset, size);
      pathShadown.close();
      canvas.drawPath(pathShadown, shadowPaint);
    }

    final Paint paint = Paint()
      ..color = isShowItemUnselected || isSelected ? color : Colors.transparent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    paintItem(path, offset, size);
    path.close();
    canvas.drawPath(path, paint);
  }

  void paintItem(Path path, Offset offset, Size size) {
    path.moveTo(offset.dx - (isFirst ? 0 : 28), offset.dy);
    if (isLast) {
      path.lineTo(offset.dx + size.width, offset.dy);
      path.lineTo(offset.dx + size.width, offset.dy + size.height);
    } else {
      final sub = isSelected ? 2.0 : 0;
      final sizeAdd = 30 - sub;
      path.lineTo(offset.dx + size.width - sizeAdd, offset.dy);
      path.lineTo(offset.dx + size.width + sub, offset.dy + (size.height / 2));
      path.lineTo(offset.dx + size.width - sizeAdd, offset.dy + size.height);
    }

    if (isFirst) {
      path.lineTo(offset.dx, offset.dy + size.height);
      path.lineTo(offset.dx, offset.dy);
    } else {
      final sizeAdd = isSelected ? 30 : 28;
      path.lineTo(offset.dx - sizeAdd, offset.dy + size.height);
      path.lineTo(
          offset.dx + (isSelected ? 0 : 2), offset.dy + size.height / 2);
      path.lineTo(offset.dx - sizeAdd, offset.dy);
    }
  }
}
