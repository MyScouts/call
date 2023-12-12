import 'dart:async';

import '../easy_audio_controller.dart';

Future<void> easyPlaySound(String source) {
  final completer = Completer();
  final controller = EasyAudioController();

  controller.play(source);

  controller.onPlayerStateChanged
      .where((e) => e == PlayerState.completed)
      .take(1)
      .listen((event) {
    completer.complete();
  });

  return completer.future;
}
