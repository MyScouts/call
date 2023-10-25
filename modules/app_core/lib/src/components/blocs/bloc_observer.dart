import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  /// onCreate - onChange - onError - onClose
  final List<bool> enable;
  final bool showLog;

  MyBlocObserver({
    this.showLog = true,
    this.enable = const [false, false, true, false],
  }) {}

  void send(String tag, Object error, StackTrace trace) {
    if (showLog) {}
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    final message = '[MyBlocObserver] onCreate -- $bloc';
    log(message);

    if (enable[0]) {}
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    final message = '[MyBlocObserver] onChange -- '
        '${bloc.runtimeType} '
        '${change.currentState.runtimeType} -> ${change.nextState.runtimeType}';
    log(message);

    if (enable[1]) {}

    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final message = '[MyBlocObserver] onError -- $bloc ${error.toString()}'
        '=> stackTrace: ${stackTrace.toString()}';
    log(message);

    if (enable[2]) {}

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    final message = '[MyBlocObserver] onClose -- $bloc';
    log(message);

    if (enable[3]) {}
  }
}
