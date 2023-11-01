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

    if (showShadown) {
      final Paint shadowPaint = Paint()
        ..color = Colors.grey.withOpacity(0.7)
        ..style = PaintingStyle.fill
        ..strokeWidth = 5
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

      final pathShadown = Path();
      paintItem(pathShadown, Offset(offset.dx, offset.dy + 3), size);
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
    const widthCut = 24;
    const radius1 = 0.0;
    const radius2 = 5.0;
    final x1 = offset.dx + widthCut + radius1;
    final y1 = offset.dy;
    //
    final x2 = offset.dx + size.width - widthCut - radius1;
    final y2 = offset.dy;
    //
    final x3 = x2 + radius1;
    final y3 = offset.dy + radius1;
    //
    final x4 = offset.dx + size.width - radius2;
    final y4 = offset.dy + size.height / 2 - radius2 / 2;
    //
    final x5 = x4;
    final y5 = offset.dy + size.height / 2 + radius2 / 2;
    //
    final x6 = x3;
    final y6 = offset.dy + size.height - radius1;
    //
    final x7 = x2;
    final y7 = offset.dy + size.height;
    //
    final x8 = x1;
    final y8 = offset.dy + size.height;
    //
    final x9 = x1 - radius1;
    final y9 = y6;
    //
    final x10 = offset.dx + radius2 / 2;
    final y10 = y5;
    //
    final x11 = x10;
    final y11 = y4;
    //
    final x12 = x1 - radius1;
    final y12 = y3;

    path.moveTo(x1, y1);
    path.lineTo(x2, y2);
    path.arcToPoint(Offset(x3, y3), radius: const Radius.circular(radius1));
    path.lineTo(x4, y4);
    path.arcToPoint(Offset(x5, y5), radius: const Radius.circular(radius2));
    path.lineTo(x6, y6);
    path.arcToPoint(Offset(x7, y7), radius: const Radius.circular(radius1));
    path.lineTo(x8, y8);
    path.arcToPoint(Offset(x9, y9), radius: const Radius.circular(radius1));
    path.lineTo(x10, y10);
    path.arcToPoint(Offset(x11, y11), radius: const Radius.circular(radius2));
    path.lineTo(x12, y12);
    path.arcToPoint(
      Offset(x1, y1),
      radius: const Radius.circular(radius1),
    );
  }
}
