// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceInformation _$PlaceInformationFromJson(Map<String, dynamic> json) {
  return _PlaceInformation.fromJson(json);
}

/// @nodoc
mixin _$PlaceInformation {
  Country? get country => throw _privateConstructorUsedError;
  Province? get province => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Ward? get ward => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceInformationCopyWith<PlaceInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceInformationCopyWith<$Res> {
  factory $PlaceInformationCopyWith(
          PlaceInformation value, $Res Function(PlaceInformation) then) =
      _$PlaceInformationCopyWithImpl<$Res>;
  $Res call(
      {Country? country,
      Province? province,
      District? district,
      Ward? ward,
      String? address});

  $CountryCopyWith<$Res>? get country;
  $ProvinceCopyWith<$Res>? get province;
  $DistrictCopyWith<$Res>? get district;
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class _$PlaceInformationCopyWithImpl<$Res>
    implements $PlaceInformationCopyWith<$Res> {
  _$PlaceInformationCopyWithImpl(this._value, this._then);

  final PlaceInformation _value;
  // ignore: unused_field
  final $Res Function(PlaceInformation) _then;

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
              as Country?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: ward == freezed
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value));
    });
  }

  @override
  $ProvinceCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $ProvinceCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value));
    });
  }

  @override
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value));
    });
  }

  @override
  $WardCopyWith<$Res>? get ward {
    if (_value.ward == null) {
      return null;
    }

    return $WardCopyWith<$Res>(_value.ward!, (value) {
      return _then(_value.copyWith(ward: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlaceInformationCopyWith<$Res>
    implements $PlaceInformationCopyWith<$Res> {
  factory _$$_PlaceInformationCopyWith(
          _$_PlaceInformation value, $Res Function(_$_PlaceInformation) then) =
      __$$_PlaceInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {Country? country,
      Province? province,
      District? district,
      Ward? ward,
      String? address});

  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $ProvinceCopyWith<$Res>? get province;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class __$$_PlaceInformationCopyWithImpl<$Res>
    extends _$PlaceInformationCopyWithImpl<$Res>
    implements _$$_PlaceInformationCopyWith<$Res> {
  __$$_PlaceInformationCopyWithImpl(
      _$_PlaceInformation _value, $Res Function(_$_PlaceInformation) _then)
      : super(_value, (v) => _then(v as _$_PlaceInformation));

  @override
  _$_PlaceInformation get _value => super._value as _$_PlaceInformation;

  @override
  $Res call({
    Object? country = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_PlaceInformation(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: ward == freezed
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceInformation implements _PlaceInformation {
  const _$_PlaceInformation(
      {this.country, this.province, this.district, this.ward, this.address});

  factory _$_PlaceInformation.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceInformationFromJson(json);

  @override
  final Country? country;
  @override
  final Province? province;
  @override
  final District? district;
  @override
  final Ward? ward;
  @override
  final String? address;

  @override
  String toString() {
    return 'PlaceInformation(country: $country, province: $province, district: $district, ward: $ward, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceInformation &&
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
  _$$_PlaceInformationCopyWith<_$_PlaceInformation> get copyWith =>
      __$$_PlaceInformationCopyWithImpl<_$_PlaceInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceInformationToJson(
      this,
    );
  }
}

abstract class _PlaceInformation implements PlaceInformation {
  const factory _PlaceInformation(
      {final Country? country,
      final Province? province,
      final District? district,
      final Ward? ward,
      final String? address}) = _$_PlaceInformation;

  factory _PlaceInformation.fromJson(Map<String, dynamic> json) =
      _$_PlaceInformation.fromJson;

  @override
  Country? get country;
  @override
  Province? get province;
  @override
  District? get district;
  @override
  Ward? get ward;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceInformationCopyWith<_$_PlaceInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
