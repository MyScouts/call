import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SocialRefresher extends StatelessWidget {
  const SocialRefresher({
    super.key,
    required this.controller,
    required this.child,
    this.onRefresh,
    this.onLoading,
    this.onTwoLevel,
    this.builder,
    this.scrollDirection,
    this.reverse,
    this.scrollController,
    this.primary,
    this.physics,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior,
    this.isRefreshing = true,
    this.isLoadMore = true,
    this.enableTwoLevel = false,
  });
  final Widget? child;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final OnTwoLevel? onTwoLevel;
  final RefreshController controller;
  final RefresherBuilder? builder;
  final Axis? scrollDirection;
  final bool? reverse;
  final ScrollController? scrollController;
  final bool? primary;
  final ScrollPhysics? physics;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior? dragStartBehavior;
  final bool isRefreshing;
  final bool isLoadMore;
  final bool enableTwoLevel;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: isRefreshing,
      enablePullUp: isLoadMore,
      enableTwoLevel: enableTwoLevel,
      header: const MaterialClassicHeader(),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        canLoadingText: '',
        failedText: '',
        idleText: '',
        loadingText: '',
        noDataText: '',
      ),
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      onTwoLevel: onTwoLevel,
      primary: primary,
      physics: physics,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      cacheExtent: cacheExtent,
      reverse: reverse,
      scrollDirection: scrollDirection,
      scrollController: scrollController,
      key: key,
      child: child,
    );
  }
}
