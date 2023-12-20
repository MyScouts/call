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
  String get contractNumber => throw _privateConstructorUsedError;
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
  String get residentAddress => throw _privateConstructorUsedError;

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
      {String contractNumber,
      String date,
      String month,
      String year,
      String fullName,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String address,
      String phoneNumber,
      String email,
      String residentAddress});
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
    Object? contractNumber = null,
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
    Object? residentAddress = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
      residentAddress: null == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
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
      {String contractNumber,
      String date,
      String month,
      String year,
      String fullName,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String address,
      String phoneNumber,
      String email,
      String residentAddress});
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
    Object? contractNumber = null,
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
    Object? residentAddress = null,
  }) {
    return _then(_$BossGroupContractPramImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
      residentAddress: null == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BossGroupContractPramImpl implements _BossGroupContractPram {
  const _$BossGroupContractPramImpl(
      {required this.contractNumber,
      required this.date,
      required this.month,
      required this.year,
      required this.fullName,
      required this.birthday,
      required this.identityNumber,
      required this.issuer,
      required this.issuedDate,
      required this.address,
      required this.phoneNumber,
      required this.email,
      required this.residentAddress});

  factory _$BossGroupContractPramImpl.fromJson(Map<String, dynamic> json) =>
      _$$BossGroupContractPramImplFromJson(json);

  @override
  final String contractNumber;
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
  final String residentAddress;

  @override
  String toString() {
    return 'BossGroupContractPram(contractNumber: $contractNumber, date: $date, month: $month, year: $year, fullName: $fullName, birthday: $birthday, identityNumber: $identityNumber, issuer: $issuer, issuedDate: $issuedDate, address: $address, phoneNumber: $phoneNumber, email: $email, residentAddress: $residentAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BossGroupContractPramImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
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
            (identical(other.email, email) || other.email == email) &&
            (identical(other.residentAddress, residentAddress) ||
                other.residentAddress == residentAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
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
      email,
      residentAddress);

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
      {required final String contractNumber,
      required final String date,
      required final String month,
      required final String year,
      required final String fullName,
      required final String birthday,
      required final String identityNumber,
      required final String issuer,
      required final String issuedDate,
      required final String address,
      required final String phoneNumber,
      required final String email,
      required final String residentAddress}) = _$BossGroupContractPramImpl;

  factory _BossGroupContractPram.fromJson(Map<String, dynamic> json) =
      _$BossGroupContractPramImpl.fromJson;

  @override
  String get contractNumber;
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
  String get residentAddress;
  @override
  @JsonKey(ignore: true)
  _$$BossGroupContractPramImplCopyWith<_$BossGroupContractPramImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RentMarShopPackParam _$RentMarShopPackParamFromJson(Map<String, dynamic> json) {
  return _RentMarShopPackParam.fromJson(json);
}

/// @nodoc
mixin _$RentMarShopPackParam {
  String? get contractNumber => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get issuedDate => throw _privateConstructorUsedError;
  String? get issuedPlace => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get representative => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  String? get rentCost => throw _privateConstructorUsedError;
  String? get wordRentCost => throw _privateConstructorUsedError;
  String? get depositAmount => throw _privateConstructorUsedError;
  String? get wordDepositAmount => throw _privateConstructorUsedError;
  String? get taxCode => throw _privateConstructorUsedError;
  String? get residentAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentMarShopPackParamCopyWith<RentMarShopPackParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentMarShopPackParamCopyWith<$Res> {
  factory $RentMarShopPackParamCopyWith(RentMarShopPackParam value,
          $Res Function(RentMarShopPackParam) then) =
      _$RentMarShopPackParamCopyWithImpl<$Res, RentMarShopPackParam>;
  @useResult
  $Res call(
      {String? contractNumber,
      String? date,
      String? month,
      String? year,
      String? identityNumber,
      String? issuedDate,
      String? issuedPlace,
      String? address,
      String? phoneNumber,
      String? email,
      String? representative,
      String? position,
      String? rentCost,
      String? wordRentCost,
      String? depositAmount,
      String? wordDepositAmount,
      String? taxCode,
      String? residentAddress});
}

/// @nodoc
class _$RentMarShopPackParamCopyWithImpl<$Res,
        $Val extends RentMarShopPackParam>
    implements $RentMarShopPackParamCopyWith<$Res> {
  _$RentMarShopPackParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? date = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? identityNumber = freezed,
    Object? issuedDate = freezed,
    Object? issuedPlace = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? representative = freezed,
    Object? position = freezed,
    Object? rentCost = freezed,
    Object? wordRentCost = freezed,
    Object? depositAmount = freezed,
    Object? wordDepositAmount = freezed,
    Object? taxCode = freezed,
    Object? residentAddress = freezed,
  }) {
    return _then(_value.copyWith(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      representative: freezed == representative
          ? _value.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      rentCost: freezed == rentCost
          ? _value.rentCost
          : rentCost // ignore: cast_nullable_to_non_nullable
              as String?,
      wordRentCost: freezed == wordRentCost
          ? _value.wordRentCost
          : wordRentCost // ignore: cast_nullable_to_non_nullable
              as String?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      wordDepositAmount: freezed == wordDepositAmount
          ? _value.wordDepositAmount
          : wordDepositAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      residentAddress: freezed == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentMarShopPackParamImplCopyWith<$Res>
    implements $RentMarShopPackParamCopyWith<$Res> {
  factory _$$RentMarShopPackParamImplCopyWith(_$RentMarShopPackParamImpl value,
          $Res Function(_$RentMarShopPackParamImpl) then) =
      __$$RentMarShopPackParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contractNumber,
      String? date,
      String? month,
      String? year,
      String? identityNumber,
      String? issuedDate,
      String? issuedPlace,
      String? address,
      String? phoneNumber,
      String? email,
      String? representative,
      String? position,
      String? rentCost,
      String? wordRentCost,
      String? depositAmount,
      String? wordDepositAmount,
      String? taxCode,
      String? residentAddress});
}

/// @nodoc
class __$$RentMarShopPackParamImplCopyWithImpl<$Res>
    extends _$RentMarShopPackParamCopyWithImpl<$Res, _$RentMarShopPackParamImpl>
    implements _$$RentMarShopPackParamImplCopyWith<$Res> {
  __$$RentMarShopPackParamImplCopyWithImpl(_$RentMarShopPackParamImpl _value,
      $Res Function(_$RentMarShopPackParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? date = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? identityNumber = freezed,
    Object? issuedDate = freezed,
    Object? issuedPlace = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? representative = freezed,
    Object? position = freezed,
    Object? rentCost = freezed,
    Object? wordRentCost = freezed,
    Object? depositAmount = freezed,
    Object? wordDepositAmount = freezed,
    Object? taxCode = freezed,
    Object? residentAddress = freezed,
  }) {
    return _then(_$RentMarShopPackParamImpl(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      representative: freezed == representative
          ? _value.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      rentCost: freezed == rentCost
          ? _value.rentCost
          : rentCost // ignore: cast_nullable_to_non_nullable
              as String?,
      wordRentCost: freezed == wordRentCost
          ? _value.wordRentCost
          : wordRentCost // ignore: cast_nullable_to_non_nullable
              as String?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      wordDepositAmount: freezed == wordDepositAmount
          ? _value.wordDepositAmount
          : wordDepositAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      residentAddress: freezed == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentMarShopPackParamImpl implements _RentMarShopPackParam {
  const _$RentMarShopPackParamImpl(
      {this.contractNumber,
      this.date,
      this.month,
      this.year,
      this.identityNumber,
      this.issuedDate,
      this.issuedPlace,
      this.address,
      this.phoneNumber,
      this.email,
      this.representative,
      this.position,
      this.rentCost,
      this.wordRentCost,
      this.depositAmount,
      this.wordDepositAmount,
      this.taxCode,
      this.residentAddress});

  factory _$RentMarShopPackParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentMarShopPackParamImplFromJson(json);

  @override
  final String? contractNumber;
  @override
  final String? date;
  @override
  final String? month;
  @override
  final String? year;
  @override
  final String? identityNumber;
  @override
  final String? issuedDate;
  @override
  final String? issuedPlace;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final String? representative;
  @override
  final String? position;
  @override
  final String? rentCost;
  @override
  final String? wordRentCost;
  @override
  final String? depositAmount;
  @override
  final String? wordDepositAmount;
  @override
  final String? taxCode;
  @override
  final String? residentAddress;

  @override
  String toString() {
    return 'RentMarShopPackParam(contractNumber: $contractNumber, date: $date, month: $month, year: $year, identityNumber: $identityNumber, issuedDate: $issuedDate, issuedPlace: $issuedPlace, address: $address, phoneNumber: $phoneNumber, email: $email, representative: $representative, position: $position, rentCost: $rentCost, wordRentCost: $wordRentCost, depositAmount: $depositAmount, wordDepositAmount: $wordDepositAmount, taxCode: $taxCode, residentAddress: $residentAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentMarShopPackParamImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.issuedPlace, issuedPlace) ||
                other.issuedPlace == issuedPlace) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.representative, representative) ||
                other.representative == representative) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rentCost, rentCost) ||
                other.rentCost == rentCost) &&
            (identical(other.wordRentCost, wordRentCost) ||
                other.wordRentCost == wordRentCost) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.wordDepositAmount, wordDepositAmount) ||
                other.wordDepositAmount == wordDepositAmount) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.residentAddress, residentAddress) ||
                other.residentAddress == residentAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      date,
      month,
      year,
      identityNumber,
      issuedDate,
      issuedPlace,
      address,
      phoneNumber,
      email,
      representative,
      position,
      rentCost,
      wordRentCost,
      depositAmount,
      wordDepositAmount,
      taxCode,
      residentAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentMarShopPackParamImplCopyWith<_$RentMarShopPackParamImpl>
      get copyWith =>
          __$$RentMarShopPackParamImplCopyWithImpl<_$RentMarShopPackParamImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentMarShopPackParamImplToJson(
      this,
    );
  }
}

abstract class _RentMarShopPackParam implements RentMarShopPackParam {
  const factory _RentMarShopPackParam(
      {final String? contractNumber,
      final String? date,
      final String? month,
      final String? year,
      final String? identityNumber,
      final String? issuedDate,
      final String? issuedPlace,
      final String? address,
      final String? phoneNumber,
      final String? email,
      final String? representative,
      final String? position,
      final String? rentCost,
      final String? wordRentCost,
      final String? depositAmount,
      final String? wordDepositAmount,
      final String? taxCode,
      final String? residentAddress}) = _$RentMarShopPackParamImpl;

  factory _RentMarShopPackParam.fromJson(Map<String, dynamic> json) =
      _$RentMarShopPackParamImpl.fromJson;

  @override
  String? get contractNumber;
  @override
  String? get date;
  @override
  String? get month;
  @override
  String? get year;
  @override
  String? get identityNumber;
  @override
  String? get issuedDate;
  @override
  String? get issuedPlace;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get email;
  @override
  String? get representative;
  @override
  String? get position;
  @override
  String? get rentCost;
  @override
  String? get wordRentCost;
  @override
  String? get depositAmount;
  @override
  String? get wordDepositAmount;
  @override
  String? get taxCode;
  @override
  String? get residentAddress;
  @override
  @JsonKey(ignore: true)
  _$$RentMarShopPackParamImplCopyWith<_$RentMarShopPackParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseMarShopPackParam _$PurchaseMarShopPackParamFromJson(
    Map<String, dynamic> json) {
  return _PurchaseMarShopPackParam.fromJson(json);
}

/// @nodoc
mixin _$PurchaseMarShopPackParam {
  String? get contractNumber => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get taxCode => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get issuedDate => throw _privateConstructorUsedError;
  String? get issuedPlace => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get representative => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get wordPrice => throw _privateConstructorUsedError;
  String? get residentAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseMarShopPackParamCopyWith<PurchaseMarShopPackParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseMarShopPackParamCopyWith<$Res> {
  factory $PurchaseMarShopPackParamCopyWith(PurchaseMarShopPackParam value,
          $Res Function(PurchaseMarShopPackParam) then) =
      _$PurchaseMarShopPackParamCopyWithImpl<$Res, PurchaseMarShopPackParam>;
  @useResult
  $Res call(
      {String? contractNumber,
      String? date,
      String? month,
      String? year,
      String? address,
      String? taxCode,
      String? identityNumber,
      String? issuedDate,
      String? issuedPlace,
      String? phoneNumber,
      String? email,
      String? representative,
      String? position,
      String? price,
      String? wordPrice,
      String? residentAddress});
}

/// @nodoc
class _$PurchaseMarShopPackParamCopyWithImpl<$Res,
        $Val extends PurchaseMarShopPackParam>
    implements $PurchaseMarShopPackParamCopyWith<$Res> {
  _$PurchaseMarShopPackParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? date = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? address = freezed,
    Object? taxCode = freezed,
    Object? identityNumber = freezed,
    Object? issuedDate = freezed,
    Object? issuedPlace = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? representative = freezed,
    Object? position = freezed,
    Object? price = freezed,
    Object? wordPrice = freezed,
    Object? residentAddress = freezed,
  }) {
    return _then(_value.copyWith(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      representative: freezed == representative
          ? _value.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      wordPrice: freezed == wordPrice
          ? _value.wordPrice
          : wordPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      residentAddress: freezed == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseMarShopPackParamImplCopyWith<$Res>
    implements $PurchaseMarShopPackParamCopyWith<$Res> {
  factory _$$PurchaseMarShopPackParamImplCopyWith(
          _$PurchaseMarShopPackParamImpl value,
          $Res Function(_$PurchaseMarShopPackParamImpl) then) =
      __$$PurchaseMarShopPackParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contractNumber,
      String? date,
      String? month,
      String? year,
      String? address,
      String? taxCode,
      String? identityNumber,
      String? issuedDate,
      String? issuedPlace,
      String? phoneNumber,
      String? email,
      String? representative,
      String? position,
      String? price,
      String? wordPrice,
      String? residentAddress});
}

/// @nodoc
class __$$PurchaseMarShopPackParamImplCopyWithImpl<$Res>
    extends _$PurchaseMarShopPackParamCopyWithImpl<$Res,
        _$PurchaseMarShopPackParamImpl>
    implements _$$PurchaseMarShopPackParamImplCopyWith<$Res> {
  __$$PurchaseMarShopPackParamImplCopyWithImpl(
      _$PurchaseMarShopPackParamImpl _value,
      $Res Function(_$PurchaseMarShopPackParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? date = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? address = freezed,
    Object? taxCode = freezed,
    Object? identityNumber = freezed,
    Object? issuedDate = freezed,
    Object? issuedPlace = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? representative = freezed,
    Object? position = freezed,
    Object? price = freezed,
    Object? wordPrice = freezed,
    Object? residentAddress = freezed,
  }) {
    return _then(_$PurchaseMarShopPackParamImpl(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      representative: freezed == representative
          ? _value.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      wordPrice: freezed == wordPrice
          ? _value.wordPrice
          : wordPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      residentAddress: freezed == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseMarShopPackParamImpl implements _PurchaseMarShopPackParam {
  const _$PurchaseMarShopPackParamImpl(
      {this.contractNumber,
      this.date,
      this.month,
      this.year,
      this.address,
      this.taxCode,
      this.identityNumber,
      this.issuedDate,
      this.issuedPlace,
      this.phoneNumber,
      this.email,
      this.representative,
      this.position,
      this.price,
      this.wordPrice,
      this.residentAddress});

  factory _$PurchaseMarShopPackParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseMarShopPackParamImplFromJson(json);

  @override
  final String? contractNumber;
  @override
  final String? date;
  @override
  final String? month;
  @override
  final String? year;
  @override
  final String? address;
  @override
  final String? taxCode;
  @override
  final String? identityNumber;
  @override
  final String? issuedDate;
  @override
  final String? issuedPlace;
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final String? representative;
  @override
  final String? position;
  @override
  final String? price;
  @override
  final String? wordPrice;
  @override
  final String? residentAddress;

  @override
  String toString() {
    return 'PurchaseMarShopPackParam(contractNumber: $contractNumber, date: $date, month: $month, year: $year, address: $address, taxCode: $taxCode, identityNumber: $identityNumber, issuedDate: $issuedDate, issuedPlace: $issuedPlace, phoneNumber: $phoneNumber, email: $email, representative: $representative, position: $position, price: $price, wordPrice: $wordPrice, residentAddress: $residentAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseMarShopPackParamImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.issuedPlace, issuedPlace) ||
                other.issuedPlace == issuedPlace) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.representative, representative) ||
                other.representative == representative) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.wordPrice, wordPrice) ||
                other.wordPrice == wordPrice) &&
            (identical(other.residentAddress, residentAddress) ||
                other.residentAddress == residentAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      date,
      month,
      year,
      address,
      taxCode,
      identityNumber,
      issuedDate,
      issuedPlace,
      phoneNumber,
      email,
      representative,
      position,
      price,
      wordPrice,
      residentAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseMarShopPackParamImplCopyWith<_$PurchaseMarShopPackParamImpl>
      get copyWith => __$$PurchaseMarShopPackParamImplCopyWithImpl<
          _$PurchaseMarShopPackParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseMarShopPackParamImplToJson(
      this,
    );
  }
}

abstract class _PurchaseMarShopPackParam implements PurchaseMarShopPackParam {
  const factory _PurchaseMarShopPackParam(
      {final String? contractNumber,
      final String? date,
      final String? month,
      final String? year,
      final String? address,
      final String? taxCode,
      final String? identityNumber,
      final String? issuedDate,
      final String? issuedPlace,
      final String? phoneNumber,
      final String? email,
      final String? representative,
      final String? position,
      final String? price,
      final String? wordPrice,
      final String? residentAddress}) = _$PurchaseMarShopPackParamImpl;

  factory _PurchaseMarShopPackParam.fromJson(Map<String, dynamic> json) =
      _$PurchaseMarShopPackParamImpl.fromJson;

  @override
  String? get contractNumber;
  @override
  String? get date;
  @override
  String? get month;
  @override
  String? get year;
  @override
  String? get address;
  @override
  String? get taxCode;
  @override
  String? get identityNumber;
  @override
  String? get issuedDate;
  @override
  String? get issuedPlace;
  @override
  String? get phoneNumber;
  @override
  String? get email;
  @override
  String? get representative;
  @override
  String? get position;
  @override
  String? get price;
  @override
  String? get wordPrice;
  @override
  String? get residentAddress;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseMarShopPackParamImplCopyWith<_$PurchaseMarShopPackParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

JAContractParam _$JAContractParamFromJson(Map<String, dynamic> json) {
  return _JAContractParam.fromJson(json);
}

/// @nodoc
mixin _$JAContractParam {
  String get contractNumber => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get identityNumber => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;
  String get issuedDate => throw _privateConstructorUsedError;
  String get residentAddress => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JAContractParamCopyWith<JAContractParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JAContractParamCopyWith<$Res> {
  factory $JAContractParamCopyWith(
          JAContractParam value, $Res Function(JAContractParam) then) =
      _$JAContractParamCopyWithImpl<$Res, JAContractParam>;
  @useResult
  $Res call(
      {String contractNumber,
      String date,
      String month,
      String year,
      String fullName,
      String fullname,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String residentAddress,
      String address,
      String phoneNumber,
      String email});
}

/// @nodoc
class _$JAContractParamCopyWithImpl<$Res, $Val extends JAContractParam>
    implements $JAContractParamCopyWith<$Res> {
  _$JAContractParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? date = null,
    Object? month = null,
    Object? year = null,
    Object? fullName = null,
    Object? fullname = null,
    Object? birthday = null,
    Object? identityNumber = null,
    Object? issuer = null,
    Object? issuedDate = null,
    Object? residentAddress = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
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
      residentAddress: null == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
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
abstract class _$$JAContractParamImplCopyWith<$Res>
    implements $JAContractParamCopyWith<$Res> {
  factory _$$JAContractParamImplCopyWith(_$JAContractParamImpl value,
          $Res Function(_$JAContractParamImpl) then) =
      __$$JAContractParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contractNumber,
      String date,
      String month,
      String year,
      String fullName,
      String fullname,
      String birthday,
      String identityNumber,
      String issuer,
      String issuedDate,
      String residentAddress,
      String address,
      String phoneNumber,
      String email});
}

/// @nodoc
class __$$JAContractParamImplCopyWithImpl<$Res>
    extends _$JAContractParamCopyWithImpl<$Res, _$JAContractParamImpl>
    implements _$$JAContractParamImplCopyWith<$Res> {
  __$$JAContractParamImplCopyWithImpl(
      _$JAContractParamImpl _value, $Res Function(_$JAContractParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? date = null,
    Object? month = null,
    Object? year = null,
    Object? fullName = null,
    Object? fullname = null,
    Object? birthday = null,
    Object? identityNumber = null,
    Object? issuer = null,
    Object? issuedDate = null,
    Object? residentAddress = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
  }) {
    return _then(_$JAContractParamImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
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
      residentAddress: null == residentAddress
          ? _value.residentAddress
          : residentAddress // ignore: cast_nullable_to_non_nullable
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
class _$JAContractParamImpl implements _JAContractParam {
  const _$JAContractParamImpl(
      {required this.contractNumber,
      required this.date,
      required this.month,
      required this.year,
      required this.fullName,
      required this.fullname,
      required this.birthday,
      required this.identityNumber,
      required this.issuer,
      required this.issuedDate,
      required this.residentAddress,
      required this.address,
      required this.phoneNumber,
      required this.email});

  factory _$JAContractParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$JAContractParamImplFromJson(json);

  @override
  final String contractNumber;
  @override
  final String date;
  @override
  final String month;
  @override
  final String year;
  @override
  final String fullName;
  @override
  final String fullname;
  @override
  final String birthday;
  @override
  final String identityNumber;
  @override
  final String issuer;
  @override
  final String issuedDate;
  @override
  final String residentAddress;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String email;

  @override
  String toString() {
    return 'JAContractParam(contractNumber: $contractNumber, date: $date, month: $month, year: $year, fullName: $fullName, fullname: $fullname, birthday: $birthday, identityNumber: $identityNumber, issuer: $issuer, issuedDate: $issuedDate, residentAddress: $residentAddress, address: $address, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JAContractParamImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.residentAddress, residentAddress) ||
                other.residentAddress == residentAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      date,
      month,
      year,
      fullName,
      fullname,
      birthday,
      identityNumber,
      issuer,
      issuedDate,
      residentAddress,
      address,
      phoneNumber,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JAContractParamImplCopyWith<_$JAContractParamImpl> get copyWith =>
      __$$JAContractParamImplCopyWithImpl<_$JAContractParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JAContractParamImplToJson(
      this,
    );
  }
}

abstract class _JAContractParam implements JAContractParam {
  const factory _JAContractParam(
      {required final String contractNumber,
      required final String date,
      required final String month,
      required final String year,
      required final String fullName,
      required final String fullname,
      required final String birthday,
      required final String identityNumber,
      required final String issuer,
      required final String issuedDate,
      required final String residentAddress,
      required final String address,
      required final String phoneNumber,
      required final String email}) = _$JAContractParamImpl;

  factory _JAContractParam.fromJson(Map<String, dynamic> json) =
      _$JAContractParamImpl.fromJson;

  @override
  String get contractNumber;
  @override
  String get date;
  @override
  String get month;
  @override
  String get year;
  @override
  String get fullName;
  @override
  String get fullname;
  @override
  String get birthday;
  @override
  String get identityNumber;
  @override
  String get issuer;
  @override
  String get issuedDate;
  @override
  String get residentAddress;
  @override
  String get address;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$JAContractParamImplCopyWith<_$JAContractParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
