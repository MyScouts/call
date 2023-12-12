import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../../1vs1/bloc/call_1vs1_bloc.dart';
import '../../../models/call_1vs1_state_data.dart';
import '../../../stringee_bloc/stringee_bloc.dart';
import '../../call_instance/impl/android_call_instance.dart';
import '../../models/call_service_models.dart';
import '../call_manager.dart';

class AndroidCallManager extends CallManager {
  static AndroidCallManager? _instance;

  AndroidCallManager._internal();

  // ignore: prefer_constructors_over_static_methods
  static AndroidCallManager get shared {
    return _instance ??= AndroidCallManager._internal();
  }

  @override
  AndroidCallInstance? get callInstance =>
      super.callInstance as AndroidCallInstance?;

  @override
  void showCallScreen() {
    if (context == null) {
      return;
    }

    if (appLifecycleState != AppLifecycleState.resumed ||
        callInstance?.bloc == null ||
        !callInstance!.hasStringeeCall() ||
        callInstance!.ended()) {
      return;
    }

    callInstance!.showIncomingCall(context!);
  }

  @override
  void setOutgoingCall(Call1vs1Bloc bloc) {
    super.setOutgoingCall(bloc);
    callInstance = AndroidCallInstance(
      bloc,
    );
    callInstance!.callScreenShowed = true;
  }

  @override
  void handleIncomingEvent(StringeeCall call, BuildContext context) {
    super.handleIncomingEvent(call, context);

    stringeeLog('handleIncomingCall2Event, callId: ${call.id}}');
    if(callInstance?.call != null && callInstance?.call is StringeeCall2) {
      return;
    }
    if (callInstance?.bloc == null) {
      final bloc = Call1vs1Bloc(
        injector.get(
          param1: CallServiceContext(
            client: context.read<StringeeBloc>().state.client,
            call: call,
            userCall2: false,
          ),
        ),
        injector.get(),
        injector.get(),
        injector.get(),
        User(
          id: int.tryParse(call.from!),
        ),
        call.isVideoCall ? CallType.video : CallType.audio,
      );

      callInstance = AndroidCallInstance(
        bloc,
      );

      listenCallBlocEnded(bloc);

      // Show callScreen
      showCallScreen();

      call.initAnswer().then((result) {
        stringeeLog('initAnswer: ${result['message']}');
        if (result['status'] != true) {
          clearDataEndDismiss();
        }
      });

      return;
    }
    if (callInstance?.bloc != null) {
      // Currently the user in call/incoming already => reject call
      call.reject();
    }
  }

  @override
  void handleIncomingEvent2(StringeeCall2 call, BuildContext context) {
    super.handleIncomingEvent2(call, context);
    if(callInstance?.call != null && callInstance?.call is StringeeCall) {
      return;
    }
    stringeeLog('handleIncomingCall2Event, callId: ${call.id}}');

    if (callInstance?.bloc == null) {
      final bloc = Call1vs1Bloc(
        injector.get(
          param1: CallServiceContext(
            client: context.read<StringeeBloc>().state.client,
            call2: call,
            userCall2: true,
          ),
        ),
        injector.get(),
        injector.get(),
        injector.get(),
        User(
          id: int.tryParse(call.from!),
        ),
        call.isVideoCall ? CallType.video : CallType.audio,
      );

      callInstance = AndroidCallInstance(
        bloc,
      );

      listenCallBlocEnded(bloc);

      // Show callScreen
      showCallScreen();

      call.initAnswer().then((result) {
        stringeeLog('initAnswer: ${result['message']}');
        if (result['status'] != true) {
          clearDataEndDismiss();
        }
      });

      return;
    }
    if (callInstance?.bloc != null) {
      // Currently the user in call/incoming already => reject call
      call.reject();
    }
  }

  Future<bool> registerPushToken(String fcmToken) async {
    stringeeLog('$runtimeType registerPushToken: $fcmToken');

    final client = context?.read<StringeeBloc>().state.client;
    if (client == null || !client.hasConnected) {
      if (kDebugMode) {
        throw Exception(
          'StringeeClient is null or not connected ${context?.runtimeType}',
        );
      }
      return false;
    }
    return client
        .registerPush(fcmToken, isProduction: !kDebugMode, isVoip: false)
        .then((result) {
      final bool status = result['status'];
      final String message = result['message'];
      stringeeLog(
        '$runtimeType registerPushNotify: status: $status - message: $message',
      );
      return status;
    });
  }
}
