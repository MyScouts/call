import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/response/sent_gift_response.dart';
import '../live_channel_screen.dart';
import '../state/live_channel_controller.dart';
import 'lottie_animation.dart';

class SentGiftPage extends StatelessWidget {
  final FloatingGiftsProvider provider;

  const SentGiftPage({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          ListenableBuilder(
            listenable: provider,
            builder: (context, _) {
              return FloatingGiftsWidget(provider: provider);
            },
          ),
        ],
      ),
    );
  }
}

class FloatingGiftsWidget extends StatelessWidget {
  final FloatingGiftsProvider provider;

  const FloatingGiftsWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              provider.giftAnimations.isNotEmpty
                  ? GiftWidget(
                      key: provider.giftAnimations.first.key,
                      gift: provider.giftAnimations.first.giftResponse,
                      giftNumber: provider.giftAnimations.first.giftNumber,
                      isStaticGift: false,
                      provider: provider,
                    )
                  : const SizedBox(),
              provider.gifts.isNotEmpty
                  ? GiftWidget(
                      key: provider.gifts.first.key,
                      gift: provider.gifts.first.giftResponse,
                      giftNumber: provider.gifts.first.giftNumber,
                      provider: provider,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class GiftAnimation {
  final SentGiftResponse giftResponse;
  final Key key;
  final int giftNumber;

  GiftAnimation({
    required this.giftResponse,
    required this.key,
    required this.giftNumber,
  });
}

@injectable
class FloatingGiftsProvider with ChangeNotifier {
  final List<GiftAnimation> _gifts = <GiftAnimation>[];
  int _keyGift = 0;

  List<GiftAnimation> get gifts => _gifts;

  final List<GiftAnimation> _giftAnimations = <GiftAnimation>[];
  int _keyGiftAnimation = 0;

  List<GiftAnimation> get giftAnimations => _giftAnimations;

  void addGift({
    required SentGiftResponse gift,
    int giftNumber = 1,
  }) {
    int giftNum = giftNumber;
    if (gifts.isNotEmpty) {
      if (gifts.last.giftResponse.giver?.id == gift.giver?.id &&
          gifts.last.giftResponse.giftCard?.imageGift == gift.giftCard?.imageGift) {
        giftNum = gifts.last.giftNumber + giftNumber;
        removeGift(gifts.last.key);
      }
    }
    _gifts.add(GiftAnimation(
      key: Key(_keyGift.toString()),
      giftNumber: giftNum,
      giftResponse: gift,
    ));
    _keyGift++;
    notifyListeners();
  }

  void addGiftAnimation({
    required SentGiftResponse gift,
    int giftNumber = 1,
  }) {
    _giftAnimations
        .add(GiftAnimation(giftResponse: gift, key: Key(_keyGiftAnimation.toString()), giftNumber: giftNumber));
    _keyGiftAnimation++;
    notifyListeners();
  }

  void removeGift(Key? key) {
    _gifts.removeWhere((gift) => gift.key == key);
    notifyListeners();
  }

  void removeGiftAnimation(Key? key, {required BuildContext context}) {
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;
    _giftAnimations.removeWhere((gif) => gif.key == key);
    controller.timesAnimation.value--;
    notifyListeners();
  }
}

class GiftWidget extends StatefulWidget {
  final SentGiftResponse gift;
  final int giftNumber;
  final bool isStaticGift;
  final FloatingGiftsProvider provider;

  const GiftWidget({
    required Key key,
    required this.gift,
    this.giftNumber = 1,
    this.isStaticGift = true,
    required this.provider,
  }) : super(key: key);

  @override
  State<GiftWidget> createState() => _GiftWidgetState();
}

class _GiftWidgetState extends State<GiftWidget> with TickerProviderStateMixin {
  late AnimationController controller;

  double opacity = 1;

  late AnimationController controller2;

  double opacity2 = 1;

  bool get isJsonFile {
    return widget.gift.giftCard?.gifUrl?.contains('.json') == true;
  }

  @override
  void initState() {
    if (widget.isStaticGift) {
      controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
      _startAnimation(controller);
    } else {
      Lottie.cache.maximumSize = 0;
      if (isJsonFile) {
        controller2 = AnimationController(vsync: this);
        startAnimation2(controller2);
      } else {
        int displayTime = 4;
        try {
          displayTime = getGifTime(widget.gift.giftCard?.metadata?.displayTime);
        } catch (_) {
          displayTime = 4;
        }
        controller2 = AnimationController(vsync: this, duration: Duration(seconds: displayTime));
        startAnimation2(controller2);
      }
    }
    super.initState();
  }

  int getGifTime(dynamic time) {
    if (time == null) {
      return 4;
    }
    if (time is String) {
      return int.parse(time);
    }
    return time;
  }

  void startAnimation2(AnimationController controller) {
    if (isJsonFile) {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final floatingHeartsProvider = widget.provider;
          floatingHeartsProvider.removeGiftAnimation(widget.key, context: context);
          Lottie.cache.clear();
        }
      });
    } else {
      controller.forward().whenComplete(() {
        final floatingHeartsProvider = widget.provider;
        floatingHeartsProvider.removeGiftAnimation(widget.key, context: context);
        controller.dispose();
      });
    }
  }

  @override
  void dispose() {
    if (widget.isStaticGift) {
      if (!controller.isCompleted) {
        controller.dispose();
      }
    } else {
      if (!controller2.isCompleted) {
        controller2.dispose();
        Lottie.cache.clear();
      }
    }
    super.dispose();
  }

  void _startAnimation(AnimationController controller) {
    controller.forward().whenComplete(() {
      final floatingHeartsProvider = widget.provider;
      floatingHeartsProvider.removeGift(widget.key);
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isStaticGift
        ? AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              final value = controller.value;
              opacity = lerpDouble(1, 0, value == 1 ? 1 : 0)!;
              return buildStaticGift();
            },
          )
        : buildDynamicGift();
  }

  Widget buildDynamicGift() {
    return AnimatedBuilder(
        animation: controller2,
        builder: (context, snapshot) {
          return Opacity(
            opacity: opacity2,
            child: Stack(
              children: [
                const SizedBox(height: double.infinity, width: double.infinity),
                Positioned(
                  right: 10,
                  top: 105,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 220,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: AppColors.blue14.withOpacity(.6),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.blue10.withOpacity(.7),
                              AppColors.blue14.withOpacity(.6),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 60),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.gift.giver?.displayName ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Gửi: ${widget.gift.giftCard?.name ?? ''}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'x${widget.giftNumber}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 14),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -3,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: AppColors.blue14,
                            ),
                          ),
                          child: ClipOval(
                            child: widget.gift.giver?.avatar == null
                                ? ImageWidget(
                                    ImageConstants.defaultAppLogo,
                                    width: 53,
                                    height: 53,
                                    fit: BoxFit.fill,
                                  )
                                : ImageWidget(
                                    widget.gift.giver?.avatar ?? '',
                                    width: 53,
                                    height: 53,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isJsonFile
                    ? LottieAnimation(
                        gift: widget.gift,
                        controller: controller2,
                      )
                    : Positioned(
                        bottom: 141,
                        left: 27,
                        right: 27,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ImageWidget(
                            widget.gift.giftCard?.gifUrl ?? '',
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
              ],
            ),
          );
        });
  }

  Widget buildStaticGift() {
    return Positioned(
      bottom: 354,
      left: 10,
      child: Opacity(
        opacity: opacity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(.5), Colors.black.withOpacity(0)],
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: widget.gift.giver?.avatar == null
                              ? ImageWidget(
                                  ImageConstants.defaultAppLogo,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.fill,
                                )
                              : ImageWidget(
                                  widget.gift.giver?.avatar ?? '',
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            widget.gift.giver?.displayName ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        //const SizedBox(width: 90),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: 0,
                    child: ClipOval(
                      child: ImageWidget(
                        widget.gift.giftCard?.imageGift ?? '',
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 8),
              child: Stack(
                children: [
                  Text(
                    'x ${widget.giftNumber}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Colors.black,
                    ),
                  ),
                  Text(
                    'x ${widget.giftNumber}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
