import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/widget/clock_widget.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    _group = widget.group;
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
                  if (widget.moveItem != null)
                    widget.moveItem as DashBoardIconItem
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      enableRemoveButton = false;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
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
                          height: (MediaQuery.of(context).size.width - 32) + 20,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(17, 17, 17, 0.40),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Builder(
                            builder: (_) {
                              if (widget.group.items.length <= 9) {
                                return GridView.count(
                                  padding: const EdgeInsets.all(16.0),
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  children: [
                                    if (enableRemoveButton)
                                      ..._group.items.map(
                                        (e) => AppIconAnimation(
                                          child: AppWidget(
                                            app: e,
                                            enableRemoveIcon:
                                                enableRemoveButton,
                                            onRemoved: () {
                                              context.removeConfirm(
                                                  onRemoved: () {
                                                isChanged = true;
                                                setState(() {
                                                  _group = _group.copyWith(
                                                    items: _group.items
                                                        .where(
                                                            (i) => i.id != e.id)
                                                        .toList(),
                                                  );
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    if (!enableRemoveButton)
                                      ..._group.items.map(
                                        (e) => AppWidget(
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
                                    if (widget.moveItem != null)
                                      AppWidget(
                                        app: widget.moveItem!,
                                        enableRemoveIcon: enableRemoveButton,
                                      ),
                                  ],
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
                                      children: [
                                        GridView.count(
                                          padding: const EdgeInsets.all(16.0),
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          shrinkWrap: true,
                                          children: [
                                            if (enableRemoveButton)
                                              ..._group.items.take(9).map(
                                                    (e) => AppIconAnimation(
                                                      child: AppWidget(
                                                        app: e,
                                                        enableRemoveIcon:
                                                            enableRemoveButton,
                                                        onRemoved: () {
                                                          context.removeConfirm(
                                                              onRemoved: () {
                                                            isChanged = true;
                                                            setState(() {
                                                              _group = _group
                                                                  .copyWith(
                                                                items: _group
                                                                    .items
                                                                    .where((i) =>
                                                                        i.id !=
                                                                        e.id)
                                                                    .toList(),
                                                              );
                                                            });
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                            if (!enableRemoveButton)
                                              ..._group.items.take(9).map(
                                                    (e) => AppWidget(
                                                      app: e,
                                                      enableRemoveIcon:
                                                          enableRemoveButton,
                                                      onRemoved: () {
                                                        isChanged = true;
                                                        setState(() {
                                                          _group =
                                                              _group.copyWith(
                                                            items: _group.items
                                                                .where((i) =>
                                                                    i.id !=
                                                                    e.id)
                                                                .toList(),
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ),
                                            if (widget.moveItem != null)
                                              AppWidget(
                                                app: widget.moveItem!,
                                                enableRemoveIcon:
                                                    enableRemoveButton,
                                              ),
                                          ],
                                        ),
                                        GridView.count(
                                          padding: const EdgeInsets.all(16.0),
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          shrinkWrap: true,
                                          children: [
                                            if (enableRemoveButton)
                                              ..._group.items.sublist(9).map(
                                                    (e) => AppIconAnimation(
                                                      child: AppWidget(
                                                        app: e,
                                                        enableRemoveIcon:
                                                            enableRemoveButton,
                                                        onRemoved: () {
                                                          context.removeConfirm(
                                                              onRemoved: () {
                                                            isChanged = true;
                                                            setState(() {
                                                              _group = _group
                                                                  .copyWith(
                                                                items: _group
                                                                    .items
                                                                    .where((i) =>
                                                                        i.id !=
                                                                        e.id)
                                                                    .toList(),
                                                              );
                                                            });
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                            if (!enableRemoveButton)
                                              ..._group.items.sublist(9).map(
                                                    (e) => AppWidget(
                                                      app: e,
                                                      enableRemoveIcon:
                                                          enableRemoveButton,
                                                      onRemoved: () {
                                                        isChanged = true;
                                                        setState(() {
                                                          _group =
                                                              _group.copyWith(
                                                            items: _group.items
                                                                .where((i) =>
                                                                    i.id !=
                                                                    e.id)
                                                                .toList(),
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ),
                                            if (widget.moveItem != null)
                                              AppWidget(
                                                app: widget.moveItem!,
                                                enableRemoveIcon:
                                                    enableRemoveButton,
                                              ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Builder(
                                    builder: (ctx) => Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        3,
                                            (index) => _buildDot(ctx, index),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
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
