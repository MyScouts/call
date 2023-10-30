import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_contants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
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
  late List<AppItem> list1;
  late List<AppItem> list2;
  late List<AppItem> list3;

  @override
  void initState() {
    super.initState();
    list1 = [
      AppItem(
        imageUrl: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        imageUrl: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        imageUrl: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
      AppItem(
        imageUrl: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        imageUrl: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        imageUrl: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
    ];
    list2 = [
      AppItem(
        imageUrl: ImageConstants.bgLocket,
        title: "Locket",
      ),
    ];
    list3 = [
      AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
    ];
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 10.0,
      height: 10.0,
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
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, _buildDot),
                ),
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
  List<GridItem> _tiles = [];
  final ValueNotifier<bool> reBuild = ValueNotifier(true);
  late double space = 0;

  @override
  void initState() {
    super.initState();
    double size = calculateItemSize(widget.maxWidth, paddingHorizontal);
    _tiles = widget.items.map((item) {
      return GridItem(item: item, size: size, height: 1, width: 1);
    }).toList();
    space = (widget.maxWidth - (size + 10) * 4 - (paddingHorizontal)) / 3;
    _tiles.add(GridItem(
      item: AppItem(
        imageUrl: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      size: size,
      height: 3,
      width: 2,
    ));
    _tiles.add(GridItem(
      item: AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
      height: 2,
      width: 4,
    ));
    _tiles.add(GridItem(
      item: AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
      height: 3,
      width: 2,
    ));
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      _tiles.insert(newIndex, _tiles.removeAt(oldIndex));
    });
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
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              isLongPressDraggable: false,
              onDragEnd: (details, item) {
                print('onDragEnd: $details ${item.key}');
              },
              children: _tiles
                  .map(
                    (item) => ReorderableStaggeredScrollViewGridItem(
                      key: ValueKey(item.toString()),
                      mainAxisCellCount: item.height,
                      crossAxisCellCount: item.width,
                      widget: Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        width: double.infinity,
                        height: double.infinity,
                        child: FocusedMenuHolder(
                          onPressed: () {},
                          menuItems: [
                            FocusedMenuItem(
                              title: Text("delete"),
                              trailingIcon: Icon(Icons.share),
                              onPressed: () async {
                                _tiles
                                    .removeWhere((element) => element == item);
                                reBuild.value = false;
                                await Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    reBuild.value = true;
                                  },
                                );
                                print('onDragEnd: ${item.key}');
                                setState(() {});
                              },
                            ),
                          ],
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: AspectRatio(
                                    aspectRatio: (item.width) / item.height,
                                    child: ImageWidget(
                                      item.item.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text("${item.height}:${item.width}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.item,
    required this.height,
    required this.width,
    this.size = 60,
  });
  final AppItem item;
  final double size;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width * size,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   AppRoutes.appDetail,
                  //   arguments: {
                  //     "app": item,
                  //   },
                  // );
                },
                child: Container(
                  width: width * size,
                  height: height * size,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageWidget(item.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
