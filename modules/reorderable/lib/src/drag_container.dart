import 'dart:async';

import 'package:flutter/material.dart';

import 'drag_item.dart';
import 'drag_notification.dart';
import 'render_box_size.dart';
import 'reorderable_staggered_scroll_view.dart';

typedef DraggableWidget = Widget Function(Widget child);
typedef DragTargetOn<T> = Widget Function(T? moveData, T data);

/// A widget that allows for drag-and-drop functionality within a list of items.
///
/// The [DragContainer] widget is designed to manage drag-and-drop interactions
/// between a list of items and provide callbacks for various drag-related events.
///
/// - [buildItems]: A function that takes a list of child widgets and builds the
///   main list of draggable items.
/// - [items]: A function that defines the draggable items using the provided data
///   and a drag handle.
/// - [dataList]: A list of data items that correspond to the draggable widgets.
/// - [isLongPressDraggable]: Whether dragging is initiated by a long press.
/// - [axis]: The primary axis along which the items should be arranged.
/// - [onAccept]: A callback function that is called when a draggable item is
///   accepted in a drop target.
/// - [onWillAccept]: A callback function that determines if a drop target will
///   accept a draggable item.
/// - [onLeave]: A callback function that is called when a draggable item leaves
///   a drop target.
/// - [onMove]: A callback function that is called when a draggable item is moved
///   within the drop target.
/// - [scrollDirection]: The direction of scrolling, either vertical or horizontal.
/// - [hitTestBehavior]: The hit test behavior used to determine the target of
///   a drag event.
/// - [onDragStarted]: A callback function called when a drag operation starts.
/// - [onDragUpdate]: A callback function called when a draggable item is being
///   updated during a drag operation.
/// - [onDraggableCanceled]: A callback function called when a draggable item is
///   canceled during a drag operation.
/// - [onDragEnd]: A callback function called when a drag operation ends.
/// - [onDragCompleted]: A callback function called when a draggable item has
///   completed its drag operation.
/// - [scrollController]: The controller for the scrollable view, if applicable.
/// - [isDragNotification]: A boolean indicating whether to use drag notification
///   to detect scroll actions.
/// - [draggingWidgetOpacity]: The opacity of the draggable item while it's being
///   dragged.
/// - [edgeScroll]: The proportion of the screen size used for edge scrolling.
/// - [edgeScrollSpeedMilliseconds]: The duration of edge scrolling in milliseconds.
/// - [isDrag]: A boolean indicating whether drag-and-drop functionality is enabled.
/// - [isNotDragList]: A list of items that should not be draggable.
///
/// To enable drag-and-drop functionality, wrap the list of items with [DragContainer]
/// and provide the necessary callbacks for managing the drag-and-drop operations.
class DragContainer<T extends ReorderableStaggeredScrollViewListItem>
    extends StatefulWidget {
  final Widget Function(List<Widget> children) buildItems;
  final Widget Function(T data, DraggableWidget draggableWidget) items;
  final List<T> dataList;
  final Widget Function(T data, Widget child, Size size)? buildFeedback;
  final bool isLongPressDraggable;
  final Axis? axis;
  final void Function(T? moveData, T data, bool isFront)? onAccept;
  final bool Function(T? moveData, T data, bool isFront)? onWillAccept;
  final void Function(T? moveData, T data, bool isFront)? onLeave;
  final void Function(T data, DragTargetDetails<T> details, bool isFront)?
      onMove;
  final Axis scrollDirection;
  final HitTestBehavior hitTestBehavior;
  final void Function(T data)? onDragStarted;
  final void Function(DragUpdateDetails details, T data)? onDragUpdate;
  final void Function(Velocity velocity, Offset offset, T data)?
      onDraggableCanceled;
  final void Function(DraggableDetails details, T data)? onDragEnd;
  final void Function(T data)? onDragCompleted;
  final ScrollController? scrollController;
  final bool isDragNotification;
  final double draggingWidgetOpacity;
  final double edgeScroll;
  final int edgeScrollSpeedMilliseconds;
  final bool isDrag;
  final List<T>? isNotDragList;
  final Function(T moveData, T data)? onGroup;
  final Function(List<T> list) onDataChanged;

  const DragContainer({
    required this.buildItems,
    required this.dataList,
    required this.items,
    this.isLongPressDraggable = true,
    this.buildFeedback,
    this.axis,
    this.onAccept,
    this.onWillAccept,
    this.onLeave,
    this.onMove,
    this.hitTestBehavior = HitTestBehavior.translucent,
    this.scrollDirection = Axis.vertical,
    this.onDragStarted,
    this.onDragUpdate,
    this.onDraggableCanceled,
    this.onDragEnd,
    this.onDragCompleted,
    this.scrollController,
    this.isDragNotification = false,
    this.draggingWidgetOpacity = 0.5,
    this.edgeScroll = 0.1,
    this.edgeScrollSpeedMilliseconds = 100,
    this.isDrag = true,
    this.isNotDragList,
    this.onGroup,
    required this.onDataChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<DragContainer> createState() => _DragContainerState();
}

class _DragContainerState<T extends ReorderableStaggeredScrollViewListItem>
    extends State<DragContainer> {
  Timer? _timer;
  Timer? _scrollableTimer;
  ScrollableState? _scrollable;
  AnimationStatus status = AnimationStatus.completed;
  bool isDragStart = false;
  T? dragData;
  Map<T, Size> mapSize = <T, Size>{};
  Offset? _dragPosition;
  Map<T, Offset> _mapPosition = <T, Offset>{};
  Timer? _onGroupActive;

  void groupActiveStart(T moveData, T data) {
    if (_onGroupActive != null) _onGroupActive?.cancel();
    _onGroupActive = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        final dy = _mapPosition[data]?.dy ?? 0;
        final height = mapSize[data]?.height ?? 0;
        if (dy + height * 0.7 > (_dragPosition?.dy ?? 0)) {
          widget.onGroup?.call(moveData, data);
        }
        _onGroupActive?.cancel();
      },
    );
  }

  void endWillAccept() {
    _timer?.cancel();
  }

  void setDragStart({bool isDragStart = true}) {
    if (this.isDragStart != isDragStart) {
      if (mounted) {
        setState(() {
          this.isDragStart = isDragStart;
          if (!this.isDragStart) {
            dragData = null;
          } else {
            endWillAccept();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.dataList.map((e) => setDraggable(e as T)).toList();
    if (widget.isDragNotification) {
      return DragNotification(
        child: widget.buildItems(items),
      );
    } else {
      return widget.buildItems(items);
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    final List<T> delete = <T>[];
    mapSize.forEach((T key, Size value) {
      if (!widget.dataList.contains(key)) {
        delete.add(key);
      }
    });
    mapSize.removeWhere((T key, Size value) => delete.contains(key));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.scrollController == null) {
      try {
        _scrollable = Scrollable.of(context);
      } catch (e, s) {
        debugPrint('No scrollController found!, $e \n $s');
      }
    }
  }

  void setWillAccept(T? moveData, T data, {bool isFront = true}) {
    if (moveData == data) {
      return;
    }
    if (status == AnimationStatus.completed) {
      endWillAccept();
      _timer = Timer(const Duration(milliseconds: 50), () {
        if (!DragNotification.isScroll) {
          if (widget.onWillAccept != null) {
            widget.onWillAccept?.call(moveData, data, isFront);
          }

          final dy = _mapPosition[data]?.dy ?? 0;

          final height = mapSize[data]?.height ?? 0;

          if (dy + height * 0.7 > (_dragPosition?.dy ?? 0)) {
            if (moveData == null) return;
            groupActiveStart(moveData, data);
            return;
          }

          if (_onGroupActive != null) _onGroupActive?.cancel();

          if (moveData != null) {
            setState(() {
              final int index = widget.dataList.indexOf(data);
              if (isFront) {
                widget.dataList.remove(moveData);
                widget.dataList.insert(index, moveData);
              } else {
                widget.dataList.remove(moveData);
                if (index + 1 < widget.dataList.length) {
                  widget.dataList.insert(index + 1, moveData);
                } else {
                  widget.dataList.insert(index, moveData);
                }
              }
            });
          }
        }
      });
    }
  }

  bool isContains(T data) {
    if (widget.isNotDragList?.toList() != null) {
      return widget.isNotDragList!
          .map((e) => e.widget.key)
          .toList()
          .contains(data.widget.key);
    }
    return false;
  }

  Size getRenderBoxSize(T? date) {
    return mapSize[date] ?? Size.zero;
  }

  Widget getSizedBox(T data, Widget child) {
    final Size size = getRenderBoxSize(data);
    return SizedBox(
      width: size.width / (widget.scrollDirection == Axis.horizontal ? 2 : 1),
      height: size.height / (widget.scrollDirection == Axis.vertical ? 2 : 1),
      child: child,
    );
  }

  Widget setDragScope(T data, Widget child) {
    final Widget keyWidget = child;
    return DragItem(
        child: Stack(
          children: <Widget>[
            if (isDragStart && dragData == data)
              AnimatedOpacity(
                opacity: 0.0,
                duration: const Duration(milliseconds: 300),
                child: keyWidget,
              )
            else
              Visibility(
                maintainState: true,
                visible: dragData != data,
                child: keyWidget,
              ),
            if (isDragStart && !isContains(data))
              Flex(
                direction: widget.scrollDirection,
                children: <Widget>[
                  getSizedBox(
                    data,
                    DragTarget<T>(
                        onWillAccept: (T? moveData) {
                          setWillAccept(moveData, data);
                          return moveData != null;
                        },
                        onAccept: widget.onAccept == null
                            ? null
                            : (T moveData) {
                                if (_onGroupActive != null) {
                                  _onGroupActive?.cancel();
                                }
                                return widget.onAccept
                                    ?.call(moveData, data, true);
                              },
                        onLeave: widget.onLeave == null
                            ? null
                            : (T? moveData) =>
                                widget.onLeave?.call(moveData, data, true),
                        onMove: widget.onMove == null
                            ? null
                            : (DragTargetDetails<T> details) =>
                                widget.onMove?.call(data, details, true),
                        hitTestBehavior: widget.hitTestBehavior,
                        builder: (BuildContext context, List<T?> candidateData,
                            List<dynamic> rejectedData) {
                          return Container(color: Colors.transparent);
                        }),
                  ),
                  getSizedBox(
                    data,
                    DragTarget<T>(
                        onWillAccept: (T? moveData) {
                          setWillAccept(moveData, data, isFront: false);
                          return moveData != null;
                        },
                        onAccept: widget.onAccept == null
                            ? null
                            : (T moveData) {
                                if (_onGroupActive != null) {
                                  _onGroupActive?.cancel();
                                }
                                widget.onAccept?.call(moveData, data, false);
                              },
                        onLeave: widget.onLeave == null
                            ? null
                            : (T? moveData) =>
                                widget.onLeave?.call(moveData, data, false),
                        onMove: widget.onMove == null
                            ? null
                            : (DragTargetDetails<T> details) =>
                                widget.onMove?.call(data, details, false),
                        hitTestBehavior: widget.hitTestBehavior,
                        builder: (BuildContext context, List<T?> candidateData,
                            List<dynamic> rejectedData) {
                          return Container(color: Colors.transparent);
                        }),
                  ),
                ],
              ),
          ],
        ),
        onAnimationStatus: (AnimationStatus status) {
          this.status = status;
        });
  }

  Widget setDraggable(T data) {
    final Widget draggable = widget.items(data, (Widget father) {
      Widget child = setDragScope(data, father);
      if (widget.isDrag && !isContains(data)) {
        if (widget.isLongPressDraggable) {
          child = LongPressDraggable<T>(
            feedback: setFeedback(data, father),
            axis: widget.axis,
            data: data,
            onDragStarted: () {
              dragData = data;
              setDragStart();
              widget.onDragStarted?.call(data);
            },
            onDragUpdate: (DragUpdateDetails details) {
              _dragPosition = details.globalPosition;
              _autoScrollIfNecessary(details.globalPosition, father);
              widget.onDragUpdate?.call(details, data);
            },
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              _dragPosition = null;
              setDragStart(isDragStart: false);
              endAnimation();
              widget.onDraggableCanceled?.call(velocity, offset, data);
            },
            onDragEnd: (details) {
              setDragStart(isDragStart: false);
              widget.onDragEnd?.call(details, data);
            },
            onDragCompleted: () {
              setDragStart(isDragStart: false);
              endAnimation();
              widget.onDragCompleted?.call(data);
            },
            child: child,
          );
        } else {
          child = Draggable<T>(
            feedback: setFeedback(data, father),
            axis: widget.axis,
            data: data,
            onDragStarted: () {
              dragData = data;
              setDragStart();
              widget.onDragStarted?.call(data);
            },
            onDragUpdate: (DragUpdateDetails details) {
              _dragPosition = details.globalPosition;
              _autoScrollIfNecessary(details.globalPosition, father);
              widget.onDragUpdate?.call(details, data);
            },
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              setDragStart(isDragStart: false);
              endAnimation();
              widget.onDraggableCanceled?.call(velocity, offset, data);
            },
            onDragEnd: (DraggableDetails details) {
              setDragStart(isDragStart: false);
              widget.onDragEnd?.call(details, data);
              widget.onDataChanged.call(widget.dataList);
            },
            onDragCompleted: () {
              setDragStart(isDragStart: false);
              endAnimation();
              widget.onDragCompleted?.call(data);
            },
            child: child,
          );
        }
      }
      return child;
    });

    return RenderBoxSize(
      draggable,
      (Size size) {
        mapSize[data] = size;
        if (mapSize.length == widget.dataList.length) {
          setState(() {});
        }
      },
      (Offset offset) {
        _mapPosition[data] = offset;
      },
      key: ValueKey<T>(data),
    );
  }

  Widget setFeedback(T data, Widget e) {
    final Size size = getRenderBoxSize(data);
    final Widget child = SizedBox(
      width: size.width,
      height: size.height,
      child: e,
    );
    return widget.buildFeedback?.call(data, child, size) ?? child;
  }

  void _autoScrollIfNecessary(Offset details, Widget father) {
    if (status != AnimationStatus.completed) {
      return;
    }
    if (_scrollable == null && widget.scrollController == null) {
      debugPrint("_scrollable == null && widget.scrollController == null");
      return;
    }
    final RenderBox scrollRenderBox;
    if (_scrollable != null) {
      scrollRenderBox = _scrollable!.context.findRenderObject()! as RenderBox;
    } else {
      scrollRenderBox = context.findRenderObject()! as RenderBox;
    }
    final Offset scrollOrigin = scrollRenderBox.localToGlobal(Offset.zero);
    final double scrollStart =
        _offsetExtent(scrollOrigin, widget.scrollDirection);
    final double scrollEnd =
        scrollStart + _sizeExtent(scrollRenderBox.size, widget.scrollDirection);
    final double currentOffset = _offsetExtent(details, widget.scrollDirection);
    final double mediaQuery =
        _sizeExtent(MediaQuery.of(context).size, widget.scrollDirection) *
            widget.edgeScroll;
    if (currentOffset < (scrollStart + mediaQuery)) {
      animateTo(mediaQuery, isNext: false);
    } else if (currentOffset > (scrollEnd - mediaQuery)) {
      animateTo(mediaQuery);
    } else {
      endAnimation();
    }
  }

  void animateTo(double mediaQuery, {bool isNext = true}) {
    final ScrollPosition position =
        _scrollable?.position ?? widget.scrollController!.position;
    endAnimation();
    if (isNext && position.pixels >= position.maxScrollExtent) {
      return;
    } else if (!isNext && position.pixels <= position.minScrollExtent) {
      return;
    }
    DragNotification.isScroll = true;
    _scrollableTimer = Timer.periodic(
        Duration(milliseconds: widget.edgeScrollSpeedMilliseconds),
        (Timer timer) {
      if (isNext && position.pixels >= position.maxScrollExtent) {
        endAnimation();
      } else if (!isNext && position.pixels <= position.minScrollExtent) {
        endAnimation();
      } else {
        endWillAccept();
        position.animateTo(
          position.pixels + (isNext ? mediaQuery : -mediaQuery),
          duration: Duration(milliseconds: widget.edgeScrollSpeedMilliseconds),
          curve: Curves.linear,
        );
      }
    });
  }

  void endAnimation() {
    DragNotification.isScroll = false;
    _scrollableTimer?.cancel();
  }

  double _offsetExtent(Offset offset, Axis scrollDirection) {
    switch (scrollDirection) {
      case Axis.horizontal:
        return offset.dx;
      case Axis.vertical:
        return offset.dy;
    }
  }

  double _sizeExtent(Size size, Axis scrollDirection) {
    switch (scrollDirection) {
      case Axis.horizontal:
        return size.width;
      case Axis.vertical:
        return size.height;
    }
  }

  @override
  void dispose() {
    endWillAccept();
    endAnimation();
    _onGroupActive?.cancel();
    super.dispose();
  }
}
