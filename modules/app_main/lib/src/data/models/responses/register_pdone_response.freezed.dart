// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_pdone_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterPDoneResponse _$RegisterPDoneResponseFromJson(
    Map<String, dynamic> json) {
  return _RegisterPDoneResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterPDoneResponse {
  String get token => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPDoneResponseCopyWith<RegisterPDoneResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPDoneResponseCopyWith<$Res> {
  factory $RegisterPDoneResponseCopyWith(RegisterPDoneResponse value,
          $Res Function(RegisterPDoneResponse) then) =
      _$RegisterPDoneResponseCopyWithImpl<$Res, RegisterPDoneResponse>;
  @useResult
  $Res call({String token, String? phone, String? email, String? phoneCode});
}

/// @nodoc
class _$RegisterPDoneResponseCopyWithImpl<$Res,
        $Val extends RegisterPDoneResponse>
    implements $RegisterPDoneResponseCopyWith<$Res> {
  _$RegisterPDoneResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPDoneResponseImplCopyWith<$Res>
    implements $RegisterPDoneResponseCopyWith<$Res> {
  factory _$$RegisterPDoneResponseImplCopyWith(
          _$RegisterPDoneResponseImpl value,
          $Res Function(_$RegisterPDoneResponseImpl) then) =
      __$$RegisterPDoneResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String? phone, String? email, String? phoneCode});
}

/// @nodoc
class __$$RegisterPDoneResponseImplCopyWithImpl<$Res>
    extends _$RegisterPDoneResponseCopyWithImpl<$Res,
        _$RegisterPDoneResponseImpl>
    implements _$$RegisterPDoneResponseImplCopyWith<$Res> {
  __$$RegisterPDoneResponseImplCopyWithImpl(_$RegisterPDoneResponseImpl _value,
      $Res Function(_$RegisterPDoneResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(_$RegisterPDoneResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPDoneResponseImpl implements _RegisterPDoneResponse {
  const _$RegisterPDoneResponseImpl(
      {required this.token, this.phone, this.email, this.phoneCode});

  factory _$RegisterPDoneResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterPDoneResponseImplFromJson(json);

  @override
  final String token;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? phoneCode;

  @override
  String toString() {
    return 'RegisterPDoneResponse(token: $token, phone: $phone, email: $email, phoneCode: $phoneCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPDoneResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, phone, email, phoneCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPDoneResponseImplCopyWith<_$RegisterPDoneResponseImpl>
      get copyWith => __$$RegisterPDoneResponseImplCopyWithImpl<
          _$RegisterPDoneResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPDoneResponseImplToJson(
      this,
    );
  }
}

abstract class _RegisterPDoneResponse implements RegisterPDoneResponse {
  const factory _RegisterPDoneResponse(
      {required final String token,
      final String? phone,
      final String? email,
      final String? phoneCode}) = _$RegisterPDoneResponseImpl;

  factory _RegisterPDoneResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterPDoneResponseImpl.fromJson;

  @override
  String get token;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get phoneCode;
  @override
  @JsonKey(ignore: true)
  _$$RegisterPDoneResponseImplCopyWith<_$RegisterPDoneResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
