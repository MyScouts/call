// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diamond_wallet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiamondWalletInfo _$DiamondWalletInfoFromJson(Map<String, dynamic> json) {
  return _DiamondWalletInfo.fromJson(json);
}

/// @nodoc
mixin _$DiamondWalletInfo {
  int? get id => throw _privateConstructorUsedError;
  int? get totalCoin => throw _privateConstructorUsedError;
  int? get totalDiamond => throw _privateConstructorUsedError;
  int? get totalVnd => throw _privateConstructorUsedError;
  int? get waiting => throw _privateConstructorUsedError;
  int? get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiamondWalletInfoCopyWith<DiamondWalletInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiamondWalletInfoCopyWith<$Res> {
  factory $DiamondWalletInfoCopyWith(
          DiamondWalletInfo value, $Res Function(DiamondWalletInfo) then) =
      _$DiamondWalletInfoCopyWithImpl<$Res, DiamondWalletInfo>;
  @useResult
  $Res call(
      {int? id,
      int? totalCoin,
      int? totalDiamond,
      int? totalVnd,
      int? waiting,
      int? available});
}

/// @nodoc
class _$DiamondWalletInfoCopyWithImpl<$Res, $Val extends DiamondWalletInfo>
    implements $DiamondWalletInfoCopyWith<$Res> {
  _$DiamondWalletInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalCoin = freezed,
    Object? totalDiamond = freezed,
    Object? totalVnd = freezed,
    Object? waiting = freezed,
    Object? available = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCoin: freezed == totalCoin
          ? _value.totalCoin
          : totalCoin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDiamond: freezed == totalDiamond
          ? _value.totalDiamond
          : totalDiamond // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVnd: freezed == totalVnd
          ? _value.totalVnd
          : totalVnd // ignore: cast_nullable_to_non_nullable
              as int?,
      waiting: freezed == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as int?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiamondWalletInfoImplCopyWith<$Res>
    implements $DiamondWalletInfoCopyWith<$Res> {
  factory _$$DiamondWalletInfoImplCopyWith(_$DiamondWalletInfoImpl value,
          $Res Function(_$DiamondWalletInfoImpl) then) =
      __$$DiamondWalletInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? totalCoin,
      int? totalDiamond,
      int? totalVnd,
      int? waiting,
      int? available});
}

/// @nodoc
class __$$DiamondWalletInfoImplCopyWithImpl<$Res>
    extends _$DiamondWalletInfoCopyWithImpl<$Res, _$DiamondWalletInfoImpl>
    implements _$$DiamondWalletInfoImplCopyWith<$Res> {
  __$$DiamondWalletInfoImplCopyWithImpl(_$DiamondWalletInfoImpl _value,
      $Res Function(_$DiamondWalletInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalCoin = freezed,
    Object? totalDiamond = freezed,
    Object? totalVnd = freezed,
    Object? waiting = freezed,
    Object? available = freezed,
  }) {
    return _then(_$DiamondWalletInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCoin: freezed == totalCoin
          ? _value.totalCoin
          : totalCoin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDiamond: freezed == totalDiamond
          ? _value.totalDiamond
          : totalDiamond // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVnd: freezed == totalVnd
          ? _value.totalVnd
          : totalVnd // ignore: cast_nullable_to_non_nullable
              as int?,
      waiting: freezed == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as int?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiamondWalletInfoImpl implements _DiamondWalletInfo {
  const _$DiamondWalletInfoImpl(
      {this.id,
      this.totalCoin,
      this.totalDiamond,
      this.totalVnd,
      this.waiting,
      this.available});

  factory _$DiamondWalletInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiamondWalletInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final int? totalCoin;
  @override
  final int? totalDiamond;
  @override
  final int? totalVnd;
  @override
  final int? waiting;
  @override
  final int? available;

  @override
  String toString() {
    return 'DiamondWalletInfo(id: $id, totalCoin: $totalCoin, totalDiamond: $totalDiamond, totalVnd: $totalVnd, waiting: $waiting, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiamondWalletInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalCoin, totalCoin) ||
                other.totalCoin == totalCoin) &&
            (identical(other.totalDiamond, totalDiamond) ||
                other.totalDiamond == totalDiamond) &&
            (identical(other.totalVnd, totalVnd) ||
                other.totalVnd == totalVnd) &&
            (identical(other.waiting, waiting) || other.waiting == waiting) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, totalCoin, totalDiamond, totalVnd, waiting, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiamondWalletInfoImplCopyWith<_$DiamondWalletInfoImpl> get copyWith =>
      __$$DiamondWalletInfoImplCopyWithImpl<_$DiamondWalletInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiamondWalletInfoImplToJson(
      this,
    );
  }
}

abstract class _DiamondWalletInfo implements DiamondWalletInfo {
  const factory _DiamondWalletInfo(
      {final int? id,
      final int? totalCoin,
      final int? totalDiamond,
      final int? totalVnd,
      final int? waiting,
      final int? available}) = _$DiamondWalletInfoImpl;

  factory _DiamondWalletInfo.fromJson(Map<String, dynamic> json) =
      _$DiamondWalletInfoImpl.fromJson;

  @override
  int? get id;
  @override
  int? get totalCoin;
  @override
  int? get totalDiamond;
  @override
  int? get totalVnd;
  @override
  int? get waiting;
  @override
  int? get available;
  @override
  @JsonKey(ignore: true)
  _$$DiamondWalletInfoImplCopyWith<_$DiamondWalletInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
