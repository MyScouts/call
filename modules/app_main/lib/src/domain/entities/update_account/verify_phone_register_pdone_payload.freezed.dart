// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_phone_register_pdone_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyOtpPDonePayload _$VerifyOtpPDonePayloadFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpPDonePayload.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpPDonePayload {
  @JsonKey(includeIfNull: false)
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phoneCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpPDonePayloadCopyWith<VerifyOtpPDonePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpPDonePayloadCopyWith<$Res> {
  factory $VerifyOtpPDonePayloadCopyWith(VerifyOtpPDonePayload value,
          $Res Function(VerifyOtpPDonePayload) then) =
      _$VerifyOtpPDonePayloadCopyWithImpl<$Res, VerifyOtpPDonePayload>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? token,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(includeIfNull: false) String? email,
      String otp});
}

/// @nodoc
class _$VerifyOtpPDonePayloadCopyWithImpl<$Res,
        $Val extends VerifyOtpPDonePayload>
    implements $VerifyOtpPDonePayloadCopyWith<$Res> {
  _$VerifyOtpPDonePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? phone = freezed,
    Object? phoneCode = freezed,
    Object? email = freezed,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpPDonePayloadImplCopyWith<$Res>
    implements $VerifyOtpPDonePayloadCopyWith<$Res> {
  factory _$$VerifyOtpPDonePayloadImplCopyWith(
          _$VerifyOtpPDonePayloadImpl value,
          $Res Function(_$VerifyOtpPDonePayloadImpl) then) =
      __$$VerifyOtpPDonePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? token,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(includeIfNull: false) String? email,
      String otp});
}

/// @nodoc
class __$$VerifyOtpPDonePayloadImplCopyWithImpl<$Res>
    extends _$VerifyOtpPDonePayloadCopyWithImpl<$Res,
        _$VerifyOtpPDonePayloadImpl>
    implements _$$VerifyOtpPDonePayloadImplCopyWith<$Res> {
  __$$VerifyOtpPDonePayloadImplCopyWithImpl(_$VerifyOtpPDonePayloadImpl _value,
      $Res Function(_$VerifyOtpPDonePayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? phone = freezed,
    Object? phoneCode = freezed,
    Object? email = freezed,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpPDonePayloadImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpPDonePayloadImpl implements _VerifyOtpPDonePayload {
  const _$VerifyOtpPDonePayloadImpl(
      {@JsonKey(includeIfNull: false) this.token,
      @JsonKey(includeIfNull: false) this.phone,
      @JsonKey(includeIfNull: false) this.phoneCode,
      @JsonKey(includeIfNull: false) this.email,
      required this.otp});

  factory _$VerifyOtpPDonePayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpPDonePayloadImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? token;
  @override
  @JsonKey(includeIfNull: false)
  final String? phone;
  @override
  @JsonKey(includeIfNull: false)
  final String? phoneCode;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpPDonePayload(token: $token, phone: $phone, phoneCode: $phoneCode, email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpPDonePayloadImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, phone, phoneCode, email, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpPDonePayloadImplCopyWith<_$VerifyOtpPDonePayloadImpl>
      get copyWith => __$$VerifyOtpPDonePayloadImplCopyWithImpl<
          _$VerifyOtpPDonePayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpPDonePayloadImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpPDonePayload implements VerifyOtpPDonePayload {
  const factory _VerifyOtpPDonePayload(
      {@JsonKey(includeIfNull: false) final String? token,
      @JsonKey(includeIfNull: false) final String? phone,
      @JsonKey(includeIfNull: false) final String? phoneCode,
      @JsonKey(includeIfNull: false) final String? email,
      required final String otp}) = _$VerifyOtpPDonePayloadImpl;

  factory _VerifyOtpPDonePayload.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpPDonePayloadImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get token;
  @override
  @JsonKey(includeIfNull: false)
  String? get phone;
  @override
  @JsonKey(includeIfNull: false)
  String? get phoneCode;
  @override
  @JsonKey(includeIfNull: false)
  String? get email;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpPDonePayloadImplCopyWith<_$VerifyOtpPDonePayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
