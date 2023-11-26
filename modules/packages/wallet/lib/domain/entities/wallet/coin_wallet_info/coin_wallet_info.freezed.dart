// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_wallet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinWalletInfo _$CoinWalletInfoFromJson(Map<String, dynamic> json) {
  return _CoinWalletInfo.fromJson(json);
}

/// @nodoc
mixin _$CoinWalletInfo {
  int? get id => throw _privateConstructorUsedError;
  int? get totalCoin => throw _privateConstructorUsedError;
  int? get totalDiamond => throw _privateConstructorUsedError;
  int? get totalVnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinWalletInfoCopyWith<CoinWalletInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinWalletInfoCopyWith<$Res> {
  factory $CoinWalletInfoCopyWith(
          CoinWalletInfo value, $Res Function(CoinWalletInfo) then) =
      _$CoinWalletInfoCopyWithImpl<$Res, CoinWalletInfo>;
  @useResult
  $Res call({int? id, int? totalCoin, int? totalDiamond, int? totalVnd});
}

/// @nodoc
class _$CoinWalletInfoCopyWithImpl<$Res, $Val extends CoinWalletInfo>
    implements $CoinWalletInfoCopyWith<$Res> {
  _$CoinWalletInfoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinWalletInfoImplCopyWith<$Res>
    implements $CoinWalletInfoCopyWith<$Res> {
  factory _$$CoinWalletInfoImplCopyWith(_$CoinWalletInfoImpl value,
          $Res Function(_$CoinWalletInfoImpl) then) =
      __$$CoinWalletInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? totalCoin, int? totalDiamond, int? totalVnd});
}

/// @nodoc
class __$$CoinWalletInfoImplCopyWithImpl<$Res>
    extends _$CoinWalletInfoCopyWithImpl<$Res, _$CoinWalletInfoImpl>
    implements _$$CoinWalletInfoImplCopyWith<$Res> {
  __$$CoinWalletInfoImplCopyWithImpl(
      _$CoinWalletInfoImpl _value, $Res Function(_$CoinWalletInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalCoin = freezed,
    Object? totalDiamond = freezed,
    Object? totalVnd = freezed,
  }) {
    return _then(_$CoinWalletInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinWalletInfoImpl implements _CoinWalletInfo {
  const _$CoinWalletInfoImpl(
      {this.id, this.totalCoin, this.totalDiamond, this.totalVnd});

  factory _$CoinWalletInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinWalletInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final int? totalCoin;
  @override
  final int? totalDiamond;
  @override
  final int? totalVnd;

  @override
  String toString() {
    return 'CoinWalletInfo(id: $id, totalCoin: $totalCoin, totalDiamond: $totalDiamond, totalVnd: $totalVnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinWalletInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalCoin, totalCoin) ||
                other.totalCoin == totalCoin) &&
            (identical(other.totalDiamond, totalDiamond) ||
                other.totalDiamond == totalDiamond) &&
            (identical(other.totalVnd, totalVnd) ||
                other.totalVnd == totalVnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, totalCoin, totalDiamond, totalVnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinWalletInfoImplCopyWith<_$CoinWalletInfoImpl> get copyWith =>
      __$$CoinWalletInfoImplCopyWithImpl<_$CoinWalletInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinWalletInfoImplToJson(
      this,
    );
  }
}

abstract class _CoinWalletInfo implements CoinWalletInfo {
  const factory _CoinWalletInfo(
      {final int? id,
      final int? totalCoin,
      final int? totalDiamond,
      final int? totalVnd}) = _$CoinWalletInfoImpl;

  factory _CoinWalletInfo.fromJson(Map<String, dynamic> json) =
      _$CoinWalletInfoImpl.fromJson;

  @override
  int? get id;
  @override
  int? get totalCoin;
  @override
  int? get totalDiamond;
  @override
  int? get totalVnd;
  @override
  @JsonKey(ignore: true)
  _$$CoinWalletInfoImplCopyWith<_$CoinWalletInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
