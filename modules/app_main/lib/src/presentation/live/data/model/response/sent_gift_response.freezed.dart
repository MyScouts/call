// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_gift_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SentGiftResponse _$SentGiftResponseFromJson(Map<String, dynamic> json) {
  return _SentGiftResponse.fromJson(json);
}

/// @nodoc
mixin _$SentGiftResponse {
  GiftCard? get giftCard => throw _privateConstructorUsedError;
  User? get giver => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentGiftResponseCopyWith<SentGiftResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentGiftResponseCopyWith<$Res> {
  factory $SentGiftResponseCopyWith(
          SentGiftResponse value, $Res Function(SentGiftResponse) then) =
      _$SentGiftResponseCopyWithImpl<$Res, SentGiftResponse>;
  @useResult
  $Res call({GiftCard? giftCard, User? giver, int? total});

  $GiftCardCopyWith<$Res>? get giftCard;
  $UserCopyWith<$Res>? get giver;
}

/// @nodoc
class _$SentGiftResponseCopyWithImpl<$Res, $Val extends SentGiftResponse>
    implements $SentGiftResponseCopyWith<$Res> {
  _$SentGiftResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCard = freezed,
    Object? giver = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      giftCard: freezed == giftCard
          ? _value.giftCard
          : giftCard // ignore: cast_nullable_to_non_nullable
              as GiftCard?,
      giver: freezed == giver
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as User?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GiftCardCopyWith<$Res>? get giftCard {
    if (_value.giftCard == null) {
      return null;
    }

    return $GiftCardCopyWith<$Res>(_value.giftCard!, (value) {
      return _then(_value.copyWith(giftCard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get giver {
    if (_value.giver == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.giver!, (value) {
      return _then(_value.copyWith(giver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SentGiftResponseImplCopyWith<$Res>
    implements $SentGiftResponseCopyWith<$Res> {
  factory _$$SentGiftResponseImplCopyWith(_$SentGiftResponseImpl value,
          $Res Function(_$SentGiftResponseImpl) then) =
      __$$SentGiftResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GiftCard? giftCard, User? giver, int? total});

  @override
  $GiftCardCopyWith<$Res>? get giftCard;
  @override
  $UserCopyWith<$Res>? get giver;
}

/// @nodoc
class __$$SentGiftResponseImplCopyWithImpl<$Res>
    extends _$SentGiftResponseCopyWithImpl<$Res, _$SentGiftResponseImpl>
    implements _$$SentGiftResponseImplCopyWith<$Res> {
  __$$SentGiftResponseImplCopyWithImpl(_$SentGiftResponseImpl _value,
      $Res Function(_$SentGiftResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCard = freezed,
    Object? giver = freezed,
    Object? total = freezed,
  }) {
    return _then(_$SentGiftResponseImpl(
      giftCard: freezed == giftCard
          ? _value.giftCard
          : giftCard // ignore: cast_nullable_to_non_nullable
              as GiftCard?,
      giver: freezed == giver
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as User?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SentGiftResponseImpl implements _SentGiftResponse {
  const _$SentGiftResponseImpl({this.giftCard, this.giver, this.total});

  factory _$SentGiftResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SentGiftResponseImplFromJson(json);

  @override
  final GiftCard? giftCard;
  @override
  final User? giver;
  @override
  final int? total;

  @override
  String toString() {
    return 'SentGiftResponse(giftCard: $giftCard, giver: $giver, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentGiftResponseImpl &&
            (identical(other.giftCard, giftCard) ||
                other.giftCard == giftCard) &&
            (identical(other.giver, giver) || other.giver == giver) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, giftCard, giver, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SentGiftResponseImplCopyWith<_$SentGiftResponseImpl> get copyWith =>
      __$$SentGiftResponseImplCopyWithImpl<_$SentGiftResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SentGiftResponseImplToJson(
      this,
    );
  }
}

abstract class _SentGiftResponse implements SentGiftResponse {
  const factory _SentGiftResponse(
      {final GiftCard? giftCard,
      final User? giver,
      final int? total}) = _$SentGiftResponseImpl;

  factory _SentGiftResponse.fromJson(Map<String, dynamic> json) =
      _$SentGiftResponseImpl.fromJson;

  @override
  GiftCard? get giftCard;
  @override
  User? get giver;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$SentGiftResponseImplCopyWith<_$SentGiftResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
