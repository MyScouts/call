import 'package:flutter/material.dart';

class SegmentPicker extends StatelessWidget {
  const SegmentPicker({
    super.key,
    this.tabController,
    required this.tabs,
    this.tabColor = Colors.white,
    this.selectedTextColor = Colors.black,
    this.unselectedTextColor = const Color(0xff6E6E6E),
  });

  final TabController? tabController;
  final List<String> tabs;
  final Color tabColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  TabController getTab(BuildContext context) =>
      tabController ?? DefaultTabController.of(context);

  @override
  Widget build(BuildContext context) {
    final controller = getTab(context);
    return LayoutBuilder(
      builder: (context, constrain) {
        return Container(
          width: constrain.maxWidth,
          height: 32,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xffE8EAEE),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(2.0),
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              final index = controller.index;
              final iW = (constrain.maxWidth - 36) / tabs.length;
              final left = index * iW;
              return Stack(
                children: [
                  ...List.generate(tabs.length - 1, (i) {
                    if (i == index) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      top: 6,
                      left: iW * (i + 1),
                      bottom: 6,
                      child: const VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Color(0xff424B5E),
                      ),
                    );
                  }),
                  AnimatedPositioned(
                    left: left,
                    duration: const Duration(milliseconds: 150),
                    child: Container(
                      width: iW,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: tabColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFB6BEC9),
                            offset: Offset(1, 1),
                            spreadRadius: 0.5,
                            blurRadius: 1.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(children: buildTitle(context)),
                ],
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> buildTitle(BuildContext context) {
    final controller = getTab(context);
    return List<Widget>.generate(
      tabs.length,
      (index) => Expanded(
        child: GestureDetector(
          onTap: () => controller.index = index,
          behavior: HitTestBehavior.opaque,
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              FontWeight fontWeight = FontWeight.w400;
              if (controller.index == index) {
                fontWeight = FontWeight.w600;
              }
              return Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    height: 1.2,
                    color: controller.index == index
                        ? selectedTextColor
                        : unselectedTextColor,
                    fontWeight: fontWeight,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
