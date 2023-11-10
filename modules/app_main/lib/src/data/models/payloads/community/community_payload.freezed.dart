// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplyJoinRequestPayload _$ReplyJoinRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return _ReplyJoinRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$ReplyJoinRequestPayload {
  int get userId => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyJoinRequestPayloadCopyWith<ReplyJoinRequestPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyJoinRequestPayloadCopyWith<$Res> {
  factory $ReplyJoinRequestPayloadCopyWith(ReplyJoinRequestPayload value,
          $Res Function(ReplyJoinRequestPayload) then) =
      _$ReplyJoinRequestPayloadCopyWithImpl<$Res, ReplyJoinRequestPayload>;
  @useResult
  $Res call({int userId, bool isApproved});
}

/// @nodoc
class _$ReplyJoinRequestPayloadCopyWithImpl<$Res,
        $Val extends ReplyJoinRequestPayload>
    implements $ReplyJoinRequestPayloadCopyWith<$Res> {
  _$ReplyJoinRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isApproved = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplyJoinRequestPayloadImplCopyWith<$Res>
    implements $ReplyJoinRequestPayloadCopyWith<$Res> {
  factory _$$ReplyJoinRequestPayloadImplCopyWith(
          _$ReplyJoinRequestPayloadImpl value,
          $Res Function(_$ReplyJoinRequestPayloadImpl) then) =
      __$$ReplyJoinRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, bool isApproved});
}

/// @nodoc
class __$$ReplyJoinRequestPayloadImplCopyWithImpl<$Res>
    extends _$ReplyJoinRequestPayloadCopyWithImpl<$Res,
        _$ReplyJoinRequestPayloadImpl>
    implements _$$ReplyJoinRequestPayloadImplCopyWith<$Res> {
  __$$ReplyJoinRequestPayloadImplCopyWithImpl(
      _$ReplyJoinRequestPayloadImpl _value,
      $Res Function(_$ReplyJoinRequestPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isApproved = null,
  }) {
    return _then(_$ReplyJoinRequestPayloadImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyJoinRequestPayloadImpl implements _ReplyJoinRequestPayload {
  const _$ReplyJoinRequestPayloadImpl(
      {required this.userId, required this.isApproved});

  factory _$ReplyJoinRequestPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyJoinRequestPayloadImplFromJson(json);

  @override
  final int userId;
  @override
  final bool isApproved;

  @override
  String toString() {
    return 'ReplyJoinRequestPayload(userId: $userId, isApproved: $isApproved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyJoinRequestPayloadImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, isApproved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyJoinRequestPayloadImplCopyWith<_$ReplyJoinRequestPayloadImpl>
      get copyWith => __$$ReplyJoinRequestPayloadImplCopyWithImpl<
          _$ReplyJoinRequestPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyJoinRequestPayloadImplToJson(
      this,
    );
  }
}

abstract class _ReplyJoinRequestPayload implements ReplyJoinRequestPayload {
  const factory _ReplyJoinRequestPayload(
      {required final int userId,
      required final bool isApproved}) = _$ReplyJoinRequestPayloadImpl;

  factory _ReplyJoinRequestPayload.fromJson(Map<String, dynamic> json) =
      _$ReplyJoinRequestPayloadImpl.fromJson;

  @override
  int get userId;
  @override
  bool get isApproved;
  @override
  @JsonKey(ignore: true)
  _$$ReplyJoinRequestPayloadImplCopyWith<_$ReplyJoinRequestPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
