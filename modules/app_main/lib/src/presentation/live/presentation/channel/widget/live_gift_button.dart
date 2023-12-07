import 'package:app_main/src/presentation/live/domain/entities/gift_card_list.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../live_channel_screen.dart';
import '../state/live_channel_controller.dart';

class LiveGiftButton extends StatefulWidget {
  const LiveGiftButton({super.key});

  @override
  State<LiveGiftButton> createState() => _LiveGiftButtonState();
}

class _LiveGiftButtonState extends State<LiveGiftButton> {
  String isIcon = IconAppConstants.icLiveGift;

  GiftCard? giftCard;

  Widget bodyGift() {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;

    return Obx(() {
      final times = controller.timesAnimation.value;
      return IgnorePointer(
        ignoring: times > 0,
        child: InkWell(
          onTap: () {
            context.showBottomGift(controller).then((value) {
              if (value is GiftCard) {
                giftCard = value;
                setState(() {
                  isIcon = value.imageGift!;
                });
              }
            });
          },
          child: SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              children: [
                Opacity(
                  opacity: times > 0 ? 0.8 : 1,
                  child: Ink(
                    decoration:
                        times > 0 ? BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle) : null,
                    height: 60,
                    width: 60,
                    child: ImageWidget(isIcon),
                  ),
                ),
                Visibility(
                    visible: times > 0,
                    child: Center(
                        child: Text(
                      times.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ]),
                    )))
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;

    return Obx(() {
      final times = controller.timesAnimation.value;
      if (times == 1) {
        int second = int.parse(giftCard!.metadata!.displayTime!.toString());
        return Stack(
          children: [
            Center(child: bodyGift()),
            Center(
              child: CircleAnimation(
                duration: Duration(seconds: second + 2),
                afterAnimation: () {
                  setState(() {
                    isIcon = IconAppConstants.icLiveGift;
                  });
                },
                child: const SizedBox(),
              ),
            ),
          ],
        );
      }
      return bodyGift();
    });
  }
}

class CircleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback afterAnimation;

  const CircleAnimation({super.key, required this.child, required this.duration, required this.afterAnimation});

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.afterAnimation.call();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return CircularPercentIndicator(
          lineWidth: 2,
          percent: _controller.value,
          radius: 30,
          progressColor: Colors.white,
          backgroundColor: Colors.black.withOpacity(0.4),
          center: widget.child,
        );
      },
      animation: _controller,
    );
  }
}
