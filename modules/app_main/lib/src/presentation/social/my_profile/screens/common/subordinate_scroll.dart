
import 'package:flutter/material.dart';

class SubordinateScrollController extends ScrollController {
  SubordinateScrollController(
    this.parent, {
    String subordinateDebugLabel = 'subordinate',
  }) : super(
          debugLabel: parent.debugLabel == null
              ? null
              : '${parent.debugLabel}/$subordinateDebugLabel',
          initialScrollOffset: parent.initialScrollOffset,
          keepScrollOffset: parent.keepScrollOffset,
        );
  final ScrollController parent;
  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) =>
      parent.createScrollPosition(physics, context, oldPosition);

  @override
  void attach(ScrollPosition position) {
    super.attach(position);
    parent.attach(position);
  }

  @override
  void detach(ScrollPosition position) {
    parent.detach(position);
    super.detach(position);
  }

  @override
  void dispose() {
    for (final position in positions) {
      parent.detach(position);
    }

    super.dispose();
  }
}
