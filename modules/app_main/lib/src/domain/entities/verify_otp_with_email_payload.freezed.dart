// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_with_email_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyOtpWithEmailPayload _$VerifyOtpWithEmailPayloadFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpWithEmailPayload.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpWithEmailPayload {
  String get email => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpWithEmailPayloadCopyWith<VerifyOtpWithEmailPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpWithEmailPayloadCopyWith<$Res> {
  factory $VerifyOtpWithEmailPayloadCopyWith(VerifyOtpWithEmailPayload value,
          $Res Function(VerifyOtpWithEmailPayload) then) =
      _$VerifyOtpWithEmailPayloadCopyWithImpl<$Res, VerifyOtpWithEmailPayload>;
  @useResult
  $Res call({String email, String otp, String token});
}

/// @nodoc
class _$VerifyOtpWithEmailPayloadCopyWithImpl<$Res,
        $Val extends VerifyOtpWithEmailPayload>
    implements $VerifyOtpWithEmailPayloadCopyWith<$Res> {
  _$VerifyOtpWithEmailPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyOtpWithEmailPayloadCopyWith<$Res>
    implements $VerifyOtpWithEmailPayloadCopyWith<$Res> {
  factory _$$_VerifyOtpWithEmailPayloadCopyWith(
          _$_VerifyOtpWithEmailPayload value,
          $Res Function(_$_VerifyOtpWithEmailPayload) then) =
      __$$_VerifyOtpWithEmailPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otp, String token});
}

/// @nodoc
class __$$_VerifyOtpWithEmailPayloadCopyWithImpl<$Res>
    extends _$VerifyOtpWithEmailPayloadCopyWithImpl<$Res,
        _$_VerifyOtpWithEmailPayload>
    implements _$$_VerifyOtpWithEmailPayloadCopyWith<$Res> {
  __$$_VerifyOtpWithEmailPayloadCopyWithImpl(
      _$_VerifyOtpWithEmailPayload _value,
      $Res Function(_$_VerifyOtpWithEmailPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
    Object? token = null,
  }) {
    return _then(_$_VerifyOtpWithEmailPayload(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyOtpWithEmailPayload implements _VerifyOtpWithEmailPayload {
  const _$_VerifyOtpWithEmailPayload(
      {required this.email, required this.otp, required this.token});

  factory _$_VerifyOtpWithEmailPayload.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyOtpWithEmailPayloadFromJson(json);

  @override
  final String email;
  @override
  final String otp;
  @override
  final String token;

  @override
  String toString() {
    return 'VerifyOtpWithEmailPayload(email: $email, otp: $otp, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtpWithEmailPayload &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyOtpWithEmailPayloadCopyWith<_$_VerifyOtpWithEmailPayload>
      get copyWith => __$$_VerifyOtpWithEmailPayloadCopyWithImpl<
          _$_VerifyOtpWithEmailPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyOtpWithEmailPayloadToJson(
      this,
    );
  }
}

abstract class _VerifyOtpWithEmailPayload implements VerifyOtpWithEmailPayload {
  const factory _VerifyOtpWithEmailPayload(
      {required final String email,
      required final String otp,
      required final String token}) = _$_VerifyOtpWithEmailPayload;

  factory _VerifyOtpWithEmailPayload.fromJson(Map<String, dynamic> json) =
      _$_VerifyOtpWithEmailPayload.fromJson;

  @override
  String get email;
  @override
  String get otp;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyOtpWithEmailPayloadCopyWith<_$_VerifyOtpWithEmailPayload>
      get copyWith => throw _privateConstructorUsedError;
}
