import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum BottomBarType {
  c,
  p,
  e;

  factory BottomBarType.fromIndex(int index) {
    return BottomBarType.values[index];
  }

  BottomBarType get end {
    if (BottomBarType.c == this) return BottomBarType.e;
    if (BottomBarType.p == this) return BottomBarType.e;
    return BottomBarType.p;
  }

  BottomBarType get begin {
    if (BottomBarType.c == this) return BottomBarType.p;
    if (BottomBarType.p == this) return BottomBarType.c;
    return BottomBarType.c;
  }
}

class DashBoardBottomBar extends StatefulWidget {
  const DashBoardBottomBar({
    super.key,
    required this.type,
    required this.onChanged,
  });

  final BottomBarType type;
  final Function(BottomBarType type) onChanged;

  @override
  State<DashBoardBottomBar> createState() => _DashBoardBottomBarState();
}

class _DashBoardBottomBarState extends State<DashBoardBottomBar> {
  @override
  void didUpdateWidget(covariant DashBoardBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: kBottomNavigationBarHeight,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => widget.onChanged(widget.type.begin),
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageWidget(
                      Assets.icons_dashboard_bottom_bg.path,
                    ),
                    Text(
                      widget.type.begin.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff4B84F7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: ImageWidget(Assets.icons_dashboard_call.path),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: ImageWidget(Assets.icons_dashboard_message.path),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: ImageWidget(
                    Assets.icons_dashboard_plus.path,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: ImageWidget(
                    Assets.icons_dashboard_setting_bottom.path,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => widget.onChanged(widget.type.end),
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 2,
                      child: ImageWidget(
                        Assets.icons_dashboard_bottom_bg.path,
                      ),
                    ),
                    Text(
                      widget.type.end.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff4B84F7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
