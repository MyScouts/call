import 'package:flutter/material.dart';
import 'cutomer_multi_child_layout_view.dart';

import 'item_model.dart';

class StaggeredReorderableView extends StatelessWidget {
  final Axis scrollDirection;

  final List<CustomerItem> children;

  final int columnNum;

  final double padding;

  final Function(List<CustomerItem> items)? onChildrenChanged;

  final Function()? onDragStarted;

  final Function()? onDragEnd;

  final bool isDraggable;

  final Function(CustomerItem moveData, CustomerItem toData)? onGroup;

  const StaggeredReorderableView.customer({
    Key? key,
    required List<CustomerItem> children,
    Axis scrollDirection = Axis.vertical,
    bool collation = false,
    int columnNum = 4,
    double padding = 5.0,
    Function(List<CustomerItem> items)? onChildrenChanged,
    Function()? onDragStarted,
    Function()? onDragEnd,
    bool? isDraggable,
    Function(CustomerItem moveData, CustomerItem toData)? onGroup,
  }) : this(
          key: key,
          children: children,
          scrollDirection: scrollDirection,
          columnNum: columnNum,
          padding: padding,
          onChildrenChanged: onChildrenChanged,
          onDragStarted: onDragStarted,
          onDragEnd: onDragEnd,
          isDraggable: isDraggable ?? true,
          onGroup: onGroup,
        );

  const StaggeredReorderableView({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.columnNum = 3,
    this.padding = 5.0,
    this.onChildrenChanged,
    this.onDragStarted,
    this.onDragEnd,
    this.isDraggable = true,
    this.onGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomerMultiChildView(
      children,
      columnNum,
      padding,
      onChildrenChanged,
      onDragStarted,
      onDragEnd,
      isDraggable,
      onGroup,
    );
  }
}
