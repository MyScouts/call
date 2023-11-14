import 'package:flutter/cupertino.dart';

enum CustomerItemType {
  widget,
  group,
  icon,
}

class CustomerItem {
  final String id;
  final int? crossAxisCellCount;
  final int? mainAxisCellCount;
  final Widget child;
  final CustomerItemType type;

  CustomerItem({
    required this.id,
    required this.child,
    this.crossAxisCellCount = 1,
    this.mainAxisCellCount = 1,
    required this.type,
  });

  bool compare(CustomerItem next) {
    if (id == next.id &&
        crossAxisCellCount == next.crossAxisCellCount &&
        mainAxisCellCount == next.mainAxisCellCount &&
        child == next.child && type == next.type) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return "index:, id: $id, crossAxisCellCount: $crossAxisCellCount, mainAxisCellCount: $mainAxisCellCount, child: $child";
  }
}

class ItemPosition {
  final String id;
  final Offset offset;

  ItemPosition(this.id, this.offset);

  @override
  String toString() {
    return "id: $id, offset: $offset";
  }

  bool compare(ItemPosition next) {
    if (id == next.id &&
        offset.dx == next.offset.dx &&
        offset.dy == next.offset.dy) return true;
    return false;
  }

  Offset transform(ItemPosition old) {
    double dx = 0.0;
    double dy = 0.0;
    if (id == old.id) {
      dx = offset.dx - old.offset.dx;
      dy = offset.dy - old.offset.dy;
    }
    return Offset(dx, dy);
  }
}