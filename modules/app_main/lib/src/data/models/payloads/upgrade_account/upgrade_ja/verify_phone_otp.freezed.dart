// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_phone_otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyPhoneOtpPayload _$VerifyPhoneOtpPayloadFromJson(
    Map<String, dynamic> json) {
  return _VerifyPhoneOtpPayload.fromJson(json);
}

/// @nodoc
mixin _$VerifyPhoneOtpPayload {
  String get token => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  String? get teamId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyPhoneOtpPayloadCopyWith<VerifyPhoneOtpPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPhoneOtpPayloadCopyWith<$Res> {
  factory $VerifyPhoneOtpPayloadCopyWith(VerifyPhoneOtpPayload value,
          $Res Function(VerifyPhoneOtpPayload) then) =
      _$VerifyPhoneOtpPayloadCopyWithImpl<$Res, VerifyPhoneOtpPayload>;
  @useResult
  $Res call({String token, String otp, String? teamId});
}

/// @nodoc
class _$VerifyPhoneOtpPayloadCopyWithImpl<$Res,
        $Val extends VerifyPhoneOtpPayload>
    implements $VerifyPhoneOtpPayloadCopyWith<$Res> {
  _$VerifyPhoneOtpPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? otp = null,
    Object? teamId = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPhoneOtpPayloadImplCopyWith<$Res>
    implements $VerifyPhoneOtpPayloadCopyWith<$Res> {
  factory _$$VerifyPhoneOtpPayloadImplCopyWith(
          _$VerifyPhoneOtpPayloadImpl value,
          $Res Function(_$VerifyPhoneOtpPayloadImpl) then) =
      __$$VerifyPhoneOtpPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String otp, String? teamId});
}

/// @nodoc
class __$$VerifyPhoneOtpPayloadImplCopyWithImpl<$Res>
    extends _$VerifyPhoneOtpPayloadCopyWithImpl<$Res,
        _$VerifyPhoneOtpPayloadImpl>
    implements _$$VerifyPhoneOtpPayloadImplCopyWith<$Res> {
  __$$VerifyPhoneOtpPayloadImplCopyWithImpl(_$VerifyPhoneOtpPayloadImpl _value,
      $Res Function(_$VerifyPhoneOtpPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? otp = null,
    Object? teamId = freezed,
  }) {
    return _then(_$VerifyPhoneOtpPayloadImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPhoneOtpPayloadImpl implements _VerifyPhoneOtpPayload {
  const _$VerifyPhoneOtpPayloadImpl(
      {required this.token, required this.otp, this.teamId});

  factory _$VerifyPhoneOtpPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyPhoneOtpPayloadImplFromJson(json);

  @override
  final String token;
  @override
  final String otp;
  @override
  final String? teamId;

  @override
  String toString() {
    return 'VerifyPhoneOtpPayload(token: $token, otp: $otp, teamId: $teamId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhoneOtpPayloadImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, otp, teamId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhoneOtpPayloadImplCopyWith<_$VerifyPhoneOtpPayloadImpl>
      get copyWith => __$$VerifyPhoneOtpPayloadImplCopyWithImpl<
          _$VerifyPhoneOtpPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPhoneOtpPayloadImplToJson(
      this,
    );
  }
}

abstract class _VerifyPhoneOtpPayload implements VerifyPhoneOtpPayload {
  const factory _VerifyPhoneOtpPayload(
      {required final String token,
      required final String otp,
      final String? teamId}) = _$VerifyPhoneOtpPayloadImpl;

  factory _VerifyPhoneOtpPayload.fromJson(Map<String, dynamic> json) =
      _$VerifyPhoneOtpPayloadImpl.fromJson;

  @override
  String get token;
  @override
  String get otp;
  @override
  String? get teamId;
  @override
  @JsonKey(ignore: true)
  _$$VerifyPhoneOtpPayloadImplCopyWith<_$VerifyPhoneOtpPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
