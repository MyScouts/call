// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_member_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveMemberCount _$LiveMemberCountFromJson(Map<String, dynamic> json) {
  return _LiveMemberCount.fromJson(json);
}

/// @nodoc
mixin _$LiveMemberCount {
  int get liveId => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveMemberCountCopyWith<LiveMemberCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMemberCountCopyWith<$Res> {
  factory $LiveMemberCountCopyWith(
          LiveMemberCount value, $Res Function(LiveMemberCount) then) =
      _$LiveMemberCountCopyWithImpl<$Res, LiveMemberCount>;
  @useResult
  $Res call({int liveId, int memberCount});
}

/// @nodoc
class _$LiveMemberCountCopyWithImpl<$Res, $Val extends LiveMemberCount>
    implements $LiveMemberCountCopyWith<$Res> {
  _$LiveMemberCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? memberCount = null,
  }) {
    return _then(_value.copyWith(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveMemberCountImplCopyWith<$Res>
    implements $LiveMemberCountCopyWith<$Res> {
  factory _$$LiveMemberCountImplCopyWith(_$LiveMemberCountImpl value,
          $Res Function(_$LiveMemberCountImpl) then) =
      __$$LiveMemberCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int liveId, int memberCount});
}

/// @nodoc
class __$$LiveMemberCountImplCopyWithImpl<$Res>
    extends _$LiveMemberCountCopyWithImpl<$Res, _$LiveMemberCountImpl>
    implements _$$LiveMemberCountImplCopyWith<$Res> {
  __$$LiveMemberCountImplCopyWithImpl(
      _$LiveMemberCountImpl _value, $Res Function(_$LiveMemberCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? memberCount = null,
  }) {
    return _then(_$LiveMemberCountImpl(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveMemberCountImpl implements _LiveMemberCount {
  const _$LiveMemberCountImpl(
      {required this.liveId, required this.memberCount});

  factory _$LiveMemberCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveMemberCountImplFromJson(json);

  @override
  final int liveId;
  @override
  final int memberCount;

  @override
  String toString() {
    return 'LiveMemberCount(liveId: $liveId, memberCount: $memberCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMemberCountImpl &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, liveId, memberCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMemberCountImplCopyWith<_$LiveMemberCountImpl> get copyWith =>
      __$$LiveMemberCountImplCopyWithImpl<_$LiveMemberCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveMemberCountImplToJson(
      this,
    );
  }
}

abstract class _LiveMemberCount implements LiveMemberCount {
  const factory _LiveMemberCount(
      {required final int liveId,
      required final int memberCount}) = _$LiveMemberCountImpl;

  factory _LiveMemberCount.fromJson(Map<String, dynamic> json) =
      _$LiveMemberCountImpl.fromJson;

  @override
  int get liveId;
  @override
  int get memberCount;
  @override
  @JsonKey(ignore: true)
  _$$LiveMemberCountImplCopyWith<_$LiveMemberCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
