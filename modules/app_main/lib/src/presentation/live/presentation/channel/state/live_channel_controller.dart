import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/coordinator/app_context.dart';
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
import 'package:app_main/src/presentation/live/presentation/channel/live_channel_screen.dart';
import 'package:app_main/src/presentation/live/presentation/live_home/live_home_screen.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/enable_share_message_dialog.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/invite_pk_dialog.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_config_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../data/model/response/gift_card_live.dart';
import '../../../data/model/response/sent_gift_response.dart';
import '../../../data/repository/live_repository.dart';
import '../../../domain/entities/virtual_info.dart';
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

enum PkStep {
  pending,
  starting,
  started,
  end;
}

enum PkAction {
  none,
  preEnd;
}

enum LiveChannelType {
  unKnow,
  normal,
  pk,
  virtual;
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

  LivePkData? _pkData;

  LivePkData? get pkData => _pkData;

  Round? _currentGameRound;

  Round? get currentGameRound => _currentGameRound;

  final RxList<UserDiamondForPK> _diamondsPK = <UserDiamondForPK>[].obs;

  RxList<UserDiamondForPK> get diamondsPK => _diamondsPK;

  final Rx<PkStep> _pkStep = PkStep.pending.obs;

  Rx<PkStep> get pkStep => _pkStep;

  final Rx<PkAction> _pkAction = PkAction.none.obs;

  Rx<PkAction> get pkAction => _pkAction;

  final RxList<LiveMember> _giftMembers = <LiveMember>[].obs;

  RxList<LiveMember> get giftMembers => _giftMembers;

  bool get hostLivePk {
    if (_pkData == null) return false;
    if (hostID == _pkData!.pk.hostID) return true;
    return false;
  }

  int get hostOtherID {
    if (_pkData == null) throw Exception('not live pk');
    final user = _pkData?.lives.firstWhereOrNull((e) => e.user?.id != hostID);
    if (user == null) throw Exception('host leave live');
    return user.user!.id!;
  }

  int get liveOtherID {
    if (_pkData == null) throw Exception('not live pk');
    final live = _pkData?.lives.firstWhereOrNull((e) => e.id != _info.value.id);
    if (live == null) throw Exception('host leave live');
    return live.id;
  }

  bool get hostInLive {
    if (_me.value.isOwner) return true;
    return host != null;
  }

  final liveState = const GiftCardLive().obs;

  LiveMember? get host {
    final host = _members
        .firstWhereOrNull((e) => e.isOwner && e.liveID == _info.value.id);
    return host;
  }

  Future<void> getLeaderBoard(int roomId) async {
    try {
      await getLiveState(_info.value.id);
      giftCardLive.value = await repository.getInfoGiftCard(roomId);
    } catch (e) {}
  }

  Future<void> getLiveState(int liveId) async {
    try {
      liveState.value = await repository.getLiveState(liveId);
    } catch (e) {}
  }

  int get hostID {
    if (_me.value.isOwner) return _me.value.info.userID;
    final host = _members
        .firstWhereOrNull((e) => e.isOwner && e.liveID == _info.value.id);
    return host!.info.userID;
  }

  LiveData get info => _info.value;

  final Rxn<VirtualInfo> _virtualInfo = Rxn<VirtualInfo>();

  Rxn<VirtualInfo> get virtualInfo => _virtualInfo;

  final RxBool _mic = false.obs;

  RxBool get mic => _mic;

  final RxBool _video = false.obs;

  RxBool get video => _video;

  final Rx<LiveChannelType> _liveType = LiveChannelType.normal.obs;

  Rx<LiveChannelType> get liveType => _liveType;

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

  void showConfigPk() {
    showModalBottomSheet(
      context: AppCoordinator.rootNavigator.currentContext!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Provider.value(
        value: this,
        child: PkConfigSheet(
          onGameStarted: (game) async {
            if (_pkStep.value == PkStep.pending) {
              repository.startGame({
                'liveId': _info.value.id,
                'roundCount': game.roundCount,
                'roundDurationSecond': game.roundDurationSecond,
                'roundTimeBreak': game.roundTimeBreak,
              });
            }
          },
        ),
      ),
    );
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

    LiveManageState.hostID.value = hostID;

    _liveType.value = LiveChannelType.normal;
  }

  BuildContext get context => AppContext.scaffoldContext;

  void shareMessageDialog() async {
    final ok = await showDialog(
          context: AppCoordinator.rootNavigator.currentContext!,
          builder: (_) => const EnableShareMessageDialog(),
        ) ??
        false;

    if (ok) {
      if (_pkData == null) return;
      repository.updatePk(_pkData!.pk.id, true);
    }
  }

  void joinPk(int id) async {
    _roomInfoFetching.value = true;
    final res = await repository.joinLive(id: id, password: _password);
    _info.value = res.data;
    _pkData = await repository.getPk(id);
    if (_me.value.info.userID == _pkData?.pk.hostID) shareMessageDialog();
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

    LiveManageState.hostID.value = hostID;

    _liveType.value = LiveChannelType.pk;
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

  Future _initLiveInfo(List res) async {
    final joinRes = res.first as JoinLiveResponse;
    final user = res.last as User;

    _info = joinRes.data.obs;
    if (_info.value.pk != null) {
      _pkData = await repository.getPk(_info.value.id);
    } else {
      _pkData = null;
    }

    _me = LiveMember(
      info: LiveMemberInfo(
        userID: user.id ?? 0,
        name: user.nickname ?? user.fullName ?? user.displayName ?? '',
        avatar: user.avatar ?? '',
      ),
      isOwner: _info.value.user?.id == user.id,
      liveID: _info.value.id,
    ).obs;

    if (_info.value.virtualInfo != null) {
      _virtualInfo.value = _info.value.virtualInfo;
      _liveType.value = LiveChannelType.virtual;
      return;
    }

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
  }

  void join(int id) async {
    LiveManageState.join(id, this);
    try {
      ///lấy thông tin room và thông tin người join
      final res = await Future.wait([
        repository.joinLive(id: id, password: _password),
        userUseCase.getProfile(),
      ]);

      await _initLiveInfo(res);

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

      _onSocketEvent();

      socketService.connect(
        '${Configurations.baseUrl}live?id=${_info.value.id}',
        token: userSharePreferencesUseCase.getToken() ?? '',
      );

      if (_liveType.value != LiveChannelType.virtual) {
        _listenRtcEvent();

        await service.joinChannel(
          _agora?.token ?? '',
          _agora?.channel ?? '',
          _me.value.info.userID,
          role: _me.value.isOwner
              ? ClientRoleType.clientRoleBroadcaster
              : ClientRoleType.clientRoleAudience,
        );
      }

      _hostOffline.value = !hostInLive;

      _state.value = LiveStreamState.watching;

      WakelockPlus.enable();

      if (_me.value.isOwner) {
        _mic.value = true;
        _video.value = true;
      }

      if (_pkData != null) {
        if (_pkData!.latestRound != null) {
          _currentGameRound = _pkData!.latestRound;
          if (_currentGameRound?.endAt.isAfter(DateTime.now()) ?? false) {
            _pkStep.value = PkStep.started;
          } else {
            _pkStep.value = PkStep.end;
          }
          _getPkStats();
        }

        _liveType.value = LiveChannelType.pk;
      } else {
        _liveType.value = LiveChannelType.normal;
      }

      LiveManageState.hostID.value = hostID;

      if (Platform.isAndroid) _initForegroundTask();
    } catch (e) {}
  }

  void _getPkStats() async {
    if (_pkData == null) return;
    final res = await repository.getStats(_pkData!.pk.id);
    final diamonds = res
        .map(
          (e) => UserDiamondForPK(
            userId: e.user.id ?? 0,
            diamondCount: e.diamondCount,
          ),
        )
        .toList();
    setDiamonds(diamonds);
  }

  void setDiamonds(List<UserDiamondForPK> diamonds) {
    _diamondsPK.value = diamonds;
    _diamondsPK.sort((a, b) => a.diamondCount.compareTo(b.diamondCount));
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

  void readyPk() {
    repository.readyGame(_info.value.id);
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

  Timer? _timer;

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

    socketService.on(socketReactionEvent, (Map data) {
      debugPrint('$socketReactionEvent ===> $data');
      if (data['type'] == 'heart') {
        NotificationCenter.post(channel: reactionEvent);
      }
    });

    socketService.on(socketReadyPkEvent, (Map data) {
      debugPrint('$socketReadyPkEvent ===> $data');
      if (data['user'] != null) {
        final user = User.fromJson(data['user']);
        if (user.id != _me.value.info.userID && _me.value.isOwner) {
          readyPk();
        }
      }
    });

    socketService.on(socketPkRoundStartEvent, (Map data) {
      debugPrint('$socketPkRoundStartEvent ===> ${data['round']}');
      if (data['round'] != null) {
        final round = Round.fromJson(data['round']);
        _currentGameRound = round;
        _pkStep.value = PkStep.started;
      }
    });

    socketService.on(socketPkRoundFinishEvent, (Map data) {
      debugPrint('$socketPkRoundFinishEvent ===> ${data['round']}');
      _pkStep.value = PkStep.end;
      if (_timer != null) _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
        repository.deleteGame(_pkData!.pk.id);
        _pkStep.value = PkStep.pending;
        _diamondsPK.value = [];
        _giftMembers.value = [];
        _timer?.cancel();
      });
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
          setDiamonds([..._diamondsPK, diamond]);
        } else {
          final diamonds = _diamondsPK.map((e) {
            if (e.userId == diamond.userId) return diamond;
            return e;
          }).toList();

          setDiamonds(diamonds);
        }
      }
    });

    socketService.on(socketPkGameFinishEvent, (Map data) {
      debugPrint('$socketPkGameFinishEvent ===> $data');
      _pkStep.value = PkStep.end;
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
      if (_liveType.value == LiveChannelType.pk) {
        final member =
            _members.firstWhereOrNull((e) => e.info.userID == gift.giver?.id);
        final ids = _giftMembers.map((e) => e.info.userID);
        if (member != null && !ids.contains(member.info.userID)) {
          _giftMembers.value = [..._giftMembers, member];
        }
      }
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

    socketService.on(socketGiftInfoUpdated, (Map<String, Object?> data) {
      debugPrint('$socketGiftInfoUpdated ===> $data');
      liveState.value = GiftCardLive.fromJson(data);
    });

    socketService.on(socketUserJoinEvent, (Map data) {
      debugPrint('$socketUserJoinEvent ===> ${data['user']}');
      final user = User.fromJson(data['user']);
      if (_me.value.info.userID == user.id) {
        if (_me.value.isOwner && _liveType.value == LiveChannelType.pk) return;
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
        if (_liveType.value == LiveChannelType.pk) {
          _pkStep.value = PkStep.pending;
          _diamondsPK.value = [];
          _giftMembers.value = [];
          rejoinNonPk(_info.value.id);
          return;
        }
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
        liveId: data['liveId'],
      );
      NotificationCenter.post(channel: receiveMessage, options: message);
    });

    socketService.on(socketPkStartEvent, (data) {
      if (_me.value.isOwner) {
        Navigator.popUntil(AppCoordinator.rootNavigator.currentContext!,
            (route) {
          if (route.settings.name == LiveWrapperScreen.routerName) {
            return true;
          }
          if (route.settings.name == LiveHomeScreen.routeName) {
            return true;
          }
          if (route.settings.name == LiveChannelScreen.routerName) {
            return true;
          }
          if (route.settings.name == JoinChannelPasswordProvider.routerName) {
            return true;
          }
          return false;
        });
      }
      joinPk(_info.value.id);
    });

    socketService.on(socketPkEndEvent, (data) async {
      _pkStep.value = PkStep.pending;
      _diamondsPK.value = [];
      _giftMembers.value = [];
      rejoinNonPk(_info.value.id);
    });

    socketService.on(socketInvitePkEvent, (Map data) {
      final liveID = data['liveId'] ?? '';
      final user = User.fromJson(data['inviter']);

      showInvitePk(liveID, user);
    });

    socketService.on(socketPkGameStartEvent, (Map data) {
      _pkStep.value = PkStep.starting;
      if (_timer != null) _timer?.cancel();
    });
  }

  void showInvitePk(int liveID, User user) {
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
  }

  void leaveLive() async {
    _timer?.cancel();
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
