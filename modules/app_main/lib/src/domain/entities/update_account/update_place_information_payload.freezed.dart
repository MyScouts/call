// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$UpdatePlaceInformationPayloadCopyWithImpl<$Res>;
  $Res call(
      {String? country,
      int? province,
      String? district,
      int? ward,
      String? address});
}

/// @nodoc
class _$UpdatePlaceInformationPayloadCopyWithImpl<$Res>
    implements $UpdatePlaceInformationPayloadCopyWith<$Res> {
  _$UpdatePlaceInformationPayloadCopyWithImpl(this._value, this._then);

  final UpdatePlaceInformationPayload _value;
  // ignore: unused_field
  final $Res Function(UpdatePlaceInformationPayload) _then;

  @override
  $Res call({
    Object? country = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: ward == freezed
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdatePlaceInformationPayloadCopyWith<$Res>
    implements $UpdatePlaceInformationPayloadCopyWith<$Res> {
  factory _$$_UpdatePlaceInformationPayloadCopyWith(
          _$_UpdatePlaceInformationPayload value,
          $Res Function(_$_UpdatePlaceInformationPayload) then) =
      __$$_UpdatePlaceInformationPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? country,
      int? province,
      String? district,
      int? ward,
      String? address});
}

/// @nodoc
class __$$_UpdatePlaceInformationPayloadCopyWithImpl<$Res>
    extends _$UpdatePlaceInformationPayloadCopyWithImpl<$Res>
    implements _$$_UpdatePlaceInformationPayloadCopyWith<$Res> {
  __$$_UpdatePlaceInformationPayloadCopyWithImpl(
      _$_UpdatePlaceInformationPayload _value,
      $Res Function(_$_UpdatePlaceInformationPayload) _then)
      : super(_value, (v) => _then(v as _$_UpdatePlaceInformationPayload));

  @override
  _$_UpdatePlaceInformationPayload get _value =>
      super._value as _$_UpdatePlaceInformationPayload;

  @override
  $Res call({
    Object? country = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_UpdatePlaceInformationPayload(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: ward == freezed
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatePlaceInformationPayload
    implements _UpdatePlaceInformationPayload {
  const _$_UpdatePlaceInformationPayload(
      {this.country, this.province, this.district, this.ward, this.address});

  factory _$_UpdatePlaceInformationPayload.fromJson(
          Map<String, dynamic> json) =>
      _$$_UpdatePlaceInformationPayloadFromJson(json);

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
            other is _$_UpdatePlaceInformationPayload &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.province, province) &&
            const DeepCollectionEquality().equals(other.district, district) &&
            const DeepCollectionEquality().equals(other.ward, ward) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(province),
      const DeepCollectionEquality().hash(district),
      const DeepCollectionEquality().hash(ward),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatePlaceInformationPayloadCopyWith<_$_UpdatePlaceInformationPayload>
      get copyWith => __$$_UpdatePlaceInformationPayloadCopyWithImpl<
          _$_UpdatePlaceInformationPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatePlaceInformationPayloadToJson(
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
      final String? address}) = _$_UpdatePlaceInformationPayload;

  factory _UpdatePlaceInformationPayload.fromJson(Map<String, dynamic> json) =
      _$_UpdatePlaceInformationPayload.fromJson;

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
  _$$_UpdatePlaceInformationPayloadCopyWith<_$_UpdatePlaceInformationPayload>
      get copyWith => throw _privateConstructorUsedError;
}
