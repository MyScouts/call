// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_1vs1_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Call1vs1StateData {
  User? get me => throw _privateConstructorUsedError;
  User? get participant => throw _privateConstructorUsedError;
  CallType get callType => throw _privateConstructorUsedError;
  CallScreenState get screenState => throw _privateConstructorUsedError;
  CallState get callState => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Call1vs1StateDataCopyWith<Call1vs1StateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Call1vs1StateDataCopyWith<$Res> {
  factory $Call1vs1StateDataCopyWith(
          Call1vs1StateData value, $Res Function(Call1vs1StateData) then) =
      _$Call1vs1StateDataCopyWithImpl<$Res, Call1vs1StateData>;
  @useResult
  $Res call(
      {User? me,
      User? participant,
      CallType callType,
      CallScreenState screenState,
      CallState callState,
      DateTime? startTime});

  $UserCopyWith<$Res>? get me;
  $UserCopyWith<$Res>? get participant;
  $CallStateCopyWith<$Res> get callState;
}

/// @nodoc
class _$Call1vs1StateDataCopyWithImpl<$Res, $Val extends Call1vs1StateData>
    implements $Call1vs1StateDataCopyWith<$Res> {
  _$Call1vs1StateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? me = freezed,
    Object? participant = freezed,
    Object? callType = null,
    Object? screenState = null,
    Object? callState = null,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as User?,
      callType: null == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as CallType,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as CallScreenState,
      callState: null == callState
          ? _value.callState
          : callState // ignore: cast_nullable_to_non_nullable
              as CallState,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get participant {
    if (_value.participant == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.participant!, (value) {
      return _then(_value.copyWith(participant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CallStateCopyWith<$Res> get callState {
    return $CallStateCopyWith<$Res>(_value.callState, (value) {
      return _then(_value.copyWith(callState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$Call1vs1StateDataImplCopyWith<$Res>
    implements $Call1vs1StateDataCopyWith<$Res> {
  factory _$$Call1vs1StateDataImplCopyWith(_$Call1vs1StateDataImpl value,
          $Res Function(_$Call1vs1StateDataImpl) then) =
      __$$Call1vs1StateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? me,
      User? participant,
      CallType callType,
      CallScreenState screenState,
      CallState callState,
      DateTime? startTime});

  @override
  $UserCopyWith<$Res>? get me;
  @override
  $UserCopyWith<$Res>? get participant;
  @override
  $CallStateCopyWith<$Res> get callState;
}

/// @nodoc
class __$$Call1vs1StateDataImplCopyWithImpl<$Res>
    extends _$Call1vs1StateDataCopyWithImpl<$Res, _$Call1vs1StateDataImpl>
    implements _$$Call1vs1StateDataImplCopyWith<$Res> {
  __$$Call1vs1StateDataImplCopyWithImpl(_$Call1vs1StateDataImpl _value,
      $Res Function(_$Call1vs1StateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? me = freezed,
    Object? participant = freezed,
    Object? callType = null,
    Object? screenState = null,
    Object? callState = null,
    Object? startTime = freezed,
  }) {
    return _then(_$Call1vs1StateDataImpl(
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as User?,
      callType: null == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as CallType,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as CallScreenState,
      callState: null == callState
          ? _value.callState
          : callState // ignore: cast_nullable_to_non_nullable
              as CallState,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$Call1vs1StateDataImpl implements _Call1vs1StateData {
  const _$Call1vs1StateDataImpl(
      {this.me,
      this.participant,
      this.callType = CallType.audio,
      this.screenState = CallScreenState.none,
      this.callState = const CallState(),
      this.startTime});

  @override
  final User? me;
  @override
  final User? participant;
  @override
  @JsonKey()
  final CallType callType;
  @override
  @JsonKey()
  final CallScreenState screenState;
  @override
  @JsonKey()
  final CallState callState;
  @override
  final DateTime? startTime;

  @override
  String toString() {
    return 'Call1vs1StateData(me: $me, participant: $participant, callType: $callType, screenState: $screenState, callState: $callState, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Call1vs1StateDataImpl &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.participant, participant) ||
                other.participant == participant) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            (identical(other.callState, callState) ||
                other.callState == callState) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, me, participant, callType,
      screenState, callState, startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Call1vs1StateDataImplCopyWith<_$Call1vs1StateDataImpl> get copyWith =>
      __$$Call1vs1StateDataImplCopyWithImpl<_$Call1vs1StateDataImpl>(
          this, _$identity);
}

abstract class _Call1vs1StateData implements Call1vs1StateData {
  const factory _Call1vs1StateData(
      {final User? me,
      final User? participant,
      final CallType callType,
      final CallScreenState screenState,
      final CallState callState,
      final DateTime? startTime}) = _$Call1vs1StateDataImpl;

  @override
  User? get me;
  @override
  User? get participant;
  @override
  CallType get callType;
  @override
  CallScreenState get screenState;
  @override
  CallState get callState;
  @override
  DateTime? get startTime;
  @override
  @JsonKey(ignore: true)
  _$$Call1vs1StateDataImplCopyWith<_$Call1vs1StateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CallState {
  bool get isSpeaker => throw _privateConstructorUsedError;
  bool get isEnableCamera => throw _privateConstructorUsedError;
  bool get isMute => throw _privateConstructorUsedError;
  bool get hasLocalTrack => throw _privateConstructorUsedError;
  bool get hasPaticipantTrack => throw _privateConstructorUsedError;
  String? get callId => throw _privateConstructorUsedError;
  StringeeMediaState? get mediaState => throw _privateConstructorUsedError;
  StringeeSignalingState? get signaling => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get callInfo => throw _privateConstructorUsedError;
  AudioDevice? get audioDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallStateCopyWith<CallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallStateCopyWith<$Res> {
  factory $CallStateCopyWith(CallState value, $Res Function(CallState) then) =
      _$CallStateCopyWithImpl<$Res, CallState>;
  @useResult
  $Res call(
      {bool isSpeaker,
      bool isEnableCamera,
      bool isMute,
      bool hasLocalTrack,
      bool hasPaticipantTrack,
      String? callId,
      StringeeMediaState? mediaState,
      StringeeSignalingState? signaling,
      Map<dynamic, dynamic>? callInfo,
      AudioDevice? audioDevice});
}

/// @nodoc
class _$CallStateCopyWithImpl<$Res, $Val extends CallState>
    implements $CallStateCopyWith<$Res> {
  _$CallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSpeaker = null,
    Object? isEnableCamera = null,
    Object? isMute = null,
    Object? hasLocalTrack = null,
    Object? hasPaticipantTrack = null,
    Object? callId = freezed,
    Object? mediaState = freezed,
    Object? signaling = freezed,
    Object? callInfo = freezed,
    Object? audioDevice = freezed,
  }) {
    return _then(_value.copyWith(
      isSpeaker: null == isSpeaker
          ? _value.isSpeaker
          : isSpeaker // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableCamera: null == isEnableCamera
          ? _value.isEnableCamera
          : isEnableCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      isMute: null == isMute
          ? _value.isMute
          : isMute // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLocalTrack: null == hasLocalTrack
          ? _value.hasLocalTrack
          : hasLocalTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaticipantTrack: null == hasPaticipantTrack
          ? _value.hasPaticipantTrack
          : hasPaticipantTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaState: freezed == mediaState
          ? _value.mediaState
          : mediaState // ignore: cast_nullable_to_non_nullable
              as StringeeMediaState?,
      signaling: freezed == signaling
          ? _value.signaling
          : signaling // ignore: cast_nullable_to_non_nullable
              as StringeeSignalingState?,
      callInfo: freezed == callInfo
          ? _value.callInfo
          : callInfo // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      audioDevice: freezed == audioDevice
          ? _value.audioDevice
          : audioDevice // ignore: cast_nullable_to_non_nullable
              as AudioDevice?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallStateImplCopyWith<$Res>
    implements $CallStateCopyWith<$Res> {
  factory _$$CallStateImplCopyWith(
          _$CallStateImpl value, $Res Function(_$CallStateImpl) then) =
      __$$CallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSpeaker,
      bool isEnableCamera,
      bool isMute,
      bool hasLocalTrack,
      bool hasPaticipantTrack,
      String? callId,
      StringeeMediaState? mediaState,
      StringeeSignalingState? signaling,
      Map<dynamic, dynamic>? callInfo,
      AudioDevice? audioDevice});
}

/// @nodoc
class __$$CallStateImplCopyWithImpl<$Res>
    extends _$CallStateCopyWithImpl<$Res, _$CallStateImpl>
    implements _$$CallStateImplCopyWith<$Res> {
  __$$CallStateImplCopyWithImpl(
      _$CallStateImpl _value, $Res Function(_$CallStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSpeaker = null,
    Object? isEnableCamera = null,
    Object? isMute = null,
    Object? hasLocalTrack = null,
    Object? hasPaticipantTrack = null,
    Object? callId = freezed,
    Object? mediaState = freezed,
    Object? signaling = freezed,
    Object? callInfo = freezed,
    Object? audioDevice = freezed,
  }) {
    return _then(_$CallStateImpl(
      isSpeaker: null == isSpeaker
          ? _value.isSpeaker
          : isSpeaker // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableCamera: null == isEnableCamera
          ? _value.isEnableCamera
          : isEnableCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      isMute: null == isMute
          ? _value.isMute
          : isMute // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLocalTrack: null == hasLocalTrack
          ? _value.hasLocalTrack
          : hasLocalTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaticipantTrack: null == hasPaticipantTrack
          ? _value.hasPaticipantTrack
          : hasPaticipantTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaState: freezed == mediaState
          ? _value.mediaState
          : mediaState // ignore: cast_nullable_to_non_nullable
              as StringeeMediaState?,
      signaling: freezed == signaling
          ? _value.signaling
          : signaling // ignore: cast_nullable_to_non_nullable
              as StringeeSignalingState?,
      callInfo: freezed == callInfo
          ? _value._callInfo
          : callInfo // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      audioDevice: freezed == audioDevice
          ? _value.audioDevice
          : audioDevice // ignore: cast_nullable_to_non_nullable
              as AudioDevice?,
    ));
  }
}

/// @nodoc

class _$CallStateImpl implements _CallState {
  const _$CallStateImpl(
      {this.isSpeaker = true,
      this.isEnableCamera = false,
      this.isMute = false,
      this.hasLocalTrack = false,
      this.hasPaticipantTrack = false,
      this.callId,
      this.mediaState,
      this.signaling,
      final Map<dynamic, dynamic>? callInfo,
      this.audioDevice})
      : _callInfo = callInfo;

  @override
  @JsonKey()
  final bool isSpeaker;
  @override
  @JsonKey()
  final bool isEnableCamera;
  @override
  @JsonKey()
  final bool isMute;
  @override
  @JsonKey()
  final bool hasLocalTrack;
  @override
  @JsonKey()
  final bool hasPaticipantTrack;
  @override
  final String? callId;
  @override
  final StringeeMediaState? mediaState;
  @override
  final StringeeSignalingState? signaling;
  final Map<dynamic, dynamic>? _callInfo;
  @override
  Map<dynamic, dynamic>? get callInfo {
    final value = _callInfo;
    if (value == null) return null;
    if (_callInfo is EqualUnmodifiableMapView) return _callInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final AudioDevice? audioDevice;

  @override
  String toString() {
    return 'CallState(isSpeaker: $isSpeaker, isEnableCamera: $isEnableCamera, isMute: $isMute, hasLocalTrack: $hasLocalTrack, hasPaticipantTrack: $hasPaticipantTrack, callId: $callId, mediaState: $mediaState, signaling: $signaling, callInfo: $callInfo, audioDevice: $audioDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallStateImpl &&
            (identical(other.isSpeaker, isSpeaker) ||
                other.isSpeaker == isSpeaker) &&
            (identical(other.isEnableCamera, isEnableCamera) ||
                other.isEnableCamera == isEnableCamera) &&
            (identical(other.isMute, isMute) || other.isMute == isMute) &&
            (identical(other.hasLocalTrack, hasLocalTrack) ||
                other.hasLocalTrack == hasLocalTrack) &&
            (identical(other.hasPaticipantTrack, hasPaticipantTrack) ||
                other.hasPaticipantTrack == hasPaticipantTrack) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.mediaState, mediaState) ||
                other.mediaState == mediaState) &&
            (identical(other.signaling, signaling) ||
                other.signaling == signaling) &&
            const DeepCollectionEquality().equals(other._callInfo, _callInfo) &&
            (identical(other.audioDevice, audioDevice) ||
                other.audioDevice == audioDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSpeaker,
      isEnableCamera,
      isMute,
      hasLocalTrack,
      hasPaticipantTrack,
      callId,
      mediaState,
      signaling,
      const DeepCollectionEquality().hash(_callInfo),
      audioDevice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallStateImplCopyWith<_$CallStateImpl> get copyWith =>
      __$$CallStateImplCopyWithImpl<_$CallStateImpl>(this, _$identity);
}

abstract class _CallState implements CallState {
  const factory _CallState(
      {final bool isSpeaker,
      final bool isEnableCamera,
      final bool isMute,
      final bool hasLocalTrack,
      final bool hasPaticipantTrack,
      final String? callId,
      final StringeeMediaState? mediaState,
      final StringeeSignalingState? signaling,
      final Map<dynamic, dynamic>? callInfo,
      final AudioDevice? audioDevice}) = _$CallStateImpl;

  @override
  bool get isSpeaker;
  @override
  bool get isEnableCamera;
  @override
  bool get isMute;
  @override
  bool get hasLocalTrack;
  @override
  bool get hasPaticipantTrack;
  @override
  String? get callId;
  @override
  StringeeMediaState? get mediaState;
  @override
  StringeeSignalingState? get signaling;
  @override
  Map<dynamic, dynamic>? get callInfo;
  @override
  AudioDevice? get audioDevice;
  @override
  @JsonKey(ignore: true)
  _$$CallStateImplCopyWith<_$CallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
