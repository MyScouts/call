// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PushCallMessageInfoCopyWithImpl<$Res>;
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
class _$PushCallMessageInfoCopyWithImpl<$Res>
    implements $PushCallMessageInfoCopyWith<$Res> {
  _$PushCallMessageInfoCopyWithImpl(this._value, this._then);

  final PushCallMessageInfo _value;
  // ignore: unused_field
  final $Res Function(PushCallMessageInfo) _then;

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
      callId: callId == freezed
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int?,
      callStatus: callStatus == freezed
          ? _value.callStatus
          : callStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $CallUserInfoCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $CallUserInfoCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $CallUserInfoCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $CallUserInfoCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc
abstract class _$$_PushCallMessageInfoCopyWith<$Res>
    implements $PushCallMessageInfoCopyWith<$Res> {
  factory _$$_PushCallMessageInfoCopyWith(_$_PushCallMessageInfo value,
          $Res Function(_$_PushCallMessageInfo) then) =
      __$$_PushCallMessageInfoCopyWithImpl<$Res>;
  @override
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
class __$$_PushCallMessageInfoCopyWithImpl<$Res>
    extends _$PushCallMessageInfoCopyWithImpl<$Res>
    implements _$$_PushCallMessageInfoCopyWith<$Res> {
  __$$_PushCallMessageInfoCopyWithImpl(_$_PushCallMessageInfo _value,
      $Res Function(_$_PushCallMessageInfo) _then)
      : super(_value, (v) => _then(v as _$_PushCallMessageInfo));

  @override
  _$_PushCallMessageInfo get _value => super._value as _$_PushCallMessageInfo;

  @override
  $Res call({
    Object? callId = freezed,
    Object? serial = freezed,
    Object? callStatus = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_$_PushCallMessageInfo(
      callId: callId == freezed
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int?,
      callStatus: callStatus == freezed
          ? _value.callStatus
          : callStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CallUserInfo?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushCallMessageInfo implements _PushCallMessageInfo {
  const _$_PushCallMessageInfo(
      {this.callId,
      this.serial,
      this.callStatus,
      this.from,
      this.to,
      this.projectId});

  factory _$_PushCallMessageInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PushCallMessageInfoFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushCallMessageInfo &&
            const DeepCollectionEquality().equals(other.callId, callId) &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality()
                .equals(other.callStatus, callStatus) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.projectId, projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(callId),
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(callStatus),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(projectId));

  @JsonKey(ignore: true)
  @override
  _$$_PushCallMessageInfoCopyWith<_$_PushCallMessageInfo> get copyWith =>
      __$$_PushCallMessageInfoCopyWithImpl<_$_PushCallMessageInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushCallMessageInfoToJson(
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
      final int? projectId}) = _$_PushCallMessageInfo;

  factory _PushCallMessageInfo.fromJson(Map<String, dynamic> json) =
      _$_PushCallMessageInfo.fromJson;

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
  _$$_PushCallMessageInfoCopyWith<_$_PushCallMessageInfo> get copyWith =>
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
      _$CallUserInfoCopyWithImpl<$Res>;
  $Res call(
      {String? number,
      String? alias,
      @JsonKey(name: 'is_online') bool? isOnline,
      String? type});
}

/// @nodoc
class _$CallUserInfoCopyWithImpl<$Res> implements $CallUserInfoCopyWith<$Res> {
  _$CallUserInfoCopyWithImpl(this._value, this._then);

  final CallUserInfo _value;
  // ignore: unused_field
  final $Res Function(CallUserInfo) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? alias = freezed,
    Object? isOnline = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CallUserInfoCopyWith<$Res>
    implements $CallUserInfoCopyWith<$Res> {
  factory _$$_CallUserInfoCopyWith(
          _$_CallUserInfo value, $Res Function(_$_CallUserInfo) then) =
      __$$_CallUserInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? number,
      String? alias,
      @JsonKey(name: 'is_online') bool? isOnline,
      String? type});
}

/// @nodoc
class __$$_CallUserInfoCopyWithImpl<$Res>
    extends _$CallUserInfoCopyWithImpl<$Res>
    implements _$$_CallUserInfoCopyWith<$Res> {
  __$$_CallUserInfoCopyWithImpl(
      _$_CallUserInfo _value, $Res Function(_$_CallUserInfo) _then)
      : super(_value, (v) => _then(v as _$_CallUserInfo));

  @override
  _$_CallUserInfo get _value => super._value as _$_CallUserInfo;

  @override
  $Res call({
    Object? number = freezed,
    Object? alias = freezed,
    Object? isOnline = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_CallUserInfo(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CallUserInfo implements _CallUserInfo {
  const _$_CallUserInfo(
      {this.number,
      this.alias,
      @JsonKey(name: 'is_online') this.isOnline,
      this.type});

  factory _$_CallUserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CallUserInfoFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallUserInfo &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.alias, alias) &&
            const DeepCollectionEquality().equals(other.isOnline, isOnline) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(alias),
      const DeepCollectionEquality().hash(isOnline),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_CallUserInfoCopyWith<_$_CallUserInfo> get copyWith =>
      __$$_CallUserInfoCopyWithImpl<_$_CallUserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CallUserInfoToJson(
      this,
    );
  }
}

abstract class _CallUserInfo implements CallUserInfo {
  const factory _CallUserInfo(
      {final String? number,
      final String? alias,
      @JsonKey(name: 'is_online') final bool? isOnline,
      final String? type}) = _$_CallUserInfo;

  factory _CallUserInfo.fromJson(Map<String, dynamic> json) =
      _$_CallUserInfo.fromJson;

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
  _$$_CallUserInfoCopyWith<_$_CallUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
