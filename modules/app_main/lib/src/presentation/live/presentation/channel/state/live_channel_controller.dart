import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/live_service/impl/live_socket_service_impl.dart';
import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:app_main/src/core/services/live_service/live_socket_service.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/live/data/model/response/join_live_response.dart';
import 'package:app_main/src/presentation/live/domain/entities/agora_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_comment.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/live_magane_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../data/model/response/gift_card_live.dart';
import '../../../data/model/response/sent_gift_response.dart';
import '../../../data/repository/live_repository.dart';
import '../widget/sent_gift_page.dart';

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
  final FloatingGiftsProvider floatingGiftsProvider;

  LiveChannelController(
    this.repository,
    this.userSharePreferencesUseCase,
    this.userUseCase,
    this.service,
    this.socketService,
    this.floatingGiftsProvider,
  ) {
    NotificationCenter.subscribe(
      channel: sendMessage,
      observer: this,
      onNotification: (msg) {
        socketService.sendMessage({'type': 'raw', 'rawContent': msg});
      },
    );
  }

  String? _password;

  void setPassword(String pass) {
    _password = pass;
  }

  final Rx<LiveStreamState> _state = LiveStreamState.loading.obs;

  Rx<LiveStreamState> get state => _state;

  late Rx<LiveData> _info;
  late Rx<LiveMember> _me;

  AgoraData? _agora;

  AgoraData? get agora => _agora;

  late final RxList<LiveMember> _members = <LiveMember>[].obs;

  RxList<LiveMember> get members => _members;

  final giftCardLive = const GiftCardLive().obs;

  Rx<LiveMember> get me => _me;

  final RxBool _enableChat = true.obs;

  final RxBool _hostOffline = true.obs;

  final RxBool _hostInBackground = false.obs;

  final RxBool _showMessageInput = false.obs;

  final RxBool _roomInfoFetching = true.obs;

  RxBool get roomInfoFetching => _roomInfoFetching;

  RxBool get showMessageInput => _showMessageInput;

  final RxBool _enablePk = false.obs;

  RxBool get enablePk => _enablePk;

  bool get hostInLive {
    if (_me.value.isOwner) return true;
    return host != null;
  }

  LiveMember? get host {
    final host = _members.firstWhereOrNull((e) => e.isOwner);
    return host;
  }

  Future<void> getLeaderBoard(int roomId) async {
    try {
      giftCardLive.value = await repository.getInfoGiftCard(roomId);
    } catch (e) {}
  }

  int get hostID {
    if (_me.value.isOwner) return _me.value.info.userID;
    final host = _members.firstWhereOrNull((e) => e.isOwner);
    return host!.info.userID;
  }

  LiveData get info => _info.value;

  final RxBool _mic = false.obs;

  RxBool get mic => _mic;

  final RxBool _video = false.obs;

  RxBool get video => _video;

  void enableVideo() {
    if (_video.value) {
      _video.value = false;
      service.disableVideoStream();
    } else {
      _video.value = true;
      service.enableVideoStream();
    }
  }

  void enableAudio() {
    if (_mic.value) {
      _mic.value = false;
      service.disableAudioStream();
    } else {
      _mic.value = true;
      service.enableAudioStream();
    }
  }

  void enableMessage() {
    _showMessageInput.value = true;
  }

  void disableMessage() {
    _showMessageInput.value = false;
  }

  void joinPk(int id) async {
    _roomInfoFetching.value = true;
    final res = await repository.joinLive(id: id, password: _password);
    _info.value = res.data;
    _agora = res.agoraData.first;
    _roomInfoFetching.value = false;

    getLeaderBoard(_info.value.id);
    final members = await getMembers();
    _members.value = [...members, _me.value];

    await service.rejoinChannel(
      _agora?.token ?? '',
      _agora?.channel ?? '',
      _me.value.info.userID,
      role: _me.value.isOwner
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    _enablePk.value = true;
  }

  Future<List<LiveMember>> getMembers() async {
    final users = await repository.listMembers(_info.value.id);
    final result = <LiveMember>[];
    for (final i in users) {
      if (i.id == _me.value.info.userID) continue;
      result.add(LiveMember(
        info: LiveMemberInfo(
          userID: i.id ?? 0,
          name: i.nickname ?? i.fullName ?? i.displayName ?? '',
          avatar: i.avatar ?? '',
        ),
        isOwner: _info.value.user?.id == i.id,
      ));
    }
    return result;
  }

  void join(int id, BuildContext context) async {
    LiveManageState.join(id, this);
    try {
      final res = await Future.wait([
        repository.joinLive(id: id, password: _password),
        userUseCase.getProfile(),
      ]);
      _info = (res.first as JoinLiveResponse).data.obs;
      _agora = (res.first as JoinLiveResponse).agoraData.first;
      _roomInfoFetching.value = false;
      final user = res.last as User?;
      if (user == null) return;

      _me = LiveMember(
        info: LiveMemberInfo(
          userID: user.id ?? 0,
          name: user.nickname ?? user.fullName ?? user.displayName ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: _info.value.user?.id == user.id,
      ).obs;

      getLeaderBoard(_info.value.id);
    } catch (e) {
      _state.value = LiveStreamState.stop;
      if (context.mounted) {
        Navigator.of(context).pop();
        context.showToastMessage(
          'Live không còn tồn tại',
          ToastMessageType.error,
        );
      }
    }

    try {
      if (_me.value.isOwner) {
        await [Permission.microphone, Permission.camera].request();
        await service.initEngine(enableMic: true, enableWebCam: true);
      } else {
        await service.initEngine(enableMic: false, enableWebCam: false);
      }

      final members = await getMembers();

      _members.value = [...members, _me.value];

      _onSocketEvent(context);

      socketService.connect(
        '${Configurations.baseUrl}live?id=${_info.value.id}',
        token: userSharePreferencesUseCase.getToken() ?? '',
      );

      _listenRtcEvent();

      await service.joinChannel(
        _agora?.token ?? '',
        _agora?.channel ?? '',
        _me.value.info.userID,
        role: _me.value.isOwner
            ? ClientRoleType.clientRoleBroadcaster
            : ClientRoleType.clientRoleAudience,
      );

      _hostOffline.value = !hostInLive;

      _state.value = LiveStreamState.watching;

      WakelockPlus.enable();

      if (Platform.isAndroid) _initForegroundTask();
    } catch (e) {
      print(e);
    }
  }

  void reaction() {
    EasyDebounce.debounce('reaction', const Duration(milliseconds: 300), () {
      socketService.socket.emit('reaction', {'type': 'heart', 'metadata': {}});
    });
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
    return getMember(userID) != null;
  }

  LiveMember? getMember(int id) {
    final user = _members.firstWhereOrNull((e) => e.info.userID == id);
    return user;
  }

  final Rx<int> timesAnimation = 0.obs;

  void _onSocketEvent(BuildContext context) {
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

    socketService.on(socketReactionEvent, (Map data) {
      debugPrint('$socketReactionEvent ===> $data');
      if (data['type'] == 'heart') {
        NotificationCenter.post(channel: reactionEvent);
      }
    });

    socketService.on(socketGiftGiven, (data) {
      debugPrint('$socketGiftGiven ===> $data');
      getLeaderBoard(_info.value.id);
      final gift = SentGiftResponse.fromJson(data as Map<String, Object?>);
      if (gift.giftCard?.metadata?.isStaticGif == true) {
        floatingGiftsProvider.addGift(
          gift: gift,
          giftNumber: gift.total ?? 1,
        );
      } else {
        if (gift.giver?.id.toString() == _me.value.info.userID.toString()) {
          timesAnimation.value = gift.total!;
        }
        for (int j = 1; j <= gift.total!; j++) {
          floatingGiftsProvider.addGiftAnimation(
            gift: gift,
            giftNumber: gift.total ?? 1,
          );
        }
      }
      final message = UserMessage(
        member: LiveMember(
            info: LiveMemberInfo(
                userID: gift.giver!.id!, name: gift.giver!.displayName!, avatar: gift.giver?.avatar ?? '')),
        message: 'đã tặng ${gift.giftCard?.name} x${gift.total}',
        createdAt: DateTime.now(),
      );
      NotificationCenter.post(channel: receiveMessage, options: message);
    });

    socketService.on(socketUserJoinEvent, (Map data) {
      debugPrint('$socketUserJoinEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (isMemberInLive(user.id!)) return;
      final member = LiveMember(
        info: LiveMemberInfo(
          userID: user.id!,
          name: user.nickname ?? user.fullName ?? user.displayName ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: user.id == _info.value.user?.id,
      );
      _members.value = [..._members, member];

      print('length ===> ${_members.length}');
      if (user.id == _me.value.info.userID) {
        NotificationCenter.post(
          channel: receiveMessage,
          options: SystemMessage(
            message: 'Nghiêm cấm tất cả các nội dung không lành mạnh, thô tục,'
                ' tình dục (bao gồm tình dục trẻ em), trái với thuần phong mỹ tục;'
                ' các nội dụng liên quan đến chống phá nhà nước, vi phạm bản'
                ' quyền hoặc pháp luật trong phòng live. Nếu vi phạm, VDONE'
                ' sẽ tạm ngưng hoặc xóa tài khoản của bạn.',
            createdAt: DateTime.now(),
          ),
        );
      }

      final message = JoinMessage(
        member: member,
        message: '',
        createdAt: DateTime.now(),
      );

      NotificationCenter.post(channel: receiveMessage, options: message);
    });

    socketService.on(socketUserLeaveEvent, (Map data) {
      debugPrint('$socketUserLeaveEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (!isMemberInLive(user.id!)) return;
      if (getMember(user.id!)?.isOwner ?? false) {
        _state.value = LiveStreamState.stop;
        NotificationCenter.post(channel: refreshLive);
        return;
      }
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

    socketService.on(socketMessageEvent, (Map data) {
      debugPrint('$socketMessageEvent ===> $data');
      final user = User.fromJson(data['user']);
      final member = _members.firstWhereOrNull((e) => e.info.userID == user.id);
      if (member == null) return;
      final message = UserMessage(
        member: member,
        message: data['rawContent'] ?? '',
        createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
      );
      NotificationCenter.post(channel: receiveMessage, options: message);
    });

    socketService.on(socketPkStartEvent, (data) {
      joinPk(_info.value.id);
    });

    socketService.on(socketPkEndEvent, (data) {
      join(_info.value.id, context);
    });
  }

  void leaveLive() async {
    LiveManageState.disable();
    socketService.disconnect();
    service.leaveChannel();
    _state.value = LiveStreamState.loading;
    _hostOffline.value = true;
    _hostInBackground.value = false;
    _showMessageInput.value = false;
    _roomInfoFetching.value = true;
    _enableChat.value = true;
    _members.value = [];

    if (_me.value.isOwner) {
      await repository.endLive(liveId: _info.value.id);
      NotificationCenter.post(channel: refreshLive);
    }

    if (Platform.isAndroid && await FlutterForegroundTask.isRunningService) {
      FlutterForegroundTask.stopService();
    }

    WakelockPlus.disable();

    NotificationCenter.unsubscribe(channel: sendMessage, observer: this);
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
