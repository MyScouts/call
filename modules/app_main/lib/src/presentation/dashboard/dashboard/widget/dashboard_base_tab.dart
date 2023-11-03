import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderable/reorderable.dart';

import 'app_widget.dart';
import 'dashboard_group_screen.dart';

class DashBoardBaseState<T extends DashboardBaseBloc, S extends StatefulWidget>
    extends State<S> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => getIt<T>(),
      child: BlocBuilder<T, DashboardBaseState>(
        builder: (context, state) {
          if (state is DashboardBaseInitial) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReorderableStaggeredScrollView.grid(
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
                final data = p1.key;
                print(data);
              },
              onGroup: (moveData, data) {
                final item1 =
                    moveData as ReorderableStaggeredScrollViewGridItem;
                final item2 = data as ReorderableStaggeredScrollViewGridItem;
                debugPrint("onGroup ${item1.key}");
                debugPrint("onGroup ${item2.key}");

                showDialog(
                  useSafeArea: false,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (_) => DashBoardGroupScreen(
                    item: (item1.widget as AppWidget).app,
                    moveItem: (item2.widget as AppWidget).app,
                  ),
                );
              },
              children:
                  (state as DashboardBaseFetchDataSuccess).item.map((item) {
                return ReorderableStaggeredScrollViewGridItem(
                  key: ValueKey(item.id),
                  mainAxisCellCount: item.height,
                  crossAxisCellCount: item.width,
                  widget: AppWidget(app: item),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
