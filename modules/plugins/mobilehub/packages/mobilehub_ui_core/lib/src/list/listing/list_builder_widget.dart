import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../widgets/loading_widget.dart';

typedef CallbackRefresh = Future<void> Function();
typedef ListBuillder = Widget Function(BuildContext context, int index);

class ListBuilderWidget extends StatefulWidget {
  final CallbackRefresh? onRefresh;
  final ListBuillder builder;
  final int childCount;
  final ScrollController? scrollController;
  final SliverGridDelegate? gridDelegate;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool reverse;
  final ScrollPhysics? physics;
  final ListScrollController? _listScrollController;
  final Widget? title;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final Widget emptyWidget;
  final bool isLoading;
  final PageStorageKey? pageStorageKey;
  final Widget? sliverTitle;

  const ListBuilderWidget({
    super.key,
    this.onRefresh,
    this.scrollController,
    this.gridDelegate,
    required this.builder,
    required this.childCount,
    this.separatorBuilder,
    this.reverse = false,
    this.physics,
    ListScrollController? listScrollController,
    this.title,
    this.footer,
    this.padding = EdgeInsets.zero,
    this.emptyWidget = const SizedBox(),
    this.isLoading = false,
    this.pageStorageKey,
    this.sliverTitle,
  }) : _listScrollController = listScrollController;

  const ListBuilderWidget.listview({
    super.key,
    this.onRefresh,
    this.scrollController,
    this.separatorBuilder,
    this.reverse = false,
    required this.builder,
    required this.childCount,
    this.physics,
    this.title,
    this.footer,
    this.padding = EdgeInsets.zero,
    this.emptyWidget = const SizedBox(),
    this.isLoading = false,
    this.pageStorageKey,
    this.sliverTitle,
  })  : gridDelegate = null,
        _listScrollController = null;

  const ListBuilderWidget.scrollToItem({
    super.key,
    this.scrollController,
    this.separatorBuilder,
    this.reverse = false,
    required this.builder,
    required this.childCount,
    this.physics,
    this.title,
    this.isLoading = false,
    this.padding = EdgeInsets.zero,
    this.emptyWidget = const SizedBox(),
    this.pageStorageKey,
    this.sliverTitle,
  })  : gridDelegate = null,
        footer = null,
        _listScrollController = null,
        onRefresh = null;

  const ListBuilderWidget.gridview({
    super.key,
    this.onRefresh,
    this.scrollController,
    this.reverse = false,
    required this.builder,
    required this.childCount,
    required this.gridDelegate,
    this.physics,
    this.title,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
    this.emptyWidget = const SizedBox(),
    this.pageStorageKey,
    this.footer,
    this.sliverTitle,
  })  : separatorBuilder = null,
        _listScrollController = null;

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget._listScrollController != null) {
      return ScrollablePositionedList.separated(
        separatorBuilder: (context, index) {
          if (widget.separatorBuilder != null) {
            return widget.separatorBuilder!(context, index);
          }
          return const SizedBox.shrink();
        },
        itemCount: widget.childCount,
        itemBuilder: widget.builder,
        itemScrollController:
            widget._listScrollController!.itemScrollController,
        itemPositionsListener:
            widget._listScrollController!.itemPositionsListener,
        reverse: widget.reverse,
        scrollDirection: Axis.vertical,
      );
    }

    if (UniversalPlatform.isIOS ||
        widget.title != null ||
        widget.sliverTitle != null) {
      return _ListBuilderIos(
        sliverTitle: widget.sliverTitle,
        padding: widget.padding,
        onRefresh: widget.onRefresh,
        scrollController: widget.scrollController,
        builder: widget.builder,
        reverse: widget.reverse,
        childCount: widget.childCount,
        gridDelegate: widget.gridDelegate,
        separatorBuilder: widget.separatorBuilder,
        physics: widget.physics,
        title: widget.title,
        isLoading: widget.isLoading,
        footer: widget.footer,
        emptyWidget: widget.emptyWidget,
        pageStorageKey: widget.pageStorageKey,
      );
    }

    return _ListBuilderAndroid(
      padding: widget.padding,
      onRefresh: widget.onRefresh,
      scrollController: widget.scrollController,
      builder: widget.builder,
      reverse: widget.reverse,
      childCount: widget.childCount,
      gridDelegate: widget.gridDelegate,
      physics: widget.physics,
      separatorBuilder: widget.separatorBuilder,
      emptyWidget: widget.emptyWidget,
      isLoading: widget.isLoading,
    );
  }
}

class _ListBuilderAndroid extends StatelessWidget {
  final CallbackRefresh? onRefresh;
  final ScrollController? scrollController;
  final ListBuillder builder;
  final int childCount;
  final SliverGridDelegate? gridDelegate;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool reverse;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry padding;
  final Widget emptyWidget;
  final bool isLoading;

  const _ListBuilderAndroid({
    Key? key,
    this.onRefresh,
    this.scrollController,
    required this.builder,
    required this.childCount,
    this.gridDelegate,
    this.separatorBuilder,
    this.reverse = false,
    this.physics,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
    required this.emptyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listBuilderWidget = gridDelegate != null
        ? GridView.builder(
            padding: padding,
            physics: physics ??
                const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
            reverse: reverse,
            gridDelegate: gridDelegate!,
            itemBuilder: builder,
            itemCount: childCount,
            controller: scrollController,
          )
        : ListView.separated(
            padding: padding,
            itemBuilder: builder,
            physics: physics ??
                const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
            reverse: reverse,
            itemCount: childCount,
            controller: scrollController,
            separatorBuilder: (context, index) {
              if (separatorBuilder != null) {
                return separatorBuilder!(context, index);
              }
              return const SizedBox.shrink();
            },
          );

    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async {
          await onRefresh?.call();
        },
        child: (childCount == 0 && isLoading == false)
            ? emptyWidget
            : listBuilderWidget,
      );
    }

    return (childCount == 0 && isLoading == false)
        ? emptyWidget
        : listBuilderWidget;
  }
}

class _ListBuilderIos extends StatelessWidget {
  final CallbackRefresh? onRefresh;
  final ScrollController? scrollController;
  final ListBuillder builder;
  final int childCount;
  final SliverGridDelegate? gridDelegate;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool reverse;
  final ScrollPhysics? physics;
  final Widget? title;
  final EdgeInsetsGeometry padding;
  final Widget emptyWidget;
  final bool isLoading;
  final Widget? footer;
  final PageStorageKey? pageStorageKey;
  final Widget? sliverTitle;

  const _ListBuilderIos({
    this.scrollController,
    this.onRefresh,
    this.gridDelegate,
    required this.builder,
    required this.childCount,
    this.separatorBuilder,
    this.reverse = false,
    this.physics,
    this.title,
    this.footer,
    this.isLoading = false,
    this.padding = EdgeInsets.zero,
    required this.emptyWidget,
    this.pageStorageKey,
    this.sliverTitle,
  });

  @override
  Widget build(BuildContext context) {
    final isAndroid = UniversalPlatform.isAndroid;
    final body = CustomScrollView(
      key: pageStorageKey,
      controller: scrollController,
      reverse: reverse,
      physics: physics ??
          (isAndroid == false
              ? const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                )
              : null),
      slivers: [
        if (onRefresh != null && isAndroid == false)
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
            builder: (context, refreshState, pulledExtent,
                refreshTriggerPullDistance, refreshIndicatorExtent) {
              const Curve opacityCurve =
                  Interval(0.4, 0.8, curve: Curves.easeInOut);
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Opacity(
                    opacity: opacityCurve.transform(
                        min(pulledExtent / refreshIndicatorExtent, 1.0)),
                    child: const CupertinoActivityIndicator(radius: 10.0),
                  ),
                ),
              );
            },
          ),
        if (sliverTitle != null) sliverTitle!,
        if (title != null) SliverToBoxAdapter(child: title),
        if (isLoading == false) ...[
          if (childCount == 0)
            SliverToBoxAdapter(child: emptyWidget)
          else if (gridDelegate != null)
            SliverPadding(
              padding: padding,
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  builder,
                  childCount: childCount,
                ),
                gridDelegate: gridDelegate!,
              ),
            )
          else
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (separatorBuilder == null) {
                      return builder(context, index);
                    }

                    if (index % 2 == 0) {
                      return builder(context, index ~/ 2);
                    }
                    return separatorBuilder!(context, index);
                  },
                  childCount: separatorBuilder == null
                      ? childCount
                      : (childCount + childCount - 1),
                ),
              ),
            ),
        ] else
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Center(child: LoadingWidget()),
            ),
          ),
        if (footer != null && isLoading == false)
          SliverToBoxAdapter(child: footer),
      ],
    );

    if (isAndroid && onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async {
          await onRefresh?.call();
        },
        child: body,
      );
    }

    return body;
  }
}

class ListScrollController {
  final Duration scrollDuration;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  ListScrollController({this.scrollDuration = const Duration(seconds: 2)});

  void _jumpTo(int index) =>
      itemScrollController.jumpTo(index: index, alignment: 0);

  void _scrollTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeInOutCubic,
      alignment: 0);

  void to(int index, ScrollToItemType type) {
    if (type == ScrollToItemType.jump) {
      _jumpTo(index);
    } else {
      _scrollTo(index);
    }
  }
}

enum ScrollToItemType { scroll, jump }
