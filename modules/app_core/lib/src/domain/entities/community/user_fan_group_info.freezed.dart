// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_fan_group_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFanGroupInfo _$UserFanGroupInfoFromJson(Map<String, dynamic> json) {
  return _UserFanGroupInfo.fromJson(json);
}

/// @nodoc
mixin _$UserFanGroupInfo {
  int? get status => throw _privateConstructorUsedError;
  int? get fanGroupId => throw _privateConstructorUsedError;
  List<int>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFanGroupInfoCopyWith<UserFanGroupInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFanGroupInfoCopyWith<$Res> {
  factory $UserFanGroupInfoCopyWith(
          UserFanGroupInfo value, $Res Function(UserFanGroupInfo) then) =
      _$UserFanGroupInfoCopyWithImpl<$Res>;
  $Res call({int? status, int? fanGroupId, List<int>? types});
}

/// @nodoc
class _$UserFanGroupInfoCopyWithImpl<$Res>
    implements $UserFanGroupInfoCopyWith<$Res> {
  _$UserFanGroupInfoCopyWithImpl(this._value, this._then);

  final UserFanGroupInfo _value;
  // ignore: unused_field
  final $Res Function(UserFanGroupInfo) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? fanGroupId = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroupId: fanGroupId == freezed
          ? _value.fanGroupId
          : fanGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserFanGroupInfoCopyWith<$Res>
    implements $UserFanGroupInfoCopyWith<$Res> {
  factory _$$_UserFanGroupInfoCopyWith(
          _$_UserFanGroupInfo value, $Res Function(_$_UserFanGroupInfo) then) =
      __$$_UserFanGroupInfoCopyWithImpl<$Res>;
  @override
  $Res call({int? status, int? fanGroupId, List<int>? types});
}

/// @nodoc
class __$$_UserFanGroupInfoCopyWithImpl<$Res>
    extends _$UserFanGroupInfoCopyWithImpl<$Res>
    implements _$$_UserFanGroupInfoCopyWith<$Res> {
  __$$_UserFanGroupInfoCopyWithImpl(
      _$_UserFanGroupInfo _value, $Res Function(_$_UserFanGroupInfo) _then)
      : super(_value, (v) => _then(v as _$_UserFanGroupInfo));

  @override
  _$_UserFanGroupInfo get _value => super._value as _$_UserFanGroupInfo;

  @override
  $Res call({
    Object? status = freezed,
    Object? fanGroupId = freezed,
    Object? types = freezed,
  }) {
    return _then(_$_UserFanGroupInfo(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroupId: fanGroupId == freezed
          ? _value.fanGroupId
          : fanGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      types: types == freezed
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFanGroupInfo implements _UserFanGroupInfo {
  const _$_UserFanGroupInfo(
      {this.status, this.fanGroupId, final List<int>? types})
      : _types = types;

  factory _$_UserFanGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserFanGroupInfoFromJson(json);

  @override
  final int? status;
  @override
  final int? fanGroupId;
  final List<int>? _types;
  @override
  List<int>? get types {
    final value = _types;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserFanGroupInfo(status: $status, fanGroupId: $fanGroupId, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFanGroupInfo &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.fanGroupId, fanGroupId) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(fanGroupId),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  _$$_UserFanGroupInfoCopyWith<_$_UserFanGroupInfo> get copyWith =>
      __$$_UserFanGroupInfoCopyWithImpl<_$_UserFanGroupInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFanGroupInfoToJson(
      this,
    );
  }
}

abstract class _UserFanGroupInfo implements UserFanGroupInfo {
  const factory _UserFanGroupInfo(
      {final int? status,
      final int? fanGroupId,
      final List<int>? types}) = _$_UserFanGroupInfo;

  factory _UserFanGroupInfo.fromJson(Map<String, dynamic> json) =
      _$_UserFanGroupInfo.fromJson;

  @override
  int? get status;
  @override
  int? get fanGroupId;
  @override
  List<int>? get types;
  @override
  @JsonKey(ignore: true)
  _$$_UserFanGroupInfoCopyWith<_$_UserFanGroupInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
