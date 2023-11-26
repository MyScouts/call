import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/live_service/impl/live_socket_service_impl.dart';
import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:app_main/src/core/services/live_service/live_socket_service.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/live/data/model/response/join_live_response.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../data/repository/live_repository.dart';

enum LiveStreamState {
  loading,
  preview,
  watching,
  stop;

  bool get isLoading => this == LiveStreamState.loading;

  bool get isPreview => this == LiveStreamState.preview;

  bool get isWatching => this == LiveStreamState.watching;

  bool get isStop => this == LiveStreamState.stop;
}

@injectable
class LiveChannelController {
  final LiveRepository repository;
  final UserSharePreferencesUsecase userSharePreferencesUseCase;
  final UserUsecase userUseCase;
  final LiveService service;
  final LiveSocketService socketService;

  LiveChannelController(
    this.repository,
    this.userSharePreferencesUseCase,
    this.userUseCase,
    this.service,
    this.socketService,
  );

  final Rx<LiveStreamState> _state = LiveStreamState.loading.obs;

  Rx<LiveStreamState> get state => _state;

  late Rx<LiveData> _info;
  late Rx<LiveMember> _me;
  late final RxList<LiveMember> _members = <LiveMember>[].obs;

  final RxBool _enableChat = true.obs;

  final RxBool _hostOffline = true.obs;

  final RxBool _hostInBackground = false.obs;

  bool get hostInLive {
    if (_me.value.isOwner) return true;
    final host = _members.firstWhereOrNull((e) => e.isOwner);
    return host != null;
  }

  int get hostID {
    if (_me.value.isOwner) return _me.value.info.userID;
    final host = _members.firstWhereOrNull((e) => e.isOwner);
    return host!.info.userID;
  }

  void join(int id, [String? password]) async {
    try {
      final res = await Future.wait([
        repository.joinLive(id: id, password: password),
        userUseCase.getProfile(),
      ]);
      _info = (res.first as JoinLiveResponse).data.obs;
      final user = res.last as User?;
      if (user == null) return;

      _me = LiveMember(
        info: LiveMemberInfo(
          userID: user.id ?? 0,
          name: user.name ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: _info.value.user?.id == user.id,
      ).obs;

      if (_me.value.isOwner) {
        await [Permission.microphone, Permission.camera].request();
        await service.initEngine(enableMic: true, enableWebCam: true);
      } else {
        await service.initEngine(enableMic: false, enableWebCam: false);
      }

      _onSocketEvent();

      socketService.connect(
        '${Configurations.baseUrl}live?id=${_info.value.id}',
        token: userSharePreferencesUseCase.getToken() ?? '',
      );

      _listenRtcEvent();

      await service.joinChannel(
        _info.value.agoraToken ?? '',
        _info.value.agoraChannel ?? '',
        _me.value.info.userID,
        role: _me.value.isOwner
            ? ClientRoleType.clientRoleBroadcaster
            : ClientRoleType.clientRoleAudience,
      );

      ///get members
      final users = await repository.listMembers(_info.value.id);
      final result = <LiveMember>[];
      for (final i in users) {
        if (i.id == _me.value.info.userID) continue;
        result.add(LiveMember(
          info: LiveMemberInfo(
            userID: i.id!,
            avatar: i.avatar ?? '',
            name: i.displayName ?? '',
          ),
          isOwner: _info.value.user?.id == i.id,
        ));
      }
      _members.value = result;

      _hostOffline.value = !hostInLive;

      _state.value = LiveStreamState.watching;

      WakelockPlus.enable();

      if (Platform.isAndroid) _initForegroundTask();

    } catch(e) {
      print(e);
    }
  }

  Future previewQuit() async {
    _state.value = LiveStreamState.loading;
    await service.engine.stopPreview();
  }

  void _listenRtcEvent() {
    service.engine.registerEventHandler(
      RtcEngineEventHandler(
        onRemoteVideoStateChanged: _onRemoteVideoStateChanged,
        // onUserEnableLocalVideo: _onUserEnableVideo,
        onNetworkTypeChanged: _onNetworkTypeChanged,
        // onConnectionStateChanged: _onConnectionStateChanged,
        // onJoinChannelSuccess: _onJoinChannelSuccess,
      ),
    );
  }

  void _onRemoteVideoStateChanged(
    _,
    int remoteUid,
    RemoteVideoState state,
    RemoteVideoStateReason reason,
    __,
  ) {
    ///Mạng của owner bị tắc nghẽn
    if (reason.isNetworkCongestion) {
      return;
    }

    ///Mạng của owner đã khôi phục
    if (reason.isNetworkRecovery) {
      _hostInBackground.value = false;
      return;
    }

    if (reason.isRemoteOffline) {
      _hostOffline.value = true;
      return;
    }

    if (reason.isRemoteUnmuted) {
      _hostInBackground.value = false;
      return;
    }

    if (reason.isRemoteInBackground) {
      _hostInBackground.value = true;
      return;
    }
  }

  void _onNetworkTypeChanged(_, NetworkType type) {
    if (type == NetworkType.networkTypeDisconnected) {
      //TODO show toast disconnected
    }
  }

  void _initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  bool isMemberInLive(int userID) {
    final user = _members.firstWhereOrNull((e) => e.info.userID == userID);
    return user != null;
  }

  void _onSocketEvent() {
    socketService.on(socketConnectedEvent, (data) {
      debugPrint('kết nối thành công ${socketService.socket.id}');
    });

    socketService.on(socketConnectionFailureEvent, (data) {
      debugPrint('kết nối thất bại ${socketService.socket.id}');
    });

    socketService.on(socketConnectionTimeOutEvent, (data) {
      debugPrint('connection time out ${socketService.socket.id}');
    });

    socketService.on(socketReConnectEvent, (data) {
      debugPrint('Đang kết nối lại ${socketService.socket.id}');
    });

    socketService.on(socketUserJoinEvent, (Map data) {
      debugPrint('$socketUserJoinEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (isMemberInLive(user.id!)) return;
      final member = LiveMember(
        info: LiveMemberInfo(
          userID: user.id!,
          name: user.displayName ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: user.id == _info.value.user?.id,
      );
      _members.value = [..._members, member];
    });

    socketService.on(socketUserLeaveEvent, (Map data) {
      debugPrint('$socketUserLeaveEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (!isMemberInLive(user.id!)) return;
      _members.value = _members.where((e) => e.info.userID != user.id).toList();
    });

    socketService.on(socketKickFromLiveEvent, (Map data) {
      debugPrint('$socketKickFromLiveEvent ===> ${data['user']}');
      leaveLive();
    });

    socketService.on(socketBannedEvent, (Map data) {
      debugPrint('$socketBannedEvent ===> ${data['user']}');
      _enableChat.value = false;
    });
  }

  void leaveLive() {
    socketService.disconnect();
    service.leaveChannel();
  }
}

extension RemoteVideoStateReasonX on RemoteVideoStateReason {
  bool get isNetworkCongestion =>
      this == RemoteVideoStateReason.remoteVideoStateReasonNetworkCongestion;

  bool get isNetworkRecovery =>
      this == RemoteVideoStateReason.remoteVideoStateReasonNetworkRecovery;

  bool get isRemoteOffline =>
      this == RemoteVideoStateReason.remoteVideoStateReasonRemoteOffline;

  bool get isRemoteUnmuted =>
      this == RemoteVideoStateReason.remoteVideoStateReasonRemoteUnmuted;

  bool get isRemoteInBackground =>
      this == RemoteVideoStateReason.remoteVideoStateReasonSdkInBackground;
}
