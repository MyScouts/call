import 'dart:math';

import 'package:app_main/src/presentation/call/phone_book/phone_book_page.dart';
import 'package:app_main/src/presentation/chat/conversation/conversation_page.dart';
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
    required this.onFabChange,
  });

  final BottomBarType type;
  final Function(BottomBarType type) onChanged;
  final Function(bool value) onFabChange;

  @override
  State<DashBoardBottomBar> createState() => _DashBoardBottomBarState();
}

class _DashBoardBottomBarState extends State<DashBoardBottomBar> {
  bool showFab = false;
  late final GlobalKey<FabBoxAnimationState> bKey =
      GlobalKey<FabBoxAnimationState>();

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
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Container(
          height: kBottomNavigationBarHeight,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onChanged(widget.type.begin);
                    setState(() {
                      showFab = false;
                    });
                  },
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
                  onTap: () {
                    Navigator.pushNamed(context, PhoneBookPage.routeName);
                    setState(() {
                      showFab = false;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: ImageWidget(Assets.icons_dashboard_call.path),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ConversationPage.routeName,
                    );
                    setState(() {
                      showFab = false;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: ImageWidget(Assets.icons_dashboard_message.path),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        showFab = !showFab;
                      });
                      widget.onFabChange(showFab);
                      if(showFab) {
                        bKey.currentState?.forward();
                      } else {
                        bKey.currentState?.revert();
                      }
                    }
                  },
                  behavior: HitTestBehavior.opaque,
                  child: _FabBoxAnimation(showFab: showFab, key: bKey),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showFab = false;
                    });
                  },
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
                  onTap: () {
                    widget.onChanged(widget.type.end);
                    setState(() {
                      showFab = false;
                    });
                  },
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
      ),
    );
  }
}

class _FabBoxAnimation extends StatefulWidget {
  const _FabBoxAnimation({super.key, required this.showFab});

  final bool showFab;

  @override
  State<_FabBoxAnimation> createState() => FabBoxAnimationState();
}

class FabBoxAnimationState extends State<_FabBoxAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late bool _showFab;

  void forward() => controller.forward();

  void revert() => controller.reverse();

  @override
  void initState() {
    _showFab = widget.showFab;
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    animation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ));
  }

  @override
  void didUpdateWidget(covariant _FabBoxAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showFab != widget.showFab) {
      if (mounted) {
        setState(() {
          _showFab = widget.showFab;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _showFab ? const Color(0xffE8F0FE) : Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return Transform.rotate(
              angle: animation.value,
              child: ImageWidget(
                Assets.icons_dashboard_setting_bottom.path,
              ),
            );
          },
        ),
      ),
    );
  }
}
