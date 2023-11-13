import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:reorderable/reorderable.dart';
import 'package:staggered_reorderable/staggered_reorderable.dart';

import 'app_group_widget.dart';
import 'app_widget.dart';
import 'dashboard_group_screen.dart';

abstract class DashBoardBaseState<T extends DashboardBaseBloc,
        S extends StatefulWidget> extends State<S>
    with AutomaticKeepAliveClientMixin {
  late final T bloc;
  late final DashBoardController dashBoardController;
  bool _isDragging = false;

  void enableEditMode();

  void disableEditMode();

  @override
  void initState() {
    bloc = getIt<T>();
    dashBoardController = DashBoardController();
    super.initState();
    dashBoardController.addListener(() {
      if (dashBoardController.enableEditMode) {
        enableEditMode();
      } else {
        disableEditMode();
      }
    });
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
        if(!isPage) return;
        if ((data as DashBoardGroupItem).items.isEmpty) {
          bloc.add(RemoveItem(data));
          return;
        }
        bloc.add(ChangeGroup(data));
      },
    );

    NotificationCenter.subscribe(
      channel: cancelEditMode,
      observer: this,
      onNotification: (data) {
        if(!isPage) return;
        dashBoardController.enableEditMode = false;
      },
    );

    NotificationCenter.subscribe(
      channel: showEditMode,
      observer: this,
      onNotification: (data) {
        if(!isPage) return;
        dashBoardController.enableEditMode = true;
      },
    );
  }

  bool get isPage {
    final controller = context
        .findAncestorWidgetOfExactType<DashBoardInheritedData>()
        ?.pageController;
    if (controller == null) return false;
    if (!(controller.page == 0 && S == DashBoardCommunityTab) &&
        !(controller.page == 1 && S == DashBoardPersonalTab) &&
        !(controller.page == 2 && S == DashBoardEcommerceTab)) return false;
    return true;
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
    NotificationCenter.unsubscribe(
      channel: cancelEditMode,
      observer: this,
    );
    NotificationCenter.unsubscribe(
      channel: showEditMode,
      observer: this,
    );
    dashBoardController.dispose();
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

  List<ReorderableStaggeredScrollViewGridItem> notDragList = List.generate(
    10,
    (index) => ReorderableStaggeredScrollViewGridItem(
      mainAxisCellCount: 1,
      crossAxisCellCount: 1,
      widget: const AppEmptyWidget(
        app: DashBoardEmptyItem(),
      ),
      key: ValueKey('empty $index'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<T, DashboardBaseState>(
        buildWhen: (_, __) {
          if (_isDragging) return false;
          return true;
        },
        builder: (ctx, state) {
          if (state is DashboardBaseInitial) {
            return const SizedBox.shrink();
          }

          final items = (state as DashboardBaseFetchDataSuccess).items;

          return LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    dashBoardController.enableEditMode = false;
                  });
                },
                onLongPress: () {
                  setState(() {
                    dashBoardController.enableEditMode = true;
                  });
                },
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 5,
                    ),
                    child: StaggeredReorderableView.customer(
                      isDraggable: dashBoardController.enableEditMode,
                      padding: 10,
                      children: items
                          .map(
                            (e) => CustomerItem(
                              id: e.id,
                              mainAxisCellCount: e.height,
                              crossAxisCellCount: e.width,
                              child: AppWidgetBuilder(
                                app: e,
                                controller: dashBoardController,
                                onRemoved: () {
                                  context.removeConfirm(onRemoved: () {
                                    bloc.add(RemoveItem(e));
                                  });
                                },
                              ),
                            ),
                          )
                          .toList(),
                      onGroup: (moveData, toData) {
                        final item1 = moveData;
                        final item2 = toData;

                        final icon1 = (item1.child as AppWidget).app;
                        final icon2 = (item2.child as AppWidget).app;

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
                            enableRemoveIcon: true,
                            group: groupItem,
                            moveItem: icon1,
                            onGroupCreated: (DashBoardGroupItem group) {
                              if (isGroup) {
                                ctx
                                    .read<T>()
                                    .add(AddItemToGroup(group, [icon1]));
                              } else {
                                ctx.read<T>().add(AddItem(group));
                              }
                            },
                          ),
                        );
                      },
                      onChildrenChanged: (list) {
                        final items = (list ?? [])
                            .map((e) => (e.child as AppWidget).app)
                            .toList();

                        ctx.read<T>().add(ChangeItem(
                            items.where((e) => e.id != 'empty').toList()));
                      },
                      onDragStarted: () {
                        _isDragging = true;
                      },
                      onDragEnd: () {
                        _isDragging = false;
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DashBoardController extends ChangeNotifier {
  bool _enableEditMode = false;

  set enableEditMode(bool value) {
    _enableEditMode = value;
    notifyListeners();
  }

  bool get enableEditMode => _enableEditMode;
}
