import 'package:flutter/material.dart';

class RenderInfo {
  final Offset position;
  final Size size;

  RenderInfo(this.position, this.size);
}

extension BuildCtx on BuildContext {
  RenderInfo get getRenderObjectInfo {
    final box = findRenderObject() as RenderBox;
    final pos = box.globalToLocal(Offset.zero);
    final position = Offset(-pos.dx, -pos.dy);
    return RenderInfo(position, box.size);
  }
}
