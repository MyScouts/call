// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_gift_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendGiftPayload _$SendGiftPayloadFromJson(Map<String, dynamic> json) {
  return _SendGiftPayload.fromJson(json);
}

/// @nodoc
mixin _$SendGiftPayload {
  int? get userId => throw _privateConstructorUsedError;
  int? get liveId => throw _privateConstructorUsedError;
  int? get giftId => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendGiftPayloadCopyWith<SendGiftPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendGiftPayloadCopyWith<$Res> {
  factory $SendGiftPayloadCopyWith(
          SendGiftPayload value, $Res Function(SendGiftPayload) then) =
      _$SendGiftPayloadCopyWithImpl<$Res, SendGiftPayload>;
  @useResult
  $Res call({int? userId, int? liveId, int? giftId, int? total});
}

/// @nodoc
class _$SendGiftPayloadCopyWithImpl<$Res, $Val extends SendGiftPayload>
    implements $SendGiftPayloadCopyWith<$Res> {
  _$SendGiftPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? liveId = freezed,
    Object? giftId = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
      giftId: freezed == giftId
          ? _value.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendGiftPayloadImplCopyWith<$Res>
    implements $SendGiftPayloadCopyWith<$Res> {
  factory _$$SendGiftPayloadImplCopyWith(_$SendGiftPayloadImpl value,
          $Res Function(_$SendGiftPayloadImpl) then) =
      __$$SendGiftPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? userId, int? liveId, int? giftId, int? total});
}

/// @nodoc
class __$$SendGiftPayloadImplCopyWithImpl<$Res>
    extends _$SendGiftPayloadCopyWithImpl<$Res, _$SendGiftPayloadImpl>
    implements _$$SendGiftPayloadImplCopyWith<$Res> {
  __$$SendGiftPayloadImplCopyWithImpl(
      _$SendGiftPayloadImpl _value, $Res Function(_$SendGiftPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? liveId = freezed,
    Object? giftId = freezed,
    Object? total = freezed,
  }) {
    return _then(_$SendGiftPayloadImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
      giftId: freezed == giftId
          ? _value.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendGiftPayloadImpl implements _SendGiftPayload {
  const _$SendGiftPayloadImpl(
      {this.userId, this.liveId, this.giftId, this.total});

  factory _$SendGiftPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendGiftPayloadImplFromJson(json);

  @override
  final int? userId;
  @override
  final int? liveId;
  @override
  final int? giftId;
  @override
  final int? total;

  @override
  String toString() {
    return 'SendGiftPayload(userId: $userId, liveId: $liveId, giftId: $giftId, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendGiftPayloadImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.giftId, giftId) || other.giftId == giftId) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, liveId, giftId, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendGiftPayloadImplCopyWith<_$SendGiftPayloadImpl> get copyWith =>
      __$$SendGiftPayloadImplCopyWithImpl<_$SendGiftPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendGiftPayloadImplToJson(
      this,
    );
  }
}

abstract class _SendGiftPayload implements SendGiftPayload {
  const factory _SendGiftPayload(
      {final int? userId,
      final int? liveId,
      final int? giftId,
      final int? total}) = _$SendGiftPayloadImpl;

  factory _SendGiftPayload.fromJson(Map<String, dynamic> json) =
      _$SendGiftPayloadImpl.fromJson;

  @override
  int? get userId;
  @override
  int? get liveId;
  @override
  int? get giftId;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$SendGiftPayloadImplCopyWith<_$SendGiftPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
