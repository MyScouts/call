import 'package:app_main/src/presentation/dashboard/dashboard_contants.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

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
        imageUrl: "assets/images/facebook.jpg",
        title: "Facebook",
      ),
      AppItem(
        imageUrl: "assets/images/instagram.webp",
        title: "Instagram",
      ),
      AppItem(
        imageUrl: "assets/images/locket.webp",
        title: "Locket",
      ),
      AppItem(
        imageUrl: "assets/images/tiktok.webp",
        title: "Tiktok",
      ),
      AppItem(
        imageUrl: "assets/images/facebook.jpg",
        title: "Facebook",
      ),
      AppItem(
        imageUrl: "assets/images/instagram.webp",
        title: "Instagram",
      ),
      AppItem(
        imageUrl: "assets/images/locket.webp",
        title: "Locket",
      ),
      AppItem(
        imageUrl: "assets/images/tiktok.webp",
        title: "Tiktok",
      ),
    ];
    list2 = [
      AppItem(
        imageUrl: "assets/images/locket.webp",
        title: "Locket",
      ),
    ];
    list3 = [
      AppItem(
        imageUrl: "assets/images/tiktok.webp",
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
        color: _currentPage == index ? Colors.black87 : Colors.black38,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
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
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, _buildDot),
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
  List<Widget> _tiles = [];

  @override
  void initState() {
    super.initState();
    _tiles = widget.items.map((item) {
      return GridItem(item: item);
    }).toList();
    // final size = MediaQuery.of(context).size;
    final space = (widget.maxWidth - 68 * 4 - 60) / 3;
    _tiles.add(GridItem(
      item: AppItem(
        imageUrl: "assets/images/facebook.jpg",
        title: "Facebook",
      ),
      size: 128 + space,
    ));
    _tiles.add(GridItem(
      item: AppItem(
        imageUrl: "assets/images/tiktok.webp",
        title: "Tiktok",
      ),
      size: 128 + space,
    ));
  }

  // Widget feedback(List<DraggableGridItem> list, int index) {
  //   final maxWidth = MediaQuery.of(context).size.width;
  //   return Container(
  //     height: maxWidth/4,
  //     width: maxWidth/4,
  //     color: Colors.transparent,
  //     child: list[index].child,
  //   );
  // }

  // PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
  //   return PlaceHolderWidget(
  //     child: Container(
  //       color: Colors.transparent,
  //     ),
  //   );
  // }

  // void onDragAccept(
  //     List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
  //   log('onDragAccept: $beforeIndex -> $afterIndex');
  // }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      _tiles.insert(newIndex, _tiles.removeAt(oldIndex));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final space = (size.width - 68 * 4 - 60) / 3;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        width: size.width,
        height: size.height,
        child: ReorderableWrap(
          spacing: space,
          runSpacing: space - 14,
          onReorder: _onReorder,
          onNoReorder: (int index) {
            //this callback is optional
            debugPrint(
                '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
          },
          buildDraggableFeedback: (context, constraints, child) {
            return Container(
              color: Colors.transparent,
              child: child,
            );
          },
          children: _tiles,
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.item, this.size = 60});
  final AppItem item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: size + 8,
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
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(item.imageUrl)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
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
