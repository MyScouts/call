import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NestedScrollViewNotification extends StatefulWidget {
  const NestedScrollViewNotification({
    super.key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    required this.headerSliverBuilder,
    required this.body,
    this.dragStartBehavior = DragStartBehavior.start,
    this.floatHeaderSlivers = false,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scrollBehavior,
    required this.onInnerScrollControllerUpdate,
  });

  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final Widget body;
  final DragStartBehavior dragStartBehavior;
  final bool floatHeaderSlivers;
  final Clip clipBehavior;
  final String? restorationId;
  final ScrollBehavior? scrollBehavior;
  final void Function(ScrollController) onInnerScrollControllerUpdate;

  @override
  State<NestedScrollViewNotification> createState() =>
      _NestedScrollViewNotificationState();
}

class _NestedScrollViewNotificationState
    extends State<NestedScrollViewNotification> {
  final GlobalKey<NestedScrollViewState> nestedScrollViewKey = GlobalKey();

  ScrollController get innerController {
    return nestedScrollViewKey.currentState!.innerController;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: nestedScrollViewKey,
      controller: widget.controller,
      physics: widget.physics,
      floatHeaderSlivers: widget.floatHeaderSlivers,
      headerSliverBuilder: widget.headerSliverBuilder,
      clipBehavior: widget.clipBehavior,
      dragStartBehavior: widget.dragStartBehavior,
      restorationId: widget.restorationId,
      scrollBehavior: widget.scrollBehavior,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
      body: NotificationListener<ScrollStartNotification>(
        onNotification: (_) {
          widget.onInnerScrollControllerUpdate.call(
            innerController,
          );
          return true;
        },
        child: widget.body,
      ),
    );
  }
}
