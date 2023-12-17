// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$PlaceInformationCopyWithImpl<$Res, PlaceInformation>;
  @useResult
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
class _$PlaceInformationCopyWithImpl<$Res, $Val extends PlaceInformation>
    implements $PlaceInformationCopyWith<$Res> {
  _$PlaceInformationCopyWithImpl(this._value, this._then);

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
              as Country?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProvinceCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $ProvinceCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WardCopyWith<$Res>? get ward {
    if (_value.ward == null) {
      return null;
    }

    return $WardCopyWith<$Res>(_value.ward!, (value) {
      return _then(_value.copyWith(ward: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceInformationImplCopyWith<$Res>
    implements $PlaceInformationCopyWith<$Res> {
  factory _$$PlaceInformationImplCopyWith(_$PlaceInformationImpl value,
          $Res Function(_$PlaceInformationImpl) then) =
      __$$PlaceInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$PlaceInformationImplCopyWithImpl<$Res>
    extends _$PlaceInformationCopyWithImpl<$Res, _$PlaceInformationImpl>
    implements _$$PlaceInformationImplCopyWith<$Res> {
  __$$PlaceInformationImplCopyWithImpl(_$PlaceInformationImpl _value,
      $Res Function(_$PlaceInformationImpl) _then)
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
    return _then(_$PlaceInformationImpl(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceInformationImpl implements _PlaceInformation {
  const _$PlaceInformationImpl(
      {this.country, this.province, this.district, this.ward, this.address});

  factory _$PlaceInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceInformationImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceInformationImpl &&
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
  _$$PlaceInformationImplCopyWith<_$PlaceInformationImpl> get copyWith =>
      __$$PlaceInformationImplCopyWithImpl<_$PlaceInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceInformationImplToJson(
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
      final String? address}) = _$PlaceInformationImpl;

  factory _PlaceInformation.fromJson(Map<String, dynamic> json) =
      _$PlaceInformationImpl.fromJson;

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
  _$$PlaceInformationImplCopyWith<_$PlaceInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
