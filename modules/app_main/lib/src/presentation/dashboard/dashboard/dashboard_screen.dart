import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:reorderable/reorderable.dart';

double calculateItemSize(double maxWith, double padding) {
  return (maxWith / 4) - padding;
}

class DashboardScreen extends StatefulWidget {
  static const String routeName = "dashboard";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentPage = 0;
  final appListeners = [
    ValueNotifier<List<AppItem>>([]),
    ValueNotifier<List<AppItem>>([]),
    ValueNotifier<List<AppItem>>([]),
  ];
  @override
  void initState() {
    super.initState();
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            _currentPage == index ? Colors.white : Colors.white.withOpacity(.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ImageWidget(
              ImageConstants.defaultBgDashboard,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                StatusBarWidget(
                  openAppStore: () async {
                    context.showAppStore(
                      initApp: appListeners[_currentPage].value,
                      onCompleted: (apps) {
                        appListeners[_currentPage].value = [];
                        Future.delayed(const Duration(milliseconds: 100), () {
                          appListeners[_currentPage].value = apps;
                        });
                      },
                    );
                  },
                ),
                Expanded(
                  child: PageView(
                    children: DashboardType.values
                        .map(
                          (type) => PageScreen(
                            type: type,
                            appListener: appListeners[
                                DashboardType.values.indexOf(type)],
                          ),
                        )
                        .toList(),
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: paddingHorizontal,
            right: paddingHorizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, _buildDot),
                ),
                const SizedBox(height: 15),
                const DockWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageScreen extends StatefulWidget {
  final DashboardType type;
  final ValueNotifier<List<AppItem>> appListener;
  const PageScreen({
    super.key,
    required this.type,
    required this.appListener,
  });

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen>
    with AutomaticKeepAliveClientMixin<PageScreen> {
  final ValueNotifier<bool> _isLongPress = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case DashboardType.personal:
        widget.appListener.value = AppItem.personalApps;
        break;
      default:
        widget.appListener.value = AppItem.personalApps;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: size.width,
        height: size.height,
        child: ValueListenableBuilder(
          valueListenable: widget.appListener,
          builder: (context, apps, child) {
            if (apps.isEmpty) return Container();
            return ReorderableStaggeredScrollView.grid(
              enable: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              onWillAccept: (p0, p1, p2) {
                final item1 = p0 as ReorderableStaggeredScrollViewGridItem;
                final item2 = p1 as ReorderableStaggeredScrollViewGridItem;
                // debugPrint("onWillAccept ${item1.key}");
                // debugPrint("onWillAccept ${item2.key}");
                return true;
              },
              isLongPressDraggable: true,
              onDragEnd: (p0, p1) {
                final data = p1.key;
                print(data);
              },
              children: apps.map((item) {
                item.sort = apps.indexOf(item);
                return ReorderableStaggeredScrollViewGridItem(
                  key: ValueKey(item.id.toString()),
                  mainAxisCellCount: item.height,
                  crossAxisCellCount: item.width,
                  widget: AppWidget(
                    app: item,
                    isLongPress: _isLongPress,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
