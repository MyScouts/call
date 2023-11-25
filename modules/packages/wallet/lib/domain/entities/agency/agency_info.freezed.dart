// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgencyInfo _$AgencyInfoFromJson(Map<String, dynamic> json) {
  return _AgencyInfo.fromJson(json);
}

/// @nodoc
mixin _$AgencyInfo {
  Agency? get agency => throw _privateConstructorUsedError;
  List<AgencyPrice>? get listPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgencyInfoCopyWith<AgencyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyInfoCopyWith<$Res> {
  factory $AgencyInfoCopyWith(
          AgencyInfo value, $Res Function(AgencyInfo) then) =
      _$AgencyInfoCopyWithImpl<$Res, AgencyInfo>;
  @useResult
  $Res call({Agency? agency, List<AgencyPrice>? listPrice});

  $AgencyCopyWith<$Res>? get agency;
}

/// @nodoc
class _$AgencyInfoCopyWithImpl<$Res, $Val extends AgencyInfo>
    implements $AgencyInfoCopyWith<$Res> {
  _$AgencyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agency = freezed,
    Object? listPrice = freezed,
  }) {
    return _then(_value.copyWith(
      agency: freezed == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as Agency?,
      listPrice: freezed == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as List<AgencyPrice>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AgencyCopyWith<$Res>? get agency {
    if (_value.agency == null) {
      return null;
    }

    return $AgencyCopyWith<$Res>(_value.agency!, (value) {
      return _then(_value.copyWith(agency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgencyInfoImplCopyWith<$Res>
    implements $AgencyInfoCopyWith<$Res> {
  factory _$$AgencyInfoImplCopyWith(
          _$AgencyInfoImpl value, $Res Function(_$AgencyInfoImpl) then) =
      __$$AgencyInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Agency? agency, List<AgencyPrice>? listPrice});

  @override
  $AgencyCopyWith<$Res>? get agency;
}

/// @nodoc
class __$$AgencyInfoImplCopyWithImpl<$Res>
    extends _$AgencyInfoCopyWithImpl<$Res, _$AgencyInfoImpl>
    implements _$$AgencyInfoImplCopyWith<$Res> {
  __$$AgencyInfoImplCopyWithImpl(
      _$AgencyInfoImpl _value, $Res Function(_$AgencyInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agency = freezed,
    Object? listPrice = freezed,
  }) {
    return _then(_$AgencyInfoImpl(
      agency: freezed == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as Agency?,
      listPrice: freezed == listPrice
          ? _value._listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as List<AgencyPrice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgencyInfoImpl implements _AgencyInfo {
  const _$AgencyInfoImpl({this.agency, final List<AgencyPrice>? listPrice})
      : _listPrice = listPrice;

  factory _$AgencyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgencyInfoImplFromJson(json);

  @override
  final Agency? agency;
  final List<AgencyPrice>? _listPrice;
  @override
  List<AgencyPrice>? get listPrice {
    final value = _listPrice;
    if (value == null) return null;
    if (_listPrice is EqualUnmodifiableListView) return _listPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AgencyInfo(agency: $agency, listPrice: $listPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgencyInfoImpl &&
            (identical(other.agency, agency) || other.agency == agency) &&
            const DeepCollectionEquality()
                .equals(other._listPrice, _listPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, agency, const DeepCollectionEquality().hash(_listPrice));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgencyInfoImplCopyWith<_$AgencyInfoImpl> get copyWith =>
      __$$AgencyInfoImplCopyWithImpl<_$AgencyInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgencyInfoImplToJson(
      this,
    );
  }
}

abstract class _AgencyInfo implements AgencyInfo {
  const factory _AgencyInfo(
      {final Agency? agency,
      final List<AgencyPrice>? listPrice}) = _$AgencyInfoImpl;

  factory _AgencyInfo.fromJson(Map<String, dynamic> json) =
      _$AgencyInfoImpl.fromJson;

  @override
  Agency? get agency;
  @override
  List<AgencyPrice>? get listPrice;
  @override
  @JsonKey(ignore: true)
  _$$AgencyInfoImplCopyWith<_$AgencyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgencyPrice _$AgencyPriceFromJson(Map<String, dynamic> json) {
  return _AgencyPrice.fromJson(json);
}

/// @nodoc
mixin _$AgencyPrice {
  int? get id => throw _privateConstructorUsedError;
  int? get vndFrom => throw _privateConstructorUsedError;
  String? get pointPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgencyPriceCopyWith<AgencyPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyPriceCopyWith<$Res> {
  factory $AgencyPriceCopyWith(
          AgencyPrice value, $Res Function(AgencyPrice) then) =
      _$AgencyPriceCopyWithImpl<$Res, AgencyPrice>;
  @useResult
  $Res call({int? id, int? vndFrom, String? pointPrice});
}

/// @nodoc
class _$AgencyPriceCopyWithImpl<$Res, $Val extends AgencyPrice>
    implements $AgencyPriceCopyWith<$Res> {
  _$AgencyPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vndFrom = freezed,
    Object? pointPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vndFrom: freezed == vndFrom
          ? _value.vndFrom
          : vndFrom // ignore: cast_nullable_to_non_nullable
              as int?,
      pointPrice: freezed == pointPrice
          ? _value.pointPrice
          : pointPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgencyPriceImplCopyWith<$Res>
    implements $AgencyPriceCopyWith<$Res> {
  factory _$$AgencyPriceImplCopyWith(
          _$AgencyPriceImpl value, $Res Function(_$AgencyPriceImpl) then) =
      __$$AgencyPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? vndFrom, String? pointPrice});
}

/// @nodoc
class __$$AgencyPriceImplCopyWithImpl<$Res>
    extends _$AgencyPriceCopyWithImpl<$Res, _$AgencyPriceImpl>
    implements _$$AgencyPriceImplCopyWith<$Res> {
  __$$AgencyPriceImplCopyWithImpl(
      _$AgencyPriceImpl _value, $Res Function(_$AgencyPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vndFrom = freezed,
    Object? pointPrice = freezed,
  }) {
    return _then(_$AgencyPriceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vndFrom: freezed == vndFrom
          ? _value.vndFrom
          : vndFrom // ignore: cast_nullable_to_non_nullable
              as int?,
      pointPrice: freezed == pointPrice
          ? _value.pointPrice
          : pointPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgencyPriceImpl implements _AgencyPrice {
  const _$AgencyPriceImpl({this.id, this.vndFrom, this.pointPrice});

  factory _$AgencyPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgencyPriceImplFromJson(json);

  @override
  final int? id;
  @override
  final int? vndFrom;
  @override
  final String? pointPrice;

  @override
  String toString() {
    return 'AgencyPrice(id: $id, vndFrom: $vndFrom, pointPrice: $pointPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgencyPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vndFrom, vndFrom) || other.vndFrom == vndFrom) &&
            (identical(other.pointPrice, pointPrice) ||
                other.pointPrice == pointPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, vndFrom, pointPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgencyPriceImplCopyWith<_$AgencyPriceImpl> get copyWith =>
      __$$AgencyPriceImplCopyWithImpl<_$AgencyPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgencyPriceImplToJson(
      this,
    );
  }
}

abstract class _AgencyPrice implements AgencyPrice {
  const factory _AgencyPrice(
      {final int? id,
      final int? vndFrom,
      final String? pointPrice}) = _$AgencyPriceImpl;

  factory _AgencyPrice.fromJson(Map<String, dynamic> json) =
      _$AgencyPriceImpl.fromJson;

  @override
  int? get id;
  @override
  int? get vndFrom;
  @override
  String? get pointPrice;
  @override
  @JsonKey(ignore: true)
  _$$AgencyPriceImplCopyWith<_$AgencyPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
