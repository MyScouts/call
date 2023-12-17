// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RenderPDFPayload _$RenderPDFPayloadFromJson(Map<String, dynamic> json) {
  return _RenderPDFPayload.fromJson(json);
}

/// @nodoc
mixin _$RenderPDFPayload {
  int get type => throw _privateConstructorUsedError;
  dynamic get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RenderPDFPayloadCopyWith<RenderPDFPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenderPDFPayloadCopyWith<$Res> {
  factory $RenderPDFPayloadCopyWith(
          RenderPDFPayload value, $Res Function(RenderPDFPayload) then) =
      _$RenderPDFPayloadCopyWithImpl<$Res, RenderPDFPayload>;
  @useResult
  $Res call({int type, dynamic params});
}

/// @nodoc
class _$RenderPDFPayloadCopyWithImpl<$Res, $Val extends RenderPDFPayload>
    implements $RenderPDFPayloadCopyWith<$Res> {
  _$RenderPDFPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RenderPDFPayloadImplCopyWith<$Res>
    implements $RenderPDFPayloadCopyWith<$Res> {
  factory _$$RenderPDFPayloadImplCopyWith(_$RenderPDFPayloadImpl value,
          $Res Function(_$RenderPDFPayloadImpl) then) =
      __$$RenderPDFPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int type, dynamic params});
}

/// @nodoc
class __$$RenderPDFPayloadImplCopyWithImpl<$Res>
    extends _$RenderPDFPayloadCopyWithImpl<$Res, _$RenderPDFPayloadImpl>
    implements _$$RenderPDFPayloadImplCopyWith<$Res> {
  __$$RenderPDFPayloadImplCopyWithImpl(_$RenderPDFPayloadImpl _value,
      $Res Function(_$RenderPDFPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? params = freezed,
  }) {
    return _then(_$RenderPDFPayloadImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RenderPDFPayloadImpl implements _RenderPDFPayload {
  const _$RenderPDFPayloadImpl({required this.type, required this.params});

  factory _$RenderPDFPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RenderPDFPayloadImplFromJson(json);

  @override
  final int type;
  @override
  final dynamic params;

  @override
  String toString() {
    return 'RenderPDFPayload(type: $type, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenderPDFPayloadImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RenderPDFPayloadImplCopyWith<_$RenderPDFPayloadImpl> get copyWith =>
      __$$RenderPDFPayloadImplCopyWithImpl<_$RenderPDFPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RenderPDFPayloadImplToJson(
      this,
    );
  }
}

abstract class _RenderPDFPayload implements RenderPDFPayload {
  const factory _RenderPDFPayload(
      {required final int type,
      required final dynamic params}) = _$RenderPDFPayloadImpl;

  factory _RenderPDFPayload.fromJson(Map<String, dynamic> json) =
      _$RenderPDFPayloadImpl.fromJson;

  @override
  int get type;
  @override
  dynamic get params;
  @override
  @JsonKey(ignore: true)
  _$$RenderPDFPayloadImplCopyWith<_$RenderPDFPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BossGroupContractPram _$BossGroupContractPramFromJson(
    Map<String, dynamic> json) {
  return _BossGroupContractPram.fromJson(json);
}

/// @nodoc
mixin _$BossGroupContractPram {
  String get date => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get identityNumber => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;
  String get issuedDate => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BossGroupContractPramCopyWith<BossGroupContractPram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BossGroupContractPramCopyWith<$Res> {
  factory $BossGroupContractPramCopyWith(BossGroupContractPram value,
          $Res Function(BossGroupContractPram) then) =
      _$BossGroupContractPramCopyWithImpl<$Res, BossGroupContractPram>;
  @useResult
  $Res call(
      {String date,
      String month,
      String year,
      String fullName,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String address,
      String phoneNumber,
      String email});
}

/// @nodoc
class _$BossGroupContractPramCopyWithImpl<$Res,
        $Val extends BossGroupContractPram>
    implements $BossGroupContractPramCopyWith<$Res> {
  _$BossGroupContractPramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? month = null,
    Object? year = null,
    Object? fullName = null,
    Object? birthday = null,
    Object? identityNumber = null,
    Object? issuer = null,
    Object? issuedDate = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      identityNumber: null == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: null == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BossGroupContractPramImplCopyWith<$Res>
    implements $BossGroupContractPramCopyWith<$Res> {
  factory _$$BossGroupContractPramImplCopyWith(
          _$BossGroupContractPramImpl value,
          $Res Function(_$BossGroupContractPramImpl) then) =
      __$$BossGroupContractPramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      String month,
      String year,
      String fullName,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String address,
      String phoneNumber,
      String email});
}

/// @nodoc
class __$$BossGroupContractPramImplCopyWithImpl<$Res>
    extends _$BossGroupContractPramCopyWithImpl<$Res,
        _$BossGroupContractPramImpl>
    implements _$$BossGroupContractPramImplCopyWith<$Res> {
  __$$BossGroupContractPramImplCopyWithImpl(_$BossGroupContractPramImpl _value,
      $Res Function(_$BossGroupContractPramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? month = null,
    Object? year = null,
    Object? fullName = null,
    Object? birthday = null,
    Object? identityNumber = null,
    Object? issuer = null,
    Object? issuedDate = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
  }) {
    return _then(_$BossGroupContractPramImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      identityNumber: null == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: null == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BossGroupContractPramImpl implements _BossGroupContractPram {
  const _$BossGroupContractPramImpl(
      {required this.date,
      required this.month,
      required this.year,
      required this.fullName,
      required this.birthday,
      required this.identityNumber,
      required this.issuer,
      required this.issuedDate,
      required this.address,
      required this.phoneNumber,
      required this.email});

  factory _$BossGroupContractPramImpl.fromJson(Map<String, dynamic> json) =>
      _$$BossGroupContractPramImplFromJson(json);

  @override
  final String date;
  @override
  final String month;
  @override
  final String year;
  @override
  final String fullName;
  @override
  final String birthday;
  @override
  final String identityNumber;
  @override
  final String issuer;
  @override
  final String issuedDate;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String email;

  @override
  String toString() {
    return 'BossGroupContractPram(date: $date, month: $month, year: $year, fullName: $fullName, birthday: $birthday, identityNumber: $identityNumber, issuer: $issuer, issuedDate: $issuedDate, address: $address, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BossGroupContractPramImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      month,
      year,
      fullName,
      birthday,
      identityNumber,
      issuer,
      issuedDate,
      address,
      phoneNumber,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BossGroupContractPramImplCopyWith<_$BossGroupContractPramImpl>
      get copyWith => __$$BossGroupContractPramImplCopyWithImpl<
          _$BossGroupContractPramImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BossGroupContractPramImplToJson(
      this,
    );
  }
}

abstract class _BossGroupContractPram implements BossGroupContractPram {
  const factory _BossGroupContractPram(
      {required final String date,
      required final String month,
      required final String year,
      required final String fullName,
      required final String birthday,
      required final String identityNumber,
      required final String issuer,
      required final String issuedDate,
      required final String address,
      required final String phoneNumber,
      required final String email}) = _$BossGroupContractPramImpl;

  factory _BossGroupContractPram.fromJson(Map<String, dynamic> json) =
      _$BossGroupContractPramImpl.fromJson;

  @override
  String get date;
  @override
  String get month;
  @override
  String get year;
  @override
  String get fullName;
  @override
  String get birthday;
  @override
  String get identityNumber;
  @override
  String get issuer;
  @override
  String get issuedDate;
  @override
  String get address;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$BossGroupContractPramImplCopyWith<_$BossGroupContractPramImpl>
      get copyWith => throw _privateConstructorUsedError;
}
