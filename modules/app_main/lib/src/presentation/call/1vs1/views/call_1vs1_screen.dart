import 'dart:async';
import 'dart:math';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/stringee/player_manager/single_player_manager.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:easy_audio/easy_audio.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:ui/ui.dart';

import '../../../../application.dart';
import '../../models/call_1vs1_state_data.dart';
import '../bloc/call_1vs1_bloc.dart';

part 'call_1vs1_action.dart';

class Call1vs1Screen extends StatefulWidget {
  static String get routeName => 'call_1vs1';

  const Call1vs1Screen({
    super.key,
    required this.callType,
  });
  final CallType callType;

  @override
  State<Call1vs1Screen> createState() => Call1vs1ScreenState();
}

class Call1vs1ScreenState extends StatefulWidgetBase<Call1vs1Screen> with SinglePlayerPlayingMixin {
  final _audioController = EasyAudioController();

  bool ringtonePlaying = false;

  final ringtonePathCached = <String, String>{};

  Call1vs1Bloc get bloc => context.read();

  late MediaQueryData mediaData;

  late CallType callType = widget.callType;

  @override
  DeviceService get deviceService => injector.get();

  @override
  Color get buttomNavigationBarColor => callType == CallType.audio ? Colors.blue : Colors.black;

  @override
  bool get isDark => true;

  @override
  bool isPlaying(ChangeNotifier controller) {
    return _audioController.isPlaying;
  }

  @override
  FutureOr pause(ChangeNotifier controller) {
    // _audioController.pause();
  }

  @override
  ChangeNotifier registerPlayer(BuildContext context) {
    return _audioController.onProgress;
  }

  @override
  void initState() {
    _audioController.initPlayer();
    _audioController.onPlayerComplete.listen((_) {
      _handleRingtoneCompleted();
    });

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // make sure check bloc state after first layout
        // bcs the state maybe changed before this screen initialed
        _blocListener(context, bloc.state);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _audioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaData = MediaQuery.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blueEdit,
        body: BlocConsumer<Call1vs1Bloc, Call1vs1State>(
          listener: _blocListener,
          bloc: bloc,
          builder: (context, state) {
            return _buildBody(state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(Call1vs1State state) {
    return Stack(
      children: [
        SizedBox.fromSize(
          size: mediaData.size,
          child: Builder(
            builder: (context) {
              if (state.callState.hasLocalTrack &&
                  state.callType == CallType.video &&
                  state.isMakingACall) {
                StringeeVideoView(
                  state.callId,
                  true,
                  alignment: Alignment.topRight,
                  borderRadius: BorderRadius.circular(12),
                  margin: const EdgeInsets.only(top: 128, right: 16),
                  height: 195,
                  width: 136,
                  scalingType: ScalingType.fill,
                );
              }
              if (state.callState.hasPaticipantTrack &&
                  state.callId.isNotNullOrEmpty &&
                  state.callType == CallType.video) {
                return StringeeVideoView(
                  state.callId,
                  false,
                  isMirror: false,
                  alignment: Alignment.center,
                  height: mediaData.size.height,
                  width: mediaData.size.width,
                  scalingType: ScalingType.fill,
                );
              }
              return const SizedBox();
            },
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              _buildAppbarByState(state),
              Expanded(
                child: state.callState.hasLocalTrack && state.isInCall
                    ? _buildMyTrack(state)
                    : (state.callType == CallType.video && state.isInCall)
                        ? const SizedBox()
                        : _buildCallInfo(state),
              ),
              _buildBottomButtons(state),
              SizedBox(height: min(mediaData.padding.bottom, 24)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMyTrack(Call1vs1State state) {
    if (!state.callState.hasLocalTrack ||
        state.callId.isNullOrEmpty ||
        state.callType != CallType.video) {
      return const SizedBox();
    }
    return StringeeVideoView(
      state.callId,
      true,
      alignment: Alignment.topRight,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.only(top: 2, right: 16),
      height: 195,
      width: 136,
      scalingType: ScalingType.fill,
    );
  }

  Widget _buildAppbarByState(Call1vs1State state) {
    return Row(
      children: [
        kSpacingWidth16,
        const SizedBox(
          width: 40,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'VDONE',
                style: context.text.bodyMedium?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              if (state.isInCall && state.callType == CallType.video)
                TickerBuilder(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  builder: (context) {
                    return Text(
                      state.data.startTime.let((it) {
                        if (it == null) {
                          return '00:00';
                        }
                        return DateTime.now().difference(it).mmss;
                      }),
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff00ff92),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        _appBarActionIcon(state),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildCallInfo(Call1vs1State state) {
    const avatarSize = 120.0;
    final callEffectSize = mediaData.size.width * 0.66;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        CallingEffectWidget(size: callEffectSize),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: callEffectSize / 2 - avatarSize / 2),
            AvatarWidget(
              avatar: state.participant?.avatar,
              size: avatarSize,
              showBorder: false,
            ),
            const SizedBox(height: 26),
            Text(
              state.participant?.displayName ?? '',
              style: context.textTheme.labelLarge?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            _buildCallState(state),
          ],
        ),
      ],
    );
  }

  Widget _buildCallState(Call1vs1State state) {
    switch (state.screenState) {
      case CallScreenState.inCall:
        return TickerBuilder(
          duration: const Duration(
            milliseconds: 300,
          ),
          builder: (context) {
            return Text(
              state.data.startTime.let((it) {
                if (it == null) {
                  return '00:00';
                }
                return DateTime.now().difference(it).mmss;
              }),
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xff00ff92),
              ),
            );
          },
        );

      case CallScreenState.incomingCall:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              state.callType == CallType.audio
                  ? 'Cuộc gọi thường đến từ ${state.participant?.displayName ?? ''}'
                  : 'Cuộc gọi video đến từ ${state.participant?.displayName ?? ''}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        );
      case CallScreenState.makingACall:
        return const Text(
          'Đang đổ chuông',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        );
      default:
    }
    return const SizedBox();
  }

  Widget _buildBottomButtons(Call1vs1State state) {
    final screenWidth = MediaQuery.of(context).size.width;
    final btnSizeByVideoCall = max(74.0, (screenWidth - 100) / 4);
    switch (state.screenState) {
      case CallScreenState.makingACall:
      case CallScreenState.inCall:
      case CallScreenState.leaving:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state.callType == CallType.audio) ...[
              _buildSpeakerButton(state, size: 74),
              _buildEndCallButton(state),
              _buildMicButton(state, size: 74),
            ],
            if (state.callType == CallType.video) ...[
              _buildVideoButton(
                state,
                size: btnSizeByVideoCall,
              ),
              _buildEndCallButton(
                state,
                size: btnSizeByVideoCall,
              ),
              _buildMicButton(
                state,
                size: btnSizeByVideoCall,
              ),
            ],
          ],
        );

      case CallScreenState.incomingCall:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state.callType == CallType.audio) ...[
              _buildRejectButton(state),
              _buildAcceptButton(state),
            ],
            if (state.callType == CallType.video) ...[
              _buildRejectButton(state),
              _buildAcceptButton(state),
            ],
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildVideoButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: state.callState.isEnableCamera
          ? IconAppConstants.icVideoCall
          : IconAppConstants.icVideoOff,
      enable: !state.isLeaving,
      onPressed: onPressVideoCall,
    );
  }

  Widget _buildSpeakerButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: state.callState.isSpeaker ? IconAppConstants.icVolumeOn : IconAppConstants.icVolume,
      enable: !state.isLeaving,
      onPressed: onPressSpeaker,
    );
  }

  Widget _buildEndCallButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: IconAppConstants.icEnd,
      enable: !state.isLeaving,
      onPressed: onEndCall,
    );
  }

  Widget _buildMicButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: state.callState.isMute ? IconAppConstants.icMicOff : IconAppConstants.icMicro,
      enable: state.isInCall && !state.isLeaving,
      onPressed: onPressMic,
    );
  }

  Widget _buildRejectButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: IconAppConstants.icEnd,
      enable: !state.isLeaving,
      onPressed: onEndCall,
    );
  }

  Widget _buildAcceptButton(
    Call1vs1State state, {
    double? size,
  }) {
    return _buildIconButton(
      size: size ?? 72,
      iconSize: 72,
      icon: state.callType == CallType.audio
          ? IconAppConstants.icAnswer
          : IconAppConstants.icVideoAnswer,
      enable: !state.isLeaving,
      onPressed: onAnswer,
    );
  }

  Widget _appBarActionIcon(Call1vs1State state) {
    if (state.callType == CallType.video) {
      return _buildIconButton(
        size: 40,
        iconSize: 40,
        icon: IconAppConstants.icSwitchCamera,
        onPressed: onSwitchCamera,
        enable: state.isInCall && !state.isLeaving && state.callState.hasLocalTrack,
      );
    }
    return const SizedBox(
      width: 40,
    );

    /// Pending handle swith to video call from audio call by requirement
    ///
    // final isEnableCamera = state.callState.hasLocalTrack;
    // return _buildIconButton(
    //   iconSize: 16,
    //   size: 34,
    //   color: isEnableCamera ? Colors.white : Colors.black38,
    //   icColor: isEnableCamera ? Colors.black : Colors.white,
    //   icon: IconConstants.icVideoCall,
    //   onPressed: onPressVideoCall,
    //   enable: state.isInCall && !state.isLeaving,
    // );
  }

  Widget _buildIconButton({
    double iconSize = 34,
    double size = 72,
    Color? color,
    Color? icColor,
    required String icon,
    void Function()? onPressed,
    bool enable = true,
    bool enableBorder = false,
    String? title,
  }) {
    final button = IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxHeight: size,
        maxWidth: size,
        minHeight: size,
        minWidth: size,
      ),
      icon: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: enable ? color : Colors.black38,
          shape: BoxShape.circle,
          border: !enableBorder
              ? null
              : Border.all(
                  color: enable ? color ?? Colors.transparent : Colors.transparent,
                  width: 1,
                ),
        ),
        alignment: Alignment.center,
        child: ImageWidget(
          icon,
          width: iconSize,
          height: iconSize,
          color: enable ? icColor : Colors.white54,
          fit: BoxFit.contain,
        ),
      ),
      onPressed: enable ? onPressed : null,
    );

    if (title.isNotNullOrEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          button,
          const SizedBox(height: 9),
          Text(
            title!,
            style: context.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      );
    }
    return button;
  }
}
