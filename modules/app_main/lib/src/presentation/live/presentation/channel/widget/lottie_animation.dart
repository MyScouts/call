import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/model/response/sent_gift_response.dart';
import '../../../domain/usecases/gift_share_preferences_usecase.dart';

class LottieAnimation extends StatefulWidget {
  final SentGiftResponse gift;
  final AnimationController controller;

  const LottieAnimation({
    super.key,
    required this.gift,
    required this.controller,
  });

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> with SingleTickerProviderStateMixin {
  final giftUseCase = injector.get<GiftSharePreferencesUseCase>();

  File? fileGift;

  Future<void> checkGift() async {
    final dir = await getApplicationDocumentsDirectory();
    final giftUrl = widget.gift.giftCard!.gifUrl!;
    final name = giftUrl.split('/').last;
    final path = '${dir.path}/$name';

    if (giftUseCase.getGift(path) != null) {
      if (mounted) {
        setState(() {
          fileGift = giftUseCase.getGift(path);
        });
      }
    } else {
      await Dio().download(giftUrl, '${dir.path}/$name');
      if (path.isNotEmpty) {
        await giftUseCase.saveGift(path);
        if (mounted) {
          setState(() {
            fileGift = File(path);
          });
        }
      }
    }
  }

  @override
  void initState() {
    checkGift();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: fileGift == null
            ? const SizedBox()
            : Lottie.file(
                fileGift!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitWidth,
                repeat: false,
                controller: widget.controller,
                onLoaded: (composition) {
                  widget.controller.duration = composition.duration;
                  widget.controller.forward();
                },
              ),
      ),
    );
  }
}
