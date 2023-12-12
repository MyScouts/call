// ignore_for_file: unused_field

import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../../domain/usecases/user_share_preferences_usecase.dart';
import '../service/call_manager/impl/android_call_manager.dart';
import '../service/call_manager/impl/ios_call_manager.dart';

part 'stringee_event.dart';
part 'stringee_state.dart';

const _pushTokenRegisteredKey = '_pushTokenRegistered';
const _pushTokenKey = '_pushToken';

@singleton
class StringeeBloc extends Bloc<StringeeEvent, StringeeState> {
  final StringeeService _stringeeService;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  StringeeBloc(
    this._stringeeService,
    this._userSharePreferencesUsecase,
  ) : super(StringeeInitial(_stringeeService.client)) {
    on<ConnectionEvent>(_onConnectionEvent);
    on<NotifyIncomingCallEvent>(_onNotifyIncomingCall);
    on<NotifyIncomingCallEvent2>(_onNotifyIncomingCall2);
  }

  final IOSCallManager _iOSCallManager = IOSCallManager.shared;
  final AndroidCallManager _androidCallManager = AndroidCallManager.shared;
  StreamSubscription? _eventStreamController;

  Future<void> _onConnectionEvent(
      ConnectionEvent event, Emitter<StringeeState> emit) async {
    if (state.client.hasConnected) {
      try {
        await state.client.disconnect();
      } catch (_) {}
    }

    final client = state.client;

    final user = _userSharePreferencesUsecase.getUserInfo();
    final tokenStringee = _userSharePreferencesUsecase.getStringeeToken;

    if (tokenStringee?.isNotEmpty ?? false) {
      _stringeeService.connect(tokenStringee!, user?.displayName, user?.avatar);
    }

    /// Lắng nghe sự kiện của StringeeClient(kết nối, cuộc gọi đến...)
    _eventStreamController =
        client.eventStreamController.stream.listen((event) {
      stringeeLog('StringeeBloc: type: ${event['eventType']}');
      stringeeLog('StringeeBloc: event: $event');

      final Map<dynamic, dynamic> map = event;
      switch (map['eventType']) {
        case StringeeClientEvents.didConnect:
          _handleDidConnectEvent();
          break;
        case StringeeClientEvents.didDisconnect:
          _handleDiddisconnectEvent();
          break;
        case StringeeClientEvents.didFailWithError:
          break;
        case StringeeClientEvents.requestAccessToken:
          add(ConnectionEvent());
          break;
        case StringeeClientEvents.didReceiveCustomMessage:
          break;
        case StringeeClientEvents.incomingCall:
          add(NotifyIncomingCallEvent(map['body']));
          break;
        case StringeeClientEvents.incomingCall2:
          add(NotifyIncomingCallEvent2(map['body']));
          break;
        default:
          break;
      }
    });

    emit(StringeeClientConnected(client));
  }

  Future<void> _onNotifyIncomingCall(
      NotifyIncomingCallEvent event, Emitter<StringeeState> emit) async {
    emit(IncomingCall(state.client, event.call));
  }

  Future<void> _onNotifyIncomingCall2(
      NotifyIncomingCallEvent2 event, Emitter<StringeeState> emit) async {
    emit(IncomingCall2(state.client, event.call));
  }

  /// StringeeClient Listeners
  ///
  void _handleDidConnectEvent() {
    stringeeLog('_handleDidConnectEvent');
    if (Platform.isIOS) {
      IOSCallManager.shared.startTimeoutForIncomingCall();
    }
    _registerPushWithStringeeServer();

    _setupCallManager();
  }

  void _handleDiddisconnectEvent() {
    stringeeLog('handleDiddisconnectEvent');
    if (Platform.isIOS) {
      IOSCallManager.shared.stopTimeoutForIncomingCall();
    }
  }

  Future<void> _registerPushWithStringeeServer() async {
    if (Platform.isAndroid) {
      final tokenRefreshStream = FirebaseMessaging.instance.onTokenRefresh;
      final prefs = injector<SharedPreferences>();
      final registered = (prefs.getBool(_pushTokenRegisteredKey) == null)
          ? false
          : prefs.getBool(_pushTokenRegisteredKey);

      ///kiểm tra đã register push chưa
      if (registered != null && !registered) {
        await FirebaseMessaging.instance.getToken().then((token) {
          state.client.registerPush(token!).then((value) {
            stringeeLog('Register push ${value['message']}');
            if (value['status']) {
              prefs.setBool(_pushTokenRegisteredKey, true);
              prefs.setString(_pushTokenKey, token);
            }
          });
        });
      }

      ///Nhận token mới từ firebase
      tokenRefreshStream.listen((token) {
        ///Xóa token cũ
        state.client
            .unregisterPush(prefs.getString(_pushTokenKey)!)
            .then((value) {
          stringeeLog('Unregister push ${value['message']}');
          if (value['status']) {
            ///Register với token mới
            prefs.setBool(_pushTokenRegisteredKey, false);
            prefs.remove(_pushTokenKey);
            state.client.registerPush(token).then((value) {
              stringeeLog('Register push ${value['message']}');
              if (value['status']) {
                prefs.setBool(_pushTokenRegisteredKey, true);
                prefs.setString(_pushTokenKey, token);
              }
            });
          }
        });
      });
    } else {
      _iOSCallManager.registerPushWithStringeeServer();
    }
  }

  void _setupCallManager() {
    final context = AppCoordinator.rootNavigator.currentContext!;
    _androidCallManager.setContext(context);
    _iOSCallManager.setContext(context);

    if (Platform.isIOS) {
      /// Cấu hình thư viện để nhận push notification và
      /// sử dụng Callkit để show giao diện call native của iOS
      _iOSCallManager.configCallKeep();
    } else if (Platform.isAndroid) {
      /// Register push token for android
      _userSharePreferencesUsecase.getStringeeToken?.let(
        _androidCallManager.registerPushToken,
      );
    }

    // context.requestCallPermissions();
  }

  @override
  Future<void> close() {
    _eventStreamController?.cancel();
    return super.close();
  }
}
