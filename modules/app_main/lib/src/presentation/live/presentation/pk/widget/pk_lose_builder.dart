import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class PkEndGameItem extends StatefulWidget {
  const PkEndGameItem({
    super.key,
    required this.isWin,
    required this.isDraw,
    required this.url,
  });

  final bool isWin;
  final bool isDraw;
  final String url;

  @override
  State<PkEndGameItem> createState() => PkEndGameItemState();
}

class PkEndGameItemState extends State<PkEndGameItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
    super.initState();
    NotificationCenter.subscribe(
      channel: liveTap,
      observer: this,
      onNotification: (_) {
        revert();
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationController.forward();
    });
  }

  void revert() => animationController.reverse();

  @override
  void dispose() {
    animationController.dispose();
    NotificationCenter.unsubscribe(channel: liveTap, observer: this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: widget.isDraw
                ? _DrawImage(url: widget.url)
                : (widget.isWin
                    ? _WinImage(url: widget.url)
                    : _LoseImage(url: widget.url)),
          ),
        );
      },
    );
  }
}

class _LoseImage extends StatelessWidget {
  const _LoseImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305,
      height: 328,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.icons_lives_lose.image(fit: BoxFit.fill),
          Positioned(
            top: 90,
            left: 117,
            child: CircleNetworkImage(
              url: url,
              size: 76,
              defaultImage: ImageWidget(ImageConstants.defaultUserAvatar),
            ),
          ),
        ],
      ),
    );
  }
}

class _WinImage extends StatelessWidget {
  const _WinImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 377,
      height: 266,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.icons_lives_win.image(fit: BoxFit.fill),
          Positioned(
            top: 78,
            left: 151,
            child: CircleNetworkImage(
              url: url,
              size: 76,
              defaultImage: ImageWidget(ImageConstants.defaultUserAvatar),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawImage extends StatelessWidget {
  const _DrawImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 259,
      height: 314,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.icons_lives_draw.image(fit: BoxFit.fill),
          Positioned(
            top: 70,
            left: 62,
            child: CircleNetworkImage(
              url: url,
              size: 132,
              defaultImage: ImageWidget(ImageConstants.defaultUserAvatar),
            ),
          ),
        ],
      ),
    );
  }
}
