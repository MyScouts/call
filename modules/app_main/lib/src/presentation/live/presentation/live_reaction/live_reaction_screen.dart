import 'dart:math';

import 'package:app_main/src/app_size.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:sa4_migration_kit/multi_tween/multi_tween.dart';

import 'loop_animation_builder.dart';

class LiveReactionScreen extends StatefulWidget {
  const LiveReactionScreen({super.key});

  @override
  State<LiveReactionScreen> createState() => _LiveReactionScreenState();
}

class _LiveReactionScreenState extends State<LiveReactionScreen> {
  final random = Random();
  final List<ReactionAnimation> reactionList = [];

  @override
  void initState() {
    NotificationCenter.subscribe(
      channel: reactionEvent,
      observer: this,
      onNotification: (_) {
        if (mounted) {
          setState(() {
            reactionList.add(ReactionAnimation(random));
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(channel: reactionEvent, observer: this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionFlyaway(reactionList: reactionList);
  }
}

class ReactionFlyaway extends StatelessWidget {
  const ReactionFlyaway({super.key, required this.reactionList});

  final List<ReactionAnimation> reactionList;

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder(
      builder: (_) {
        return Stack(
          clipBehavior: Clip.none,
          children: reactionList
              .map<Widget>((particle) => _ReactItem(item: particle))
              .toList(),
        );
      },
    );
  }
}

class _ReactItem extends StatelessWidget {
  const _ReactItem({super.key, required this.item});

  final ReactionAnimation item;

  @override
  Widget build(BuildContext context) {
    final progress = item.progress();
    final MultiTweenValues animation = item.tween.transform(progress);
    final position = Offset(
      animation.get<double>(OffsetProps.x),
      animation.get<double>(OffsetProps.y),
    );
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Transform.rotate(
        angle: item.isLeft ? -  pi / 6 : pi / 6,
        child: Transform.scale(
          scale: progress,
          child: SizedBox.square(
            dimension: 25,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: progress,
              child: ImageWidget(IconAppConstants.icLove),
            ),
          ),
        ),
      ),
    );
  }
}

enum OffsetProps { x, y }

class ReactionAnimation {
  late MultiTween<OffsetProps> tween;

  late bool isLeft;

  late DateTime startTime;

  final Random random;

  ReactionAnimation(this.random) {
    _restart();
  }

  void _restart() {
    final double startX;
    final ra = random.nextInt(10);
    if (ra.isOdd) {
      startX = 5;
      isLeft = true;
    } else {
      startX = 55;
      isLeft = false;
    }
    const endX = 28.0;
    final endY = SizeConfig.screenHeight / 4;
    // vị trí kết thúc
    final startPosition = Offset(
      startX,
      -40,
    );
    // vị trí bắt đầu
    final endPosition = Offset(
      endX,
      endY,
    );

    tween = MultiTween<OffsetProps>()
      ..add(
        OffsetProps.x,
        Tween(
          begin: startPosition.dx,
          end: endPosition.dx,
        ),
      )
      ..add(
        OffsetProps.y,
        Tween(
          begin: startPosition.dy,
          end: endPosition.dy,
        ),
      );

    startTime = DateTime.now();
  }

  double progress() {
    final progress =
        ((3000000 - DateTime.now().difference(startTime).inMicroseconds) /
                3000000)
            .clamp(0.0, 1.0);
    return progress.toDouble();
  }
}
