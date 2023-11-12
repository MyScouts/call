import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:reorderable/reorderable.dart';
import 'dart:ui' as ui;

import 'app_icon_animation.dart';

class DashBoardGroupScreen extends StatefulWidget {
  const DashBoardGroupScreen({
    super.key,
    required this.group,
    this.moveItem,
    required this.onGroupCreated,
    this.enableRemoveIcon = false,
  });

  final DashBoardGroupItem group;
  final DashBoardItem? moveItem;
  final Function(DashBoardGroupItem group) onGroupCreated;
  final bool enableRemoveIcon;

  @override
  State<DashBoardGroupScreen> createState() => _DashBoardGroupScreenState();
}

class _DashBoardGroupScreenState extends State<DashBoardGroupScreen> {
  final FocusNode node = FocusNode();
  late final TextEditingController controller = TextEditingController(
    text: widget.group.title,
  );

  int _page = 0;

  bool enableRemoveButton = false;

  bool isChanged = false;

  late DashBoardGroupItem _group;

  Offset? _dragPosition;

  BuildContext? recorderCtx;

  bool _isDraging = false;

  bool _disableUpdate = false;

  @override
  void initState() {
    _group = widget.group;
    if (widget.moveItem != null && widget.moveItem is DashBoardGroupItem) {
      _group.items.addAll((widget.moveItem as DashBoardGroupItem).items);
    }
    enableRemoveButton = widget.enableRemoveIcon;
    super.initState();
  }

  @override
  void dispose() {
    if (isChanged) {
      NotificationCenter.post(channel: changeGroupEvent, options: _group);
    }
    controller.dispose();
    node.dispose();
    super.dispose();
  }

  void calculateDraggablePositionFromOut(DashBoardItem item) {
    if(!_isDraging) return;
    if (recorderCtx == null) return;
    final box = recorderCtx?.findRenderObject() as RenderBox?;
    final offset = box?.localToGlobal(Offset.zero);
    if (offset == null) return;
    if (_dragPosition == null) return;
    if (_dragPosition!.dy + 100 < offset.dy ||
        _dragPosition!.dy > box!.size.height + offset.dy) {
      _disableUpdate = true;
      _group = _group.copyWith(
        items: _group.items.where((e) => e.id != item.id).toList(),
      );
      isChanged = true;
      if(_group.items.length == 1) {
        NotificationCenter.post(
          channel: addDashBoardItemEvent,
          options: _group.items.first,
        );
        _group = _group.copyWith(items: []);
      }
      NotificationCenter.post(
        channel: addDashBoardItemEvent,
        options: item,
      );
      Future.delayed(const Duration(milliseconds: 300), () {
        if(Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  void onUpdate(list) {
    if(_disableUpdate) return;
    isChanged = true;
    final items = (list ?? [])
        .map((e) => (e.widget as AppWidget).app as DashBoardIconItem)
        .toList();
    setState(() {
      _group = _group.copyWith(items: items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: GestureDetector(
          onTap: () {
            if (controller.text.trim().isEmpty) return;
            if (node.hasFocus) {
              node.unfocus();
              return;
            }
            widget.onGroupCreated.call(
              widget.group.copyWith(
                items: [
                  ...widget.group.items,
                  if (widget.moveItem != null &&
                      widget.moveItem is DashBoardIconItem)
                    widget.moveItem as DashBoardIconItem,
                  if (widget.moveItem != null &&
                      widget.moveItem is DashBoardGroupItem)
                    ...(widget.moveItem as DashBoardGroupItem).items,
                ],
                title: controller.text,
              ),
            );
            Navigator.of(context).pop();
          },
          behavior: HitTestBehavior.opaque,
          onLongPress: () {
            setState(() {
              enableRemoveButton = true;
            });
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(.5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(),
                AnimatedBuilder(
                  animation: node,
                  builder: (_, __) {
                    return TextFormField(
                      controller: controller,
                      focusNode: node,
                      textAlign: TextAlign.center,
                      cursorHeight: 30,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        fillColor: node.hasFocus
                            ? const Color.fromRGBO(17, 17, 17, 0.40)
                            : Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (node.hasFocus)
                              IconButton(
                                onPressed: controller.clear,
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                _GroupItemBuilder(
                  builder: (ctx) {
                    recorderCtx = ctx;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          enableRemoveButton = false;
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Hero(
                          tag: widget.group.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 16.0,
                                  sigmaY: 16.0,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 32,
                                  height:
                                      (MediaQuery.of(context).size.width - 32) +
                                          20,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(17, 17, 17, 0.40),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Builder(
                                    builder: (_) {
                                      if (widget.group.items.length <= 9) {
                                        return ReorderableStaggeredScrollView
                                            .grid(
                                          key: UniqueKey(),
                                          isLongPressDraggable: false,
                                          padding: const EdgeInsets.all(16),
                                          enable: enableRemoveButton,
                                          onGroup: (p1, p2) {},
                                          onDragStarted: (_) {
                                            _isDraging = true;
                                          },
                                          onDragUpdate: (_, p1) {
                                            final i =
                                                (p1.widget as AppWidget).app;
                                            calculateDraggablePositionFromOut(
                                                i);
                                          },
                                          onDraggablePosition: (offset) {
                                            _dragPosition = offset;
                                          },
                                          onDragEnd: (_, __) {
                                            _isDraging = false;
                                          },
                                          children: [
                                            if (enableRemoveButton)
                                              ..._group.items.map(
                                                (e) =>
                                                    ReorderableStaggeredScrollViewGridItem(
                                                  key: ValueKey(e.id),
                                                  widget: AppWidgetGroupBuilder(
                                                    app: e,
                                                    enableEditMode:
                                                        enableRemoveButton,
                                                    onRemoved: () {
                                                      isChanged = true;
                                                      setState(
                                                        () {
                                                          _group =
                                                              _group.copyWith(
                                                            items: _group.items
                                                                .where((i) =>
                                                                    i.id !=
                                                                    e.id)
                                                                .toList(),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  mainAxisCellCount: e.height,
                                                  crossAxisCellCount: e.width,
                                                ),
                                              ),
                                            if (!enableRemoveButton)
                                              ..._group.items.map(
                                                (e) =>
                                                    ReorderableStaggeredScrollViewGridItem(
                                                  key: ValueKey(e.id),
                                                  mainAxisCellCount: e.height,
                                                  crossAxisCellCount: e.width,
                                                  widget: AppWidgetGroupBuilder(
                                                    app: e,
                                                    enableEditMode:
                                                        enableRemoveButton,
                                                    onRemoved: () {
                                                      isChanged = true;
                                                      setState(() {
                                                        _group =
                                                            _group.copyWith(
                                                          items: _group.items
                                                              .where((i) =>
                                                                  i.id != e.id)
                                                              .toList(),
                                                        );
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if (widget.moveItem != null &&
                                                widget.moveItem
                                                    is DashBoardIconItem)
                                              ReorderableStaggeredScrollViewGridItem(
                                                key: ValueKey(
                                                    widget.moveItem!.id),
                                                widget: AppWidgetGroupBuilder(
                                                  app: widget.moveItem!,
                                                  enableEditMode:
                                                      enableRemoveButton,
                                                  onRemoved: () {},
                                                ),
                                                mainAxisCellCount:
                                                    widget.moveItem!.height,
                                                crossAxisCellCount:
                                                    widget.moveItem!.width,
                                              ),
                                          ],
                                          crossAxisCount: 3,
                                          onChildrenChanged: onUpdate,
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: PageView(
                                              onPageChanged: (page) {
                                                setState(() {
                                                  _page = page;
                                                });
                                              },
                                              children: buildLayout(),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Builder(
                                            builder: (ctx) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                2,
                                                (index) =>
                                                    _buildDot(ctx, index),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildLayout() {
    return [
      ReorderableStaggeredScrollView.grid(
        key: UniqueKey(),
        isLongPressDraggable: false,
        padding: const EdgeInsets.all(16),
        enable: enableRemoveButton,
        onGroup: (p1, p2) {},
        onDragStarted: (_) {
          _isDraging = true;
        },
        onDragEnd: (_, __) {
          _isDraging = false;
        },
        onDragUpdate: (_, p1) {
          final i = (p1.widget as AppWidget).app;
          calculateDraggablePositionFromOut(i);
        },
        onDraggablePosition: (offset) {
          _dragPosition = offset;
        },
        children: [
          if (enableRemoveButton)
            ..._group.items.take(9).map(
                  (e) => ReorderableStaggeredScrollViewGridItem(
                    key: ValueKey(e.id),
                    widget: AppWidgetGroupBuilder(
                      app: e,
                      enableEditMode: enableRemoveButton,
                      onRemoved: () {
                        context.removeConfirm(onRemoved: () {
                          isChanged = true;
                          setState(() {
                            _group = _group.copyWith(
                              items: _group.items
                                  .where((i) => i.id != e.id)
                                  .toList(),
                            );
                          });
                        });
                      },
                    ),
                    mainAxisCellCount: e.height,
                    crossAxisCellCount: e.width,
                  ),
                ),
          if (!enableRemoveButton)
            ..._group.items.take(9).map(
                  (e) => ReorderableStaggeredScrollViewGridItem(
                    key: ValueKey(e.id),
                    mainAxisCellCount: e.height,
                    crossAxisCellCount: e.width,
                    widget: AppWidgetGroupBuilder(
                      app: e,
                      enableEditMode: enableRemoveButton,
                      onRemoved: () {
                        isChanged = true;
                        setState(() {
                          _group = _group.copyWith(
                            items: _group.items
                                .where((i) => i.id != e.id)
                                .toList(),
                          );
                        });
                      },
                    ),
                  ),
                ),
          if (widget.moveItem != null)
            ReorderableStaggeredScrollViewGridItem(
              key: ValueKey(widget.moveItem!.id),
              widget: AppWidgetGroupBuilder(
                app: widget.moveItem!,
                enableEditMode: enableRemoveButton,
                onRemoved: () {},
              ),
              mainAxisCellCount: widget.moveItem!.height,
              crossAxisCellCount: widget.moveItem!.width,
            ),
        ],
        crossAxisCount: 3,
        onChildrenChanged: onUpdate,
      ),
      ReorderableStaggeredScrollView.grid(
        key: UniqueKey(),
        isLongPressDraggable: false,
        padding: const EdgeInsets.all(16),
        enable: enableRemoveButton,
        onGroup: (p1, p2) {},
        onDragStarted: (_) {
          _isDraging = true;
        },
        onDragEnd: (_, __) {
          _isDraging = false;
        },
        onDragUpdate: (_, p1) {
          final i = (p1.widget as AppWidget).app;
          calculateDraggablePositionFromOut(i);
        },
        onDraggablePosition: (offset) {
          _dragPosition = offset;
        },
        children: [
          if (enableRemoveButton)
            ..._group.items.sublist(9).map(
                  (e) => ReorderableStaggeredScrollViewGridItem(
                    key: ValueKey(e.id),
                    widget: AppIconAnimation(
                      child: AppWidget(
                        app: e,
                        enableRemoveIcon: enableRemoveButton,
                        onRemoved: () {
                          context.removeConfirm(onRemoved: () {
                            isChanged = true;
                            setState(() {
                              _group = _group.copyWith(
                                items: _group.items
                                    .where((i) => i.id != e.id)
                                    .toList(),
                              );
                            });
                          });
                        },
                      ),
                    ),
                    mainAxisCellCount: e.height,
                    crossAxisCellCount: e.width,
                  ),
                ),
          if (!enableRemoveButton)
            ..._group.items.sublist(9).map(
                  (e) => ReorderableStaggeredScrollViewGridItem(
                    key: ValueKey(e.id),
                    mainAxisCellCount: e.height,
                    crossAxisCellCount: e.width,
                    widget: AppWidget(
                      app: e,
                      enableRemoveIcon: enableRemoveButton,
                      onRemoved: () {
                        isChanged = true;
                        setState(() {
                          _group = _group.copyWith(
                            items: _group.items
                                .where((i) => i.id != e.id)
                                .toList(),
                          );
                        });
                      },
                    ),
                  ),
                ),
          if (widget.moveItem != null)
            ReorderableStaggeredScrollViewGridItem(
              key: ValueKey(widget.moveItem!.id),
              widget: AppWidget(
                app: widget.moveItem!,
                enableRemoveIcon: enableRemoveButton,
              ),
              mainAxisCellCount: widget.moveItem!.height,
              crossAxisCellCount: widget.moveItem!.width,
            ),
        ],
        crossAxisCount: 3,
        onChildrenChanged: onUpdate,
      ),
    ];
  }

  Widget _buildDot(BuildContext context, int index) {
    final page = _page;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: page == index ? Colors.white : Colors.white.withOpacity(.2),
      ),
    );
  }
}

class _GroupItemBuilder extends StatefulWidget {
  const _GroupItemBuilder({super.key, required this.builder});

  final Function(BuildContext context) builder;

  @override
  State<_GroupItemBuilder> createState() => _GroupItemBuilderState();
}

class _GroupItemBuilderState extends State<_GroupItemBuilder> {
  @override
  void didUpdateWidget(covariant _GroupItemBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String? get barrierLabel => '';
}
