// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_place_information_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatePlaceInformationPayload _$UpdatePlaceInformationPayloadFromJson(
    Map<String, dynamic> json) {
  return _UpdatePlaceInformationPayload.fromJson(json);
}

/// @nodoc
mixin _$UpdatePlaceInformationPayload {
  String? get country => throw _privateConstructorUsedError;
  int? get province => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  int? get ward => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePlaceInformationPayloadCopyWith<UpdatePlaceInformationPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePlaceInformationPayloadCopyWith<$Res> {
  factory $UpdatePlaceInformationPayloadCopyWith(
          UpdatePlaceInformationPayload value,
          $Res Function(UpdatePlaceInformationPayload) then) =
      _$UpdatePlaceInformationPayloadCopyWithImpl<$Res,
          UpdatePlaceInformationPayload>;
  @useResult
  $Res call(
      {String? country,
      int? province,
      String? district,
      int? ward,
      String? address});
}

/// @nodoc
class _$UpdatePlaceInformationPayloadCopyWithImpl<$Res,
        $Val extends UpdatePlaceInformationPayload>
    implements $UpdatePlaceInformationPayloadCopyWith<$Res> {
  _$UpdatePlaceInformationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePlaceInformationPayloadImplCopyWith<$Res>
    implements $UpdatePlaceInformationPayloadCopyWith<$Res> {
  factory _$$UpdatePlaceInformationPayloadImplCopyWith(
          _$UpdatePlaceInformationPayloadImpl value,
          $Res Function(_$UpdatePlaceInformationPayloadImpl) then) =
      __$$UpdatePlaceInformationPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? country,
      int? province,
      String? district,
      int? ward,
      String? address});
}

/// @nodoc
class __$$UpdatePlaceInformationPayloadImplCopyWithImpl<$Res>
    extends _$UpdatePlaceInformationPayloadCopyWithImpl<$Res,
        _$UpdatePlaceInformationPayloadImpl>
    implements _$$UpdatePlaceInformationPayloadImplCopyWith<$Res> {
  __$$UpdatePlaceInformationPayloadImplCopyWithImpl(
      _$UpdatePlaceInformationPayloadImpl _value,
      $Res Function(_$UpdatePlaceInformationPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? address = freezed,
  }) {
    return _then(_$UpdatePlaceInformationPayloadImpl(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePlaceInformationPayloadImpl
    implements _UpdatePlaceInformationPayload {
  const _$UpdatePlaceInformationPayloadImpl(
      {this.country, this.province, this.district, this.ward, this.address});

  factory _$UpdatePlaceInformationPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePlaceInformationPayloadImplFromJson(json);

  @override
  final String? country;
  @override
  final int? province;
  @override
  final String? district;
  @override
  final int? ward;
  @override
  final String? address;

  @override
  String toString() {
    return 'UpdatePlaceInformationPayload(country: $country, province: $province, district: $district, ward: $ward, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePlaceInformationPayloadImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, country, province, district, ward, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePlaceInformationPayloadImplCopyWith<
          _$UpdatePlaceInformationPayloadImpl>
      get copyWith => __$$UpdatePlaceInformationPayloadImplCopyWithImpl<
          _$UpdatePlaceInformationPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePlaceInformationPayloadImplToJson(
      this,
    );
  }
}

abstract class _UpdatePlaceInformationPayload
    implements UpdatePlaceInformationPayload {
  const factory _UpdatePlaceInformationPayload(
      {final String? country,
      final int? province,
      final String? district,
      final int? ward,
      final String? address}) = _$UpdatePlaceInformationPayloadImpl;

  factory _UpdatePlaceInformationPayload.fromJson(Map<String, dynamic> json) =
      _$UpdatePlaceInformationPayloadImpl.fromJson;

  @override
  String? get country;
  @override
  int? get province;
  @override
  String? get district;
  @override
  int? get ward;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePlaceInformationPayloadImplCopyWith<
          _$UpdatePlaceInformationPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
