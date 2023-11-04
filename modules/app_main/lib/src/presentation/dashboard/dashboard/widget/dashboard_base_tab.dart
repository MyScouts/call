import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderable/reorderable.dart';

import 'app_group_widget.dart';
import 'app_widget.dart';
import 'dashboard_group_screen.dart';

class DashBoardBaseState<T extends DashboardBaseBloc, S extends StatefulWidget>
    extends State<S> with AutomaticKeepAliveClientMixin {
  late final T bloc;

  final GlobalKey trashKey = GlobalKey<_TrashIconState>();

  @override
  void initState() {
    bloc = getIt<T>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotificationCenter.subscribe(
      channel: addDashBoardItemEvent,
      observer: this,
      onNotification: (data) {
        final controller = context
            .findAncestorWidgetOfExactType<DashBoardInheritedData>()
            ?.pageController;
        if (controller == null) return;
        if (controller.page == 0 && S == DashBoardCommunityTab) {
          bloc.add(AddItem(data));
        } else if (controller.page == 1 && S == DashBoardPersonalTab) {
          bloc.add(AddItem(data));
        } else if (controller.page == 2 && S == DashBoardEcommerceTab) {
          bloc.add(AddItem(data));
        }
      },
    );

    NotificationCenter.subscribe(
      channel: changeGroupEvent,
      observer: this,
      onNotification: (data) {
        final controller = context
            .findAncestorWidgetOfExactType<DashBoardInheritedData>()
            ?.pageController;
        if (controller == null) return;
        if (controller.page == 0 && S == DashBoardCommunityTab) {
          bloc.add(ChangeGroup(data));
        } else if (controller.page == 1 && S == DashBoardPersonalTab) {
          bloc.add(ChangeGroup(data));
        } else if (controller.page == 2 && S == DashBoardEcommerceTab) {
          bloc.add(ChangeGroup(data));
        }
      },
    );
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(
      channel: addDashBoardItemEvent,
      observer: this,
    );
    NotificationCenter.unsubscribe(
      channel: changeGroupEvent,
      observer: this,
    );
    super.dispose();
  }

  bool validateGroupItem(DashBoardItem item1, DashBoardItem item2) {
    if (item1.isWidget && (item2.isIcon || item2.isGroup)) {
      return false;
    }
    if (item2.isWidget && (item1.isIcon || item1.isGroup)) {
      return false;
    }
    if (item1.isGroup && item2.isIcon) {
      return false;
    }

    return true;
  }

  List<DashBoardItem> newGroup(
    List<DashBoardItem> items,
    DashBoardGroupItem group,
  ) {
    return items.map((e) {
      if (e.id == group.id) return group;
      return e;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<T, DashboardBaseState>(
        builder: (ctx, state) {
          if (state is DashboardBaseInitial) {
            return const SizedBox.shrink();
          }

          final items = (state as DashboardBaseFetchDataSuccess).items;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                ReorderableStaggeredScrollView.grid(
                  key: UniqueKey(),
                  enable: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  onAccept: (p0, p1, p2) {
                    final item1 = p0 as ReorderableStaggeredScrollViewGridItem;
                    final item2 = p1 as ReorderableStaggeredScrollViewGridItem;
                    debugPrint("onAccept ${item1.key}");
                    debugPrint("onAccept ${item2.key}");
                    return true;
                  },
                  isLongPressDraggable: true,
                  onDragEnd: (p0, p1) {
                    // (trashKey.currentState as _TrashIconState).disable();
                  },
                  onGroup: (moveData, data) {
                    final item1 =
                        moveData as ReorderableStaggeredScrollViewGridItem;
                    final item2 =
                        data as ReorderableStaggeredScrollViewGridItem;
                    debugPrint("onGroup ${item1.key}");
                    debugPrint("onGroup ${item2.key}");

                    final icon1 = (item1.widget as AppWidget).app;
                    final icon2 = (item2.widget as AppWidget).app;

                    if (!validateGroupItem(icon1, icon2)) return;

                    final isGroup = icon2 is DashBoardGroupItem;
                    DashBoardGroupItem groupItem;
                    if (isGroup) {
                      groupItem = icon2;
                    } else {
                      groupItem = DashBoardGroupItem(
                        id: UniqueKey().toString(),
                        items: [icon2 as DashBoardIconItem],
                        title: 'Thư mục',
                        backgroundImage: '',
                      );
                    }

                    showDialog(
                      useSafeArea: false,
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (_) => DashBoardGroupScreen(
                        group: groupItem,
                        moveItem: icon1,
                        onGroupCreated: (DashBoardGroupItem group) {
                          if (isGroup) {
                            ctx.read<T>().add(AddItemToGroup(group, [icon1]));
                          } else {
                            ctx.read<T>().add(AddItem(group));
                          }
                        },
                      ),
                    );
                  },
                  // onDragStarted: (item) {
                  //   (trashKey.currentState as _TrashIconState).enable();
                  // },
                  children: items.map((item) {
                    if (item is DashBoardGroupItem) {
                      return ReorderableStaggeredScrollViewGridItem(
                        key: ValueKey(item.id),
                        mainAxisCellCount: item.height,
                        crossAxisCellCount: item.width,
                        widget: AppGroupWidget(app: item),
                      );
                    }

                    return ReorderableStaggeredScrollViewGridItem(
                      key: ValueKey(item.id),
                      mainAxisCellCount: item.height,
                      crossAxisCellCount: item.width,
                      widget: AppWidget(app: item),
                    );
                  }).toList(),
                ),
                TrashIcon(key: trashKey)
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TrashIcon extends StatefulWidget {
  const TrashIcon({super.key});

  @override
  State<TrashIcon> createState() => _TrashIconState();
}

class _TrashIconState extends State<TrashIcon> {
  bool showIcon = false;

  void enable() {
    if (mounted) {
      setState(() {
        showIcon = true;
      });
    }
  }

  void disable() {
    if (mounted) {
      setState(() {
        showIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showIcon) {
      return DragTarget(
        onWillAccept: (move) {
          return false;
        },
        onAccept: (_) {
        },
        builder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.5),
              radius: 20,
              child: const Icon(
                Icons.restore_from_trash,
                color: Colors.white,
              ),
            ),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}
