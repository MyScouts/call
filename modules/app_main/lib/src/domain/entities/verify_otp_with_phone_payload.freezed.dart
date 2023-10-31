// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_with_phone_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyOtpWithPhonePayload _$VerifyOtpWithPhonePayloadFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpWithPhonePayload.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpWithPhonePayload {
  String get token => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', includeIfNull: false)
  int get countryId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phoneCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpWithPhonePayloadCopyWith<VerifyOtpWithPhonePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpWithPhonePayloadCopyWith<$Res> {
  factory $VerifyOtpWithPhonePayloadCopyWith(VerifyOtpWithPhonePayload value,
          $Res Function(VerifyOtpWithPhonePayload) then) =
      _$VerifyOtpWithPhonePayloadCopyWithImpl<$Res, VerifyOtpWithPhonePayload>;
  @useResult
  $Res call(
      {String token,
      String phone,
      @JsonKey(name: 'country_id', includeIfNull: false) int countryId,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(includeIfNull: false) String? otp});
}

/// @nodoc
class _$VerifyOtpWithPhonePayloadCopyWithImpl<$Res,
        $Val extends VerifyOtpWithPhonePayload>
    implements $VerifyOtpWithPhonePayloadCopyWith<$Res> {
  _$VerifyOtpWithPhonePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phone = null,
    Object? countryId = null,
    Object? phoneCode = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyOtpWithPhonePayloadCopyWith<$Res>
    implements $VerifyOtpWithPhonePayloadCopyWith<$Res> {
  factory _$$_VerifyOtpWithPhonePayloadCopyWith(
          _$_VerifyOtpWithPhonePayload value,
          $Res Function(_$_VerifyOtpWithPhonePayload) then) =
      __$$_VerifyOtpWithPhonePayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String phone,
      @JsonKey(name: 'country_id', includeIfNull: false) int countryId,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(includeIfNull: false) String? otp});
}

/// @nodoc
class __$$_VerifyOtpWithPhonePayloadCopyWithImpl<$Res>
    extends _$VerifyOtpWithPhonePayloadCopyWithImpl<$Res,
        _$_VerifyOtpWithPhonePayload>
    implements _$$_VerifyOtpWithPhonePayloadCopyWith<$Res> {
  __$$_VerifyOtpWithPhonePayloadCopyWithImpl(
      _$_VerifyOtpWithPhonePayload _value,
      $Res Function(_$_VerifyOtpWithPhonePayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phone = null,
    Object? countryId = null,
    Object? phoneCode = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$_VerifyOtpWithPhonePayload(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyOtpWithPhonePayload implements _VerifyOtpWithPhonePayload {
  const _$_VerifyOtpWithPhonePayload(
      {required this.token,
      required this.phone,
      @JsonKey(name: 'country_id', includeIfNull: false)
      required this.countryId,
      @JsonKey(includeIfNull: false) this.phoneCode,
      @JsonKey(includeIfNull: false) this.otp});

  factory _$_VerifyOtpWithPhonePayload.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyOtpWithPhonePayloadFromJson(json);

  @override
  final String token;
  @override
  final String phone;
  @override
  @JsonKey(name: 'country_id', includeIfNull: false)
  final int countryId;
  @override
  @JsonKey(includeIfNull: false)
  final String? phoneCode;
  @override
  @JsonKey(includeIfNull: false)
  final String? otp;

  @override
  String toString() {
    return 'VerifyOtpWithPhonePayload(token: $token, phone: $phone, countryId: $countryId, phoneCode: $phoneCode, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtpWithPhonePayload &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, phone, countryId, phoneCode, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyOtpWithPhonePayloadCopyWith<_$_VerifyOtpWithPhonePayload>
      get copyWith => __$$_VerifyOtpWithPhonePayloadCopyWithImpl<
          _$_VerifyOtpWithPhonePayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyOtpWithPhonePayloadToJson(
      this,
    );
  }
}

abstract class _VerifyOtpWithPhonePayload implements VerifyOtpWithPhonePayload {
  const factory _VerifyOtpWithPhonePayload(
          {required final String token,
          required final String phone,
          @JsonKey(name: 'country_id', includeIfNull: false)
          required final int countryId,
          @JsonKey(includeIfNull: false) final String? phoneCode,
          @JsonKey(includeIfNull: false) final String? otp}) =
      _$_VerifyOtpWithPhonePayload;

  factory _VerifyOtpWithPhonePayload.fromJson(Map<String, dynamic> json) =
      _$_VerifyOtpWithPhonePayload.fromJson;

  @override
  String get token;
  @override
  String get phone;
  @override
  @JsonKey(name: 'country_id', includeIfNull: false)
  int get countryId;
  @override
  @JsonKey(includeIfNull: false)
  String? get phoneCode;
  @override
  @JsonKey(includeIfNull: false)
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyOtpWithPhonePayloadCopyWith<_$_VerifyOtpWithPhonePayload>
      get copyWith => throw _privateConstructorUsedError;
}
