// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infomation_pdone_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PDoneProfile _$PDoneProfileFromJson(Map<String, dynamic> json) {
  return _PDoneProfile.fromJson(json);
}

/// @nodoc
mixin _$PDoneProfile {
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  int? get sex => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PDoneProfileCopyWith<PDoneProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PDoneProfileCopyWith<$Res> {
  factory $PDoneProfileCopyWith(
          PDoneProfile value, $Res Function(PDoneProfile) then) =
      _$PDoneProfileCopyWithImpl<$Res, PDoneProfile>;
  @useResult
  $Res call(
      {String? firstName,
      String? middleName,
      String? lastName,
      String? nickName,
      int? sex,
      String? identityNumber,
      String? birthday});
}

/// @nodoc
class _$PDoneProfileCopyWithImpl<$Res, $Val extends PDoneProfile>
    implements $PDoneProfileCopyWith<$Res> {
  _$PDoneProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? nickName = freezed,
    Object? sex = freezed,
    Object? identityNumber = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PDoneProfileImplCopyWith<$Res>
    implements $PDoneProfileCopyWith<$Res> {
  factory _$$PDoneProfileImplCopyWith(
          _$PDoneProfileImpl value, $Res Function(_$PDoneProfileImpl) then) =
      __$$PDoneProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? middleName,
      String? lastName,
      String? nickName,
      int? sex,
      String? identityNumber,
      String? birthday});
}

/// @nodoc
class __$$PDoneProfileImplCopyWithImpl<$Res>
    extends _$PDoneProfileCopyWithImpl<$Res, _$PDoneProfileImpl>
    implements _$$PDoneProfileImplCopyWith<$Res> {
  __$$PDoneProfileImplCopyWithImpl(
      _$PDoneProfileImpl _value, $Res Function(_$PDoneProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? nickName = freezed,
    Object? sex = freezed,
    Object? identityNumber = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$PDoneProfileImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PDoneProfileImpl implements _PDoneProfile {
  const _$PDoneProfileImpl(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.nickName,
      this.sex,
      this.identityNumber,
      this.birthday});

  factory _$PDoneProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PDoneProfileImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? nickName;
  @override
  final int? sex;
  @override
  final String? identityNumber;
  @override
  final String? birthday;

  @override
  String toString() {
    return 'PDoneProfile(firstName: $firstName, middleName: $middleName, lastName: $lastName, nickName: $nickName, sex: $sex, identityNumber: $identityNumber, birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PDoneProfileImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, middleName, lastName,
      nickName, sex, identityNumber, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PDoneProfileImplCopyWith<_$PDoneProfileImpl> get copyWith =>
      __$$PDoneProfileImplCopyWithImpl<_$PDoneProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PDoneProfileImplToJson(
      this,
    );
  }
}

abstract class _PDoneProfile implements PDoneProfile {
  const factory _PDoneProfile(
      {final String? firstName,
      final String? middleName,
      final String? lastName,
      final String? nickName,
      final int? sex,
      final String? identityNumber,
      final String? birthday}) = _$PDoneProfileImpl;

  factory _PDoneProfile.fromJson(Map<String, dynamic> json) =
      _$PDoneProfileImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get nickName;
  @override
  int? get sex;
  @override
  String? get identityNumber;
  @override
  String? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$PDoneProfileImplCopyWith<_$PDoneProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
