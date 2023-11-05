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
  late final DashBoardController dashBoardController;

  @override
  void initState() {
    bloc = getIt<T>();
    dashBoardController = DashBoardController();
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
        if (!(controller.page == 0 && S == DashBoardCommunityTab) &&
            !(controller.page == 1 && S == DashBoardPersonalTab) &&
            !(controller.page == 2 && S == DashBoardEcommerceTab)) return;
        if ((data as DashBoardGroupItem).items.isEmpty) {
          bloc.add(RemoveItem(data));
          return;
        }
        bloc.add(ChangeGroup(data));
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
            child: GestureDetector(
              onTap: () {
                dashBoardController.enableRemoveIcon = false;
              },
              behavior: HitTestBehavior.opaque,
              child: Stack(
                children: [
                  ReorderableStaggeredScrollView.grid(
                    key: UniqueKey(),
                    enable: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 4,
                    onChildrenChanged: (list) {
                      final items = (list ?? [])
                          .map((e) => (e.widget as AppWidget).app)
                          .toList();
                      ctx.read<T>().add(ChangeItem(items));
                    },
                    onAccept: (p0, p1, p2) {
                      final item1 =
                          p0 as ReorderableStaggeredScrollViewGridItem;
                      final item2 =
                          p1 as ReorderableStaggeredScrollViewGridItem;
                      debugPrint("onAccept ${item1.key}");
                      debugPrint("onAccept ${item2.key}");
                      return true;
                    },
                    onDragStarted: (_) =>
                        dashBoardController.enableRemoveIcon = true,
                    isLongPressDraggable: true,
                    onDragEnd: (p0, p1) {},
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
                        widget: AppWidgetBuilder(
                          app: item,
                          controller: dashBoardController,
                          onRemoved: () {
                            bloc.add(RemoveItem(item));
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DashBoardController extends ChangeNotifier {
  bool _enableRemoveIcon = false;

  set enableRemoveIcon(bool value) {
    _enableRemoveIcon = value;
    notifyListeners();
  }

  bool get enableRemoveIcon => _enableRemoveIcon;
}
