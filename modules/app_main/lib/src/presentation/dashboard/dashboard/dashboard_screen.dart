import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:reorderable_staggered_scroll_view/reorderable_staggered_scroll_view.dart';

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
  late List<AppItem> list1;
  late List<AppItem> list2;
  late List<AppItem> list3;

  @override
  void initState() {
    super.initState();
    list1 = [
      AppItem(
        avatar: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        avatar: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        avatar: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        avatar: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
      AppItem(
        avatar: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        avatar: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        avatar: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        avatar: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
    ];
    list2 = [
      AppItem(
        avatar: ImageConstants.bgLocket,
        title: "Locket",
      ),
    ];
    list3 = [
      AppItem(
        avatar: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
    ];
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
    final maxWidth = MediaQuery.of(context).size.width;
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
                StatusBarWidget(),
                Expanded(
                  child: PageView(
                    children: [
                      PageScreen(
                        items: list1,
                        maxWidth: maxWidth,
                      ),
                      PageScreen(
                        items: list2,
                        maxWidth: maxWidth,
                      ),
                      PageScreen(
                        items: list3,
                        maxWidth: maxWidth,
                      ),
                    ],
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
                const SizedBox(height: 10),
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
  const PageScreen({super.key, required this.items, required this.maxWidth});
  final List<AppItem> items;
  final double maxWidth;

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  final ValueNotifier<bool> reBuild = ValueNotifier(true);
  final ValueNotifier<bool> _isLongPress = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: size.width,
        height: size.height,
        child: ValueListenableBuilder(
          valueListenable: reBuild,
          builder: (context, value, child) {
            if (value == false) return Container();
            return ReorderableStaggeredScrollView.grid(
              enable: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              isLongPressDraggable: true,
              onDragEnd: (details, item) {
                print('onDragEnd: $details ${item.key}');
              },
              children: widget.items.map((item) {
                final app = AppItem(avatar: item.avatar, title: item.title);
                return ReorderableStaggeredScrollViewGridItem(
                  key: ValueKey(item.toString()),
                  mainAxisCellCount: app.height,
                  crossAxisCellCount: app.width,
                  widget: AppWidget(
                    app: app,
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
}


// onPressed: () async {
//                                 _tiles
//                                     .removeWhere((element) => element == item);
//                                 reBuild.value = false;
//                                 await Future.delayed(
//                                   const Duration(milliseconds: 100),
//                                   () {
//                                     reBuild.value = true;
//                                   },
//                                 );
//                                 print('onDragEnd: ${item.key}');
//                                 setState(() {});
//                               },