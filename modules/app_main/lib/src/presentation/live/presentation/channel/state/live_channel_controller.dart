import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
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
import 'package:app_main/src/presentation/live/domain/entities/live_pk_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/user_diamond_for_pk.dart';
import 'package:app_main/src/presentation/live/live_magane_state.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/join_channel_provider.dart';
import 'package:app_main/src/presentation/live/presentation/live_home/live_home_screen.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/invite_pk_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final RxList<LiveMember> _members = <LiveMember>[].obs;

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

  LivePkData? _pkData;

  LivePkData? get pkData => _pkData;

  final RxBool _inGame = false.obs;

  RxBool get inGame => _inGame;

  Round? _currentGameRound;

  Round? get currentGameRound => _currentGameRound;

  final RxList<UserDiamondForPK> _diamondsPK = <UserDiamondForPK>[].obs;

  RxList<UserDiamondForPK> get diamondsPK => _diamondsPK;

  bool get hostLivePk {
    if (_pkData == null) return false;
    if (hostID == _pkData!.pk.hostID) return true;
    return false;
  }

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

  void switchCamera() {
    service.switchCamera();
  }

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

  void rejoinNonPk(int id) async {
    _roomInfoFetching.value = true;
    final res = await repository.joinLive(id: id, password: _password);
    _info.value = res.data;
    for (final i in res.agoraData) {
      if (i.uid == null) continue;
      if (_me.value.isOwner && i.type == 1) _agora = i;
      if (!_me.value.isOwner && i.type == 0) _agora = i;
    }
    _roomInfoFetching.value = false;

    final members = await getMembers(_info.value.id);

    _members.value = [...members, _me.value];

    getLeaderBoard(_info.value.id);

    await service.rejoinChannel(
      _agora?.token ?? '',
      _agora?.channel ?? '',
      _me.value.info.userID,
      role: _me.value.isOwner
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    _enablePk.value = false;

    LiveManageState.hostID.value = hostID;
  }

  void joinPk(int id) async {
    _roomInfoFetching.value = true;
    final res = await repository.joinLive(id: id, password: _password);
    _info.value = res.data;
    _pkData = await repository.getPk(id);
    for (final i in res.agoraData) {
      if (i.uid == null) continue;
      if (me.value.isOwner) {
        if (i.type == 3) _agora = i;
      } else {
        if (i.type == 2) _agora = i;
      }
    }
    _roomInfoFetching.value = false;

    getLeaderBoard(_info.value.id);

    await getMembersPk();

    _members.value = [..._members, _me.value];

    await service.rejoinChannel(
      _agora?.token ?? '',
      _agora?.channel ?? '',
      _me.value.info.userID,
      role: _me.value.isOwner
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    _enablePk.value = true;

    LiveManageState.hostID.value = hostID;
  }

  Future<List<LiveMember>> getMembers(int id) async {
    final users = await repository.listMembers(id);
    final result = <LiveMember>[];
    final ids = _pkData?.lives.map((e) => e.user?.id ?? 0) ?? [];
    for (final i in users) {
      if (i.id == _me.value.info.userID) continue;
      bool isOwner = false;
      if (_pkData != null && ids.contains(i.id)) isOwner = true;
      if (_pkData == null && i.id == _info.value.user?.id) isOwner = true;
      result.add(LiveMember(
        info: LiveMemberInfo(
          userID: i.id ?? 0,
          name: i.nickname ?? i.fullName ?? i.displayName ?? '',
          avatar: i.avatar ?? '',
        ),
        isOwner: isOwner,
        liveID: id,
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
      final joinRes = res.first as JoinLiveResponse;
      _info = joinRes.data.obs;
      if (_info.value.pk != null) {
        _pkData = await repository.getPk(id);
      } else {
        _pkData = null;
      }
      final user = res.last as User?;
      if (user == null) return;

      _me = LiveMember(
        info: LiveMemberInfo(
          userID: user.id ?? 0,
          name: user.nickname ?? user.fullName ?? user.displayName ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: _info.value.user?.id == user.id,
        liveID: _info.value.id,
      ).obs;

      for (final i in joinRes.agoraData) {
        if (i.uid == null) continue;
        if (_pkData != null) {
          if (_me.value.isOwner && i.type == 3) _agora = i;
          if (!_me.value.isOwner && i.type == 2) _agora = i;
        } else {
          if (_me.value.isOwner && i.type == 1) _agora = i;
          if (!_me.value.isOwner && i.type == 0) _agora = i;
        }
      }
      _roomInfoFetching.value = false;

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

      if (_pkData != null) {
        await getMembersPk();

        _members.value = [..._members, _me.value];
      } else {
        final members = await getMembers(_info.value.id);

        _members.value = [...members, _me.value];
      }

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

      if (_me.value.isOwner) {
        _mic.value = true;
        _video.value = true;
      }

      if (_info.value.pk != null) {
        _enablePk.value = true;
      } else {
        _enablePk.value = false;
      }

      LiveManageState.hostID.value = hostID;

      if (Platform.isAndroid) _initForegroundTask();
    } catch (e) {
      print(e);
    }
  }

  Future getMembersPk() async {
    final liveIds = _pkData?.lives.map((e) => e.id).toList() ?? [];
    final resMembers =
        await Future.wait(liveIds.map((e) => getMembers(e)).toList());

    _members.value = [...resMembers.first, ...resMembers.last];
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

    socketService.on(socketReadyPkEvent, (Map data) {
      debugPrint('$socketReadyPkEvent ===> $data');
      if (data['round'] != null) {
        final round = Round.fromJson(data['round']);
        _inGame.value = true;
        _currentGameRound = round;
      }
    });

    socketService.on(socketPkGiftUpdatedEvent, (Map data) {
      debugPrint('$socketPkGiftUpdatedEvent ===> $data');
      final diamond = UserDiamondForPK.fromJson(
        Map<String, dynamic>.from(data),
      );
      if (_diamondsPK.isEmpty) {
        _diamondsPK.value = [diamond];
      } else {
        final x =
            _diamondsPK.firstWhereOrNull((e) => e.userId == diamond.userId);
        if (x == null) {
          _diamondsPK.value = [..._diamondsPK, diamond];
        } else {
          _diamondsPK.value = _diamondsPK.map((e) {
            if (e.userId == diamond.userId) return diamond;
            return e;
          }).toList();
        }
      }
    });

    socketService.on(socketPkGameFinishEvent, (Map data) {
      debugPrint('$socketPkGameFinishEvent ===> $data');

    });

    socketService.on(socketPkMessageEvent, (Map data) {
      debugPrint('$socketPkMessageEvent ===> $data');
      if (_info.value.pk == null) return;
      if (!_me.value.isOwner) return;
      final user = User.fromJson(data['user']);
      final message = UserMessage(
        member: LiveMember(
          info: LiveMemberInfo(
            userID: user.id ?? 0,
            avatar: user.avatar ?? '',
            name: user.nickname ?? user.fullName ?? user.displayName ?? '',
          ),
          isOwner: false,
          liveID: data['liveId'],
        ),
        message: data['rawContent'] ?? '',
        createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
      );
      NotificationCenter.post(channel: receiveMessage, options: message);
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
            userID: gift.giver!.id!,
            name: gift.giver!.displayName!,
            avatar: gift.giver?.avatar ?? '',
          ),
          liveID: _info.value.id,
        ),
        message: 'đã tặng ${gift.giftCard?.name} x${gift.total}',
        createdAt: DateTime.now(),
      );
      NotificationCenter.post(channel: receiveMessage, options: message);
    });

    socketService.on(socketUserJoinEvent, (Map data) {
      debugPrint('$socketUserJoinEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (_me.value.info.userID == user.id) {
        if (_me.value.isOwner && _enablePk.value) return;
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

        final message = JoinMessage(
          member: _me.value,
          message: '',
          createdAt: DateTime.now(),
        );

        NotificationCenter.post(channel: receiveMessage, options: message);
        return;
      }
      if (isMemberInLive(user.id!)) return;
      final member = LiveMember(
        info: LiveMemberInfo(
          userID: user.id!,
          name: user.nickname ?? user.fullName ?? user.displayName ?? '',
          avatar: user.avatar ?? '',
        ),
        isOwner: user.id == _info.value.user?.id,
        liveID: data['liveId'],
      );
      _members.value = [..._members, member];

      LiveManageState.hostID.value = hostID;

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
      if (_info.value.pk != null && _me.value.isOwner) return;
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
      Navigator.popUntil(context, (route) {
        if (route.settings.name == LiveWrapperScreen.routerName) {
          return true;
        }
        if (route.settings.name == LiveHomeScreen.routeName) {
          return true;
        }
        return false;
      });
    });

    socketService.on(socketPkEndEvent, (data) async {
      rejoinNonPk(_info.value.id);
    });

    socketService.on(socketInvitePkEvent, (Map data) {
      final liveID = data['liveId'] ?? '';
      final user = User.fromJson(data['inviter']);

      showDialog(
        context: AppCoordinator.rootNavigator.currentContext!,
        builder: (_) => InvitePkDialog(
          user: user,
          onPress: () async {
            try {
              context.showLoading();
              final ok = await repository.acceptPK({
                'inviterId': user.id,
                'inviterLiveId': liveID,
                'liveId': _info.value.id,
              });
              if (!context.mounted) return;
              context.hideLoading();
              if (!ok) {
                // context.showToastMessage(
                //   'Lời mời đã hết hạn',
                //   ToastMessageType.error,
                // );
              }
            } catch (e) {
              context.hideLoading();
            }
          },
        ),
      );
    });
  }

  void leaveLive() async {
    if (_info.value.pk != null) {
      if (_me.value.isOwner) {
        await repository.deletePK(_info.value.id).onError((error, stackTrace) {
          rejoinNonPk(_info.value.id);
        });
        return;
      }
    }

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
