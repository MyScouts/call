// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiftCardLive _$GiftCardLiveFromJson(Map<String, dynamic> json) {
  return _GiftCardLive.fromJson(json);
}

/// @nodoc
mixin _$GiftCardLive {
  LiveDetail? get live => throw _privateConstructorUsedError;
  List<GiversInfo>? get giversInfo => throw _privateConstructorUsedError;
  DateTime? get caculateFrom => throw _privateConstructorUsedError;
  DateTime? get refreshAt => throw _privateConstructorUsedError;
  int? get diamondCount => throw _privateConstructorUsedError;
  int? get giftCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftCardLiveCopyWith<GiftCardLive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardLiveCopyWith<$Res> {
  factory $GiftCardLiveCopyWith(
          GiftCardLive value, $Res Function(GiftCardLive) then) =
      _$GiftCardLiveCopyWithImpl<$Res, GiftCardLive>;
  @useResult
  $Res call(
      {LiveDetail? live,
      List<GiversInfo>? giversInfo,
      DateTime? caculateFrom,
      DateTime? refreshAt,
      int? diamondCount,
      int? giftCount});

  $LiveDetailCopyWith<$Res>? get live;
}

/// @nodoc
class _$GiftCardLiveCopyWithImpl<$Res, $Val extends GiftCardLive>
    implements $GiftCardLiveCopyWith<$Res> {
  _$GiftCardLiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? live = freezed,
    Object? giversInfo = freezed,
    Object? caculateFrom = freezed,
    Object? refreshAt = freezed,
    Object? diamondCount = freezed,
    Object? giftCount = freezed,
  }) {
    return _then(_value.copyWith(
      live: freezed == live
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as LiveDetail?,
      giversInfo: freezed == giversInfo
          ? _value.giversInfo
          : giversInfo // ignore: cast_nullable_to_non_nullable
              as List<GiversInfo>?,
      caculateFrom: freezed == caculateFrom
          ? _value.caculateFrom
          : caculateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refreshAt: freezed == refreshAt
          ? _value.refreshAt
          : refreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diamondCount: freezed == diamondCount
          ? _value.diamondCount
          : diamondCount // ignore: cast_nullable_to_non_nullable
              as int?,
      giftCount: freezed == giftCount
          ? _value.giftCount
          : giftCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveDetailCopyWith<$Res>? get live {
    if (_value.live == null) {
      return null;
    }

    return $LiveDetailCopyWith<$Res>(_value.live!, (value) {
      return _then(_value.copyWith(live: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiftCardLiveImplCopyWith<$Res>
    implements $GiftCardLiveCopyWith<$Res> {
  factory _$$GiftCardLiveImplCopyWith(
          _$GiftCardLiveImpl value, $Res Function(_$GiftCardLiveImpl) then) =
      __$$GiftCardLiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LiveDetail? live,
      List<GiversInfo>? giversInfo,
      DateTime? caculateFrom,
      DateTime? refreshAt,
      int? diamondCount,
      int? giftCount});

  @override
  $LiveDetailCopyWith<$Res>? get live;
}

/// @nodoc
class __$$GiftCardLiveImplCopyWithImpl<$Res>
    extends _$GiftCardLiveCopyWithImpl<$Res, _$GiftCardLiveImpl>
    implements _$$GiftCardLiveImplCopyWith<$Res> {
  __$$GiftCardLiveImplCopyWithImpl(
      _$GiftCardLiveImpl _value, $Res Function(_$GiftCardLiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? live = freezed,
    Object? giversInfo = freezed,
    Object? caculateFrom = freezed,
    Object? refreshAt = freezed,
    Object? diamondCount = freezed,
    Object? giftCount = freezed,
  }) {
    return _then(_$GiftCardLiveImpl(
      live: freezed == live
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as LiveDetail?,
      giversInfo: freezed == giversInfo
          ? _value._giversInfo
          : giversInfo // ignore: cast_nullable_to_non_nullable
              as List<GiversInfo>?,
      caculateFrom: freezed == caculateFrom
          ? _value.caculateFrom
          : caculateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refreshAt: freezed == refreshAt
          ? _value.refreshAt
          : refreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diamondCount: freezed == diamondCount
          ? _value.diamondCount
          : diamondCount // ignore: cast_nullable_to_non_nullable
              as int?,
      giftCount: freezed == giftCount
          ? _value.giftCount
          : giftCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftCardLiveImpl implements _GiftCardLive {
  const _$GiftCardLiveImpl(
      {this.live,
      final List<GiversInfo>? giversInfo,
      this.caculateFrom,
      this.refreshAt,
      this.diamondCount,
      this.giftCount})
      : _giversInfo = giversInfo;

  factory _$GiftCardLiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardLiveImplFromJson(json);

  @override
  final LiveDetail? live;
  final List<GiversInfo>? _giversInfo;
  @override
  List<GiversInfo>? get giversInfo {
    final value = _giversInfo;
    if (value == null) return null;
    if (_giversInfo is EqualUnmodifiableListView) return _giversInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? caculateFrom;
  @override
  final DateTime? refreshAt;
  @override
  final int? diamondCount;
  @override
  final int? giftCount;

  @override
  String toString() {
    return 'GiftCardLive(live: $live, giversInfo: $giversInfo, caculateFrom: $caculateFrom, refreshAt: $refreshAt, diamondCount: $diamondCount, giftCount: $giftCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardLiveImpl &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality()
                .equals(other._giversInfo, _giversInfo) &&
            (identical(other.caculateFrom, caculateFrom) ||
                other.caculateFrom == caculateFrom) &&
            (identical(other.refreshAt, refreshAt) ||
                other.refreshAt == refreshAt) &&
            (identical(other.diamondCount, diamondCount) ||
                other.diamondCount == diamondCount) &&
            (identical(other.giftCount, giftCount) ||
                other.giftCount == giftCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      live,
      const DeepCollectionEquality().hash(_giversInfo),
      caculateFrom,
      refreshAt,
      diamondCount,
      giftCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardLiveImplCopyWith<_$GiftCardLiveImpl> get copyWith =>
      __$$GiftCardLiveImplCopyWithImpl<_$GiftCardLiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardLiveImplToJson(
      this,
    );
  }
}

abstract class _GiftCardLive implements GiftCardLive {
  const factory _GiftCardLive(
      {final LiveDetail? live,
      final List<GiversInfo>? giversInfo,
      final DateTime? caculateFrom,
      final DateTime? refreshAt,
      final int? diamondCount,
      final int? giftCount}) = _$GiftCardLiveImpl;

  factory _GiftCardLive.fromJson(Map<String, dynamic> json) =
      _$GiftCardLiveImpl.fromJson;

  @override
  LiveDetail? get live;
  @override
  List<GiversInfo>? get giversInfo;
  @override
  DateTime? get caculateFrom;
  @override
  DateTime? get refreshAt;
  @override
  int? get diamondCount;
  @override
  int? get giftCount;
  @override
  @JsonKey(ignore: true)
  _$$GiftCardLiveImplCopyWith<_$GiftCardLiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
