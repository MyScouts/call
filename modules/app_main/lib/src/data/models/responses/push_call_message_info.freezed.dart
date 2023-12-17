// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_call_message_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushCallMessageInfo _$PushCallMessageInfoFromJson(Map<String, dynamic> json) {
  return _PushCallMessageInfo.fromJson(json);
}

/// @nodoc
mixin _$PushCallMessageInfo {
  String? get callId => throw _privateConstructorUsedError;
  int? get serial => throw _privateConstructorUsedError;
  String? get callStatus => throw _privateConstructorUsedError;
  CallUserInfo? get from => throw _privateConstructorUsedError;
  CallUserInfo? get to => throw _privateConstructorUsedError;
  int? get projectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushCallMessageInfoCopyWith<PushCallMessageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushCallMessageInfoCopyWith<$Res> {
  factory $PushCallMessageInfoCopyWith(
          PushCallMessageInfo value, $Res Function(PushCallMessageInfo) then) =
      _$PushCallMessageInfoCopyWithImpl<$Res, PushCallMessageInfo>;
  @useResult
  $Res call(
      {String? callId,
      int? serial,
      String? callStatus,
      CallUserInfo? from,
      CallUserInfo? to,
      int? projectId});

  $CallUserInfoCopyWith<$Res>? get from;
  $CallUserInfoCopyWith<$Res>? get to;
}

/// @nodoc
class _$PushCallMessageInfoCopyWithImpl<$Res, $Val extends PushCallMessageInfo>
    implements $PushCallMessageInfoCopyWith<$Res> {
  _$PushCallMessageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = freezed,
    Object? serial = freezed,
    Object? callStatus = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int?,
      callStatus: freezed == callStatus
          ? _value.callStatus
          : callStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CallUserInfoCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $CallUserInfoCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CallUserInfoCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $CallUserInfoCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PushCallMessageInfoImplCopyWith<$Res>
    implements $PushCallMessageInfoCopyWith<$Res> {
  factory _$$PushCallMessageInfoImplCopyWith(_$PushCallMessageInfoImpl value,
          $Res Function(_$PushCallMessageInfoImpl) then) =
      __$$PushCallMessageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? callId,
      int? serial,
      String? callStatus,
      CallUserInfo? from,
      CallUserInfo? to,
      int? projectId});

  @override
  $CallUserInfoCopyWith<$Res>? get from;
  @override
  $CallUserInfoCopyWith<$Res>? get to;
}

/// @nodoc
class __$$PushCallMessageInfoImplCopyWithImpl<$Res>
    extends _$PushCallMessageInfoCopyWithImpl<$Res, _$PushCallMessageInfoImpl>
    implements _$$PushCallMessageInfoImplCopyWith<$Res> {
  __$$PushCallMessageInfoImplCopyWithImpl(_$PushCallMessageInfoImpl _value,
      $Res Function(_$PushCallMessageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = freezed,
    Object? serial = freezed,
    Object? callStatus = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_$PushCallMessageInfoImpl(
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int?,
      callStatus: freezed == callStatus
          ? _value.callStatus
          : callStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushCallMessageInfoImpl implements _PushCallMessageInfo {
  const _$PushCallMessageInfoImpl(
      {this.callId,
      this.serial,
      this.callStatus,
      this.from,
      this.to,
      this.projectId});

  factory _$PushCallMessageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushCallMessageInfoImplFromJson(json);

  @override
  final String? callId;
  @override
  final int? serial;
  @override
  final String? callStatus;
  @override
  final CallUserInfo? from;
  @override
  final CallUserInfo? to;
  @override
  final int? projectId;

  @override
  String toString() {
    return 'PushCallMessageInfo(callId: $callId, serial: $serial, callStatus: $callStatus, from: $from, to: $to, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushCallMessageInfoImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.callStatus, callStatus) ||
                other.callStatus == callStatus) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, callId, serial, callStatus, from, to, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushCallMessageInfoImplCopyWith<_$PushCallMessageInfoImpl> get copyWith =>
      __$$PushCallMessageInfoImplCopyWithImpl<_$PushCallMessageInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushCallMessageInfoImplToJson(
      this,
    );
  }
}

abstract class _PushCallMessageInfo implements PushCallMessageInfo {
  const factory _PushCallMessageInfo(
      {final String? callId,
      final int? serial,
      final String? callStatus,
      final CallUserInfo? from,
      final CallUserInfo? to,
      final int? projectId}) = _$PushCallMessageInfoImpl;

  factory _PushCallMessageInfo.fromJson(Map<String, dynamic> json) =
      _$PushCallMessageInfoImpl.fromJson;

  @override
  String? get callId;
  @override
  int? get serial;
  @override
  String? get callStatus;
  @override
  CallUserInfo? get from;
  @override
  CallUserInfo? get to;
  @override
  int? get projectId;
  @override
  @JsonKey(ignore: true)
  _$$PushCallMessageInfoImplCopyWith<_$PushCallMessageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallUserInfo _$CallUserInfoFromJson(Map<String, dynamic> json) {
  return _CallUserInfo.fromJson(json);
}

/// @nodoc
mixin _$CallUserInfo {
  String? get number => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online')
  bool? get isOnline => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallUserInfoCopyWith<CallUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallUserInfoCopyWith<$Res> {
  factory $CallUserInfoCopyWith(
          CallUserInfo value, $Res Function(CallUserInfo) then) =
      _$CallUserInfoCopyWithImpl<$Res, CallUserInfo>;
  @useResult
  $Res call(
      {String? number,
      String? alias,
      @JsonKey(name: 'is_online') bool? isOnline,
      String? type});
}

/// @nodoc
class _$CallUserInfoCopyWithImpl<$Res, $Val extends CallUserInfo>
    implements $CallUserInfoCopyWith<$Res> {
  _$CallUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? alias = freezed,
    Object? isOnline = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallUserInfoImplCopyWith<$Res>
    implements $CallUserInfoCopyWith<$Res> {
  factory _$$CallUserInfoImplCopyWith(
          _$CallUserInfoImpl value, $Res Function(_$CallUserInfoImpl) then) =
      __$$CallUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? number,
      String? alias,
      @JsonKey(name: 'is_online') bool? isOnline,
      String? type});
}

/// @nodoc
class __$$CallUserInfoImplCopyWithImpl<$Res>
    extends _$CallUserInfoCopyWithImpl<$Res, _$CallUserInfoImpl>
    implements _$$CallUserInfoImplCopyWith<$Res> {
  __$$CallUserInfoImplCopyWithImpl(
      _$CallUserInfoImpl _value, $Res Function(_$CallUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? alias = freezed,
    Object? isOnline = freezed,
    Object? type = freezed,
  }) {
    return _then(_$CallUserInfoImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallUserInfoImpl implements _CallUserInfo {
  const _$CallUserInfoImpl(
      {this.number,
      this.alias,
      @JsonKey(name: 'is_online') this.isOnline,
      this.type});

  factory _$CallUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallUserInfoImplFromJson(json);

  @override
  final String? number;
  @override
  final String? alias;
  @override
  @JsonKey(name: 'is_online')
  final bool? isOnline;
  @override
  final String? type;

  @override
  String toString() {
    return 'CallUserInfo(number: $number, alias: $alias, isOnline: $isOnline, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallUserInfoImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, alias, isOnline, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallUserInfoImplCopyWith<_$CallUserInfoImpl> get copyWith =>
      __$$CallUserInfoImplCopyWithImpl<_$CallUserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallUserInfoImplToJson(
      this,
    );
  }
}

abstract class _CallUserInfo implements CallUserInfo {
  const factory _CallUserInfo(
      {final String? number,
      final String? alias,
      @JsonKey(name: 'is_online') final bool? isOnline,
      final String? type}) = _$CallUserInfoImpl;

  factory _CallUserInfo.fromJson(Map<String, dynamic> json) =
      _$CallUserInfoImpl.fromJson;

  @override
  String? get number;
  @override
  String? get alias;
  @override
  @JsonKey(name: 'is_online')
  bool? get isOnline;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$CallUserInfoImplCopyWith<_$CallUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
