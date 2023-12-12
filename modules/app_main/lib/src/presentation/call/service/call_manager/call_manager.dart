import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../1vs1/bloc/call_1vs1_bloc.dart';
import '../call_instance/call_instance.dart';

abstract class CallManager with WidgetsBindingObserver {
  CallManager() {
    WidgetsBinding.instance.addObserver(this);
  }

  CallInstance? callInstance;

  StringeeCall? get call => callInstance?.call;

  StringeeClient? get client => callInstance?.client;

  BuildContext? _context;

  BuildContext? get context => _context;

  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;

  AppLifecycleState get appLifecycleState => _appLifecycleState;

  void setContext(BuildContext context) {
    stringeeLog('setContext $context');
    _context = context;
  }

  void showCallScreen();

  @mustCallSuper
  void clearDataEndDismiss() {
    stringeeLog(
      '$runtimeType - clearDataEndDismiss: $callInstance',
    );
    callInstance?.dispose();
    callInstance = null;
  }

  // This function must call super on TOP of implementation
  @mustCallSuper
  void handleIncomingEvent(StringeeCall call, BuildContext context) {
    _context = context;
  }

  @mustCallSuper
  void handleIncomingEvent2(StringeeCall2 call, BuildContext context) {
    _context = context;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    stringeeLog('$runtimeType - didChangeAppLifecycleState: $state');

    super.didChangeAppLifecycleState(state);

    _appLifecycleState = state;

    if (state == AppLifecycleState.resumed &&
        callInstance != null &&
        callInstance!.shouldShowIncomingWhenAppResumed) {
      showCallScreen();
    }
  }

  @mustCallSuper
  void setOutgoingCall(Call1vs1Bloc bloc) {
    listenCallBlocEnded(bloc);
  }

  void listenCallBlocEnded(Call1vs1Bloc bloc) {
    bloc.stream
        .where((e) {
          return [
            e is CallingErrorState,
            e.isCallClosed,
          ].any((r) => r);
        })
        .take(1)
        .listen((event) {
          clearDataEndDismiss();
        });
  }

  @mustCallSuper
  void destroy() {
    WidgetsBinding.instance.removeObserver(this);
  }
}

abstract class CallScreenStateDelegate<T extends StatefulWidget>
    extends State<T> {
  void syncUIWithCallInstance(CallInstance callInstance);
}
