// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Agency _$AgencyFromJson(Map<String, dynamic> json) {
  return _Agency.fromJson(json);
}

/// @nodoc
mixin _$Agency {
  int? get id => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get pDoneId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get agencyName => throw _privateConstructorUsedError;
  int? get totalPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgencyCopyWith<Agency> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyCopyWith<$Res> {
  factory $AgencyCopyWith(Agency value, $Res Function(Agency) then) =
      _$AgencyCopyWithImpl<$Res, Agency>;
  @useResult
  $Res call(
      {int? id,
      String? phone,
      String? email,
      String? pDoneId,
      String? displayName,
      String? agencyName,
      int? totalPoint});
}

/// @nodoc
class _$AgencyCopyWithImpl<$Res, $Val extends Agency>
    implements $AgencyCopyWith<$Res> {
  _$AgencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? pDoneId = freezed,
    Object? displayName = freezed,
    Object? agencyName = freezed,
    Object? totalPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      agencyName: freezed == agencyName
          ? _value.agencyName
          : agencyName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgencyImplCopyWith<$Res> implements $AgencyCopyWith<$Res> {
  factory _$$AgencyImplCopyWith(
          _$AgencyImpl value, $Res Function(_$AgencyImpl) then) =
      __$$AgencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? phone,
      String? email,
      String? pDoneId,
      String? displayName,
      String? agencyName,
      int? totalPoint});
}

/// @nodoc
class __$$AgencyImplCopyWithImpl<$Res>
    extends _$AgencyCopyWithImpl<$Res, _$AgencyImpl>
    implements _$$AgencyImplCopyWith<$Res> {
  __$$AgencyImplCopyWithImpl(
      _$AgencyImpl _value, $Res Function(_$AgencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? pDoneId = freezed,
    Object? displayName = freezed,
    Object? agencyName = freezed,
    Object? totalPoint = freezed,
  }) {
    return _then(_$AgencyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      agencyName: freezed == agencyName
          ? _value.agencyName
          : agencyName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgencyImpl implements _Agency {
  const _$AgencyImpl(
      {this.id,
      this.phone,
      this.email,
      this.pDoneId,
      this.displayName,
      this.agencyName,
      this.totalPoint});

  factory _$AgencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgencyImplFromJson(json);

  @override
  final int? id;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? pDoneId;
  @override
  final String? displayName;
  @override
  final String? agencyName;
  @override
  final int? totalPoint;

  @override
  String toString() {
    return 'Agency(id: $id, phone: $phone, email: $email, pDoneId: $pDoneId, displayName: $displayName, agencyName: $agencyName, totalPoint: $totalPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.agencyName, agencyName) ||
                other.agencyName == agencyName) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phone, email, pDoneId,
      displayName, agencyName, totalPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgencyImplCopyWith<_$AgencyImpl> get copyWith =>
      __$$AgencyImplCopyWithImpl<_$AgencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgencyImplToJson(
      this,
    );
  }
}

abstract class _Agency implements Agency {
  const factory _Agency(
      {final int? id,
      final String? phone,
      final String? email,
      final String? pDoneId,
      final String? displayName,
      final String? agencyName,
      final int? totalPoint}) = _$AgencyImpl;

  factory _Agency.fromJson(Map<String, dynamic> json) = _$AgencyImpl.fromJson;

  @override
  int? get id;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get pDoneId;
  @override
  String? get displayName;
  @override
  String? get agencyName;
  @override
  int? get totalPoint;
  @override
  @JsonKey(ignore: true)
  _$$AgencyImplCopyWith<_$AgencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
