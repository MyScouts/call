// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallState {
  User? get participant => throw _privateConstructorUsedError;
  int get callId => throw _privateConstructorUsedError;
  bool get isVideo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallStateCopyWith<CallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallStateCopyWith<$Res> {
  factory $CallStateCopyWith(CallState value, $Res Function(CallState) then) =
      _$CallStateCopyWithImpl<$Res, CallState>;
  @useResult
  $Res call({User? participant, int callId, bool isVideo});

  $UserCopyWith<$Res>? get participant;
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
    Object? participant = freezed,
    Object? callId = null,
    Object? isVideo = null,
  }) {
    return _then(_value.copyWith(
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as User?,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
}

/// @nodoc
abstract class _$$CallStateDataImplCopyWith<$Res>
    implements $CallStateCopyWith<$Res> {
  factory _$$CallStateDataImplCopyWith(
          _$CallStateDataImpl value, $Res Function(_$CallStateDataImpl) then) =
      __$$CallStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? participant, int callId, bool isVideo});

  @override
  $UserCopyWith<$Res>? get participant;
}

/// @nodoc
class __$$CallStateDataImplCopyWithImpl<$Res>
    extends _$CallStateCopyWithImpl<$Res, _$CallStateDataImpl>
    implements _$$CallStateDataImplCopyWith<$Res> {
  __$$CallStateDataImplCopyWithImpl(
      _$CallStateDataImpl _value, $Res Function(_$CallStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participant = freezed,
    Object? callId = null,
    Object? isVideo = null,
  }) {
    return _then(_$CallStateDataImpl(
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as User?,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CallStateDataImpl implements CallStateData {
  const _$CallStateDataImpl(
      {this.participant, required this.callId, required this.isVideo});

  @override
  final User? participant;
  @override
  final int callId;
  @override
  final bool isVideo;

  @override
  String toString() {
    return 'CallState(participant: $participant, callId: $callId, isVideo: $isVideo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallStateDataImpl &&
            (identical(other.participant, participant) ||
                other.participant == participant) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.isVideo, isVideo) || other.isVideo == isVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participant, callId, isVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallStateDataImplCopyWith<_$CallStateDataImpl> get copyWith =>
      __$$CallStateDataImplCopyWithImpl<_$CallStateDataImpl>(this, _$identity);
}

abstract class CallStateData implements CallState {
  const factory CallStateData(
      {final User? participant,
      required final int callId,
      required final bool isVideo}) = _$CallStateDataImpl;

  @override
  User? get participant;
  @override
  int get callId;
  @override
  bool get isVideo;
  @override
  @JsonKey(ignore: true)
  _$$CallStateDataImplCopyWith<_$CallStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
