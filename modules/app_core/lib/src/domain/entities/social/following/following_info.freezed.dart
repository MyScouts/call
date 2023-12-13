// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingInfo _$FollowingInfoFromJson(Map<String, dynamic> json) {
  return _FollowingInfo.fromJson(json);
}

/// @nodoc
mixin _$FollowingInfo {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingRelationUser>? get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingInfoCopyWith<FollowingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingInfoCopyWith<$Res> {
  factory $FollowingInfoCopyWith(
          FollowingInfo value, $Res Function(FollowingInfo) then) =
      _$FollowingInfoCopyWithImpl<$Res, FollowingInfo>;
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? info});
}

/// @nodoc
class _$FollowingInfoCopyWithImpl<$Res, $Val extends FollowingInfo>
    implements $FollowingInfoCopyWith<$Res> {
  _$FollowingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingInfoImplCopyWith<$Res>
    implements $FollowingInfoCopyWith<$Res> {
  factory _$$FollowingInfoImplCopyWith(
          _$FollowingInfoImpl value, $Res Function(_$FollowingInfoImpl) then) =
      __$$FollowingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? info});
}

/// @nodoc
class __$$FollowingInfoImplCopyWithImpl<$Res>
    extends _$FollowingInfoCopyWithImpl<$Res, _$FollowingInfoImpl>
    implements _$$FollowingInfoImplCopyWith<$Res> {
  __$$FollowingInfoImplCopyWithImpl(
      _$FollowingInfoImpl _value, $Res Function(_$FollowingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? info = freezed,
  }) {
    return _then(_$FollowingInfoImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      info: freezed == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingInfoImpl implements _FollowingInfo {
  const _$FollowingInfoImpl(
      {this.total, final List<FollowingRelationUser>? info})
      : _info = info;

  factory _$FollowingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingInfoImplFromJson(json);

  @override
  final int? total;
  final List<FollowingRelationUser>? _info;
  @override
  List<FollowingRelationUser>? get info {
    final value = _info;
    if (value == null) return null;
    if (_info is EqualUnmodifiableListView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingInfo(total: $total, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingInfoImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_info));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingInfoImplCopyWith<_$FollowingInfoImpl> get copyWith =>
      __$$FollowingInfoImplCopyWithImpl<_$FollowingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingInfoImplToJson(
      this,
    );
  }
}

abstract class _FollowingInfo implements FollowingInfo {
  const factory _FollowingInfo(
      {final int? total,
      final List<FollowingRelationUser>? info}) = _$FollowingInfoImpl;

  factory _FollowingInfo.fromJson(Map<String, dynamic> json) =
      _$FollowingInfoImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingRelationUser>? get info;
  @override
  @JsonKey(ignore: true)
  _$$FollowingInfoImplCopyWith<_$FollowingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
