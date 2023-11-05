// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$UserFanGroupInfoCopyWithImpl<$Res, UserFanGroupInfo>;
  @useResult
  $Res call({int? status, int? fanGroupId, List<int>? types});
}

/// @nodoc
class _$UserFanGroupInfoCopyWithImpl<$Res, $Val extends UserFanGroupInfo>
    implements $UserFanGroupInfoCopyWith<$Res> {
  _$UserFanGroupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? fanGroupId = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroupId: freezed == fanGroupId
          ? _value.fanGroupId
          : fanGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFanGroupInfoImplCopyWith<$Res>
    implements $UserFanGroupInfoCopyWith<$Res> {
  factory _$$UserFanGroupInfoImplCopyWith(_$UserFanGroupInfoImpl value,
          $Res Function(_$UserFanGroupInfoImpl) then) =
      __$$UserFanGroupInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, int? fanGroupId, List<int>? types});
}

/// @nodoc
class __$$UserFanGroupInfoImplCopyWithImpl<$Res>
    extends _$UserFanGroupInfoCopyWithImpl<$Res, _$UserFanGroupInfoImpl>
    implements _$$UserFanGroupInfoImplCopyWith<$Res> {
  __$$UserFanGroupInfoImplCopyWithImpl(_$UserFanGroupInfoImpl _value,
      $Res Function(_$UserFanGroupInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? fanGroupId = freezed,
    Object? types = freezed,
  }) {
    return _then(_$UserFanGroupInfoImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroupId: freezed == fanGroupId
          ? _value.fanGroupId
          : fanGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFanGroupInfoImpl implements _UserFanGroupInfo {
  const _$UserFanGroupInfoImpl(
      {this.status, this.fanGroupId, final List<int>? types})
      : _types = types;

  factory _$UserFanGroupInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFanGroupInfoImplFromJson(json);

  @override
  final int? status;
  @override
  final int? fanGroupId;
  final List<int>? _types;
  @override
  List<int>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
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
            other is _$UserFanGroupInfoImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fanGroupId, fanGroupId) ||
                other.fanGroupId == fanGroupId) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, fanGroupId,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFanGroupInfoImplCopyWith<_$UserFanGroupInfoImpl> get copyWith =>
      __$$UserFanGroupInfoImplCopyWithImpl<_$UserFanGroupInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFanGroupInfoImplToJson(
      this,
    );
  }
}

abstract class _UserFanGroupInfo implements UserFanGroupInfo {
  const factory _UserFanGroupInfo(
      {final int? status,
      final int? fanGroupId,
      final List<int>? types}) = _$UserFanGroupInfoImpl;

  factory _UserFanGroupInfo.fromJson(Map<String, dynamic> json) =
      _$UserFanGroupInfoImpl.fromJson;

  @override
  int? get status;
  @override
  int? get fanGroupId;
  @override
  List<int>? get types;
  @override
  @JsonKey(ignore: true)
  _$$UserFanGroupInfoImplCopyWith<_$UserFanGroupInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
