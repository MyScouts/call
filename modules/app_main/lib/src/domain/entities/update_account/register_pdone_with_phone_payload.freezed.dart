// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_pdone_with_phone_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterPDoneAccountPayload _$RegisterPDoneAccountPayloadFromJson(
    Map<String, dynamic> json) {
  return _RegisterPDoneAccountPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterPDoneAccountPayload {
  @JsonKey(includeIfNull: false)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phoneCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', includeIfNull: false)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPDoneAccountPayloadCopyWith<RegisterPDoneAccountPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPDoneAccountPayloadCopyWith<$Res> {
  factory $RegisterPDoneAccountPayloadCopyWith(
          RegisterPDoneAccountPayload value,
          $Res Function(RegisterPDoneAccountPayload) then) =
      _$RegisterPDoneAccountPayloadCopyWithImpl<$Res,
          RegisterPDoneAccountPayload>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? phoneNumber,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(name: 'country_id', includeIfNull: false) int? countryId,
      @JsonKey(includeIfNull: false) String? email});
}

/// @nodoc
class _$RegisterPDoneAccountPayloadCopyWithImpl<$Res,
        $Val extends RegisterPDoneAccountPayload>
    implements $RegisterPDoneAccountPayloadCopyWith<$Res> {
  _$RegisterPDoneAccountPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? phoneCode = freezed,
    Object? countryId = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPDoneAccountPayloadImplCopyWith<$Res>
    implements $RegisterPDoneAccountPayloadCopyWith<$Res> {
  factory _$$RegisterPDoneAccountPayloadImplCopyWith(
          _$RegisterPDoneAccountPayloadImpl value,
          $Res Function(_$RegisterPDoneAccountPayloadImpl) then) =
      __$$RegisterPDoneAccountPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? phoneNumber,
      @JsonKey(includeIfNull: false) String? phoneCode,
      @JsonKey(name: 'country_id', includeIfNull: false) int? countryId,
      @JsonKey(includeIfNull: false) String? email});
}

/// @nodoc
class __$$RegisterPDoneAccountPayloadImplCopyWithImpl<$Res>
    extends _$RegisterPDoneAccountPayloadCopyWithImpl<$Res,
        _$RegisterPDoneAccountPayloadImpl>
    implements _$$RegisterPDoneAccountPayloadImplCopyWith<$Res> {
  __$$RegisterPDoneAccountPayloadImplCopyWithImpl(
      _$RegisterPDoneAccountPayloadImpl _value,
      $Res Function(_$RegisterPDoneAccountPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? phoneCode = freezed,
    Object? countryId = freezed,
    Object? email = freezed,
  }) {
    return _then(_$RegisterPDoneAccountPayloadImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPDoneAccountPayloadImpl
    implements _RegisterPDoneAccountPayload {
  const _$RegisterPDoneAccountPayloadImpl(
      {@JsonKey(includeIfNull: false) this.phoneNumber,
      @JsonKey(includeIfNull: false) this.phoneCode,
      @JsonKey(name: 'country_id', includeIfNull: false) this.countryId,
      @JsonKey(includeIfNull: false) this.email});

  factory _$RegisterPDoneAccountPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegisterPDoneAccountPayloadImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? phoneNumber;
  @override
  @JsonKey(includeIfNull: false)
  final String? phoneCode;
  @override
  @JsonKey(name: 'country_id', includeIfNull: false)
  final int? countryId;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;

  @override
  String toString() {
    return 'RegisterPDoneAccountPayload(phoneNumber: $phoneNumber, phoneCode: $phoneCode, countryId: $countryId, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPDoneAccountPayloadImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, phoneCode, countryId, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPDoneAccountPayloadImplCopyWith<_$RegisterPDoneAccountPayloadImpl>
      get copyWith => __$$RegisterPDoneAccountPayloadImplCopyWithImpl<
          _$RegisterPDoneAccountPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPDoneAccountPayloadImplToJson(
      this,
    );
  }
}

abstract class _RegisterPDoneAccountPayload
    implements RegisterPDoneAccountPayload {
  const factory _RegisterPDoneAccountPayload(
      {@JsonKey(includeIfNull: false) final String? phoneNumber,
      @JsonKey(includeIfNull: false) final String? phoneCode,
      @JsonKey(name: 'country_id', includeIfNull: false) final int? countryId,
      @JsonKey(includeIfNull: false)
      final String? email}) = _$RegisterPDoneAccountPayloadImpl;

  factory _RegisterPDoneAccountPayload.fromJson(Map<String, dynamic> json) =
      _$RegisterPDoneAccountPayloadImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get phoneNumber;
  @override
  @JsonKey(includeIfNull: false)
  String? get phoneCode;
  @override
  @JsonKey(name: 'country_id', includeIfNull: false)
  int? get countryId;
  @override
  @JsonKey(includeIfNull: false)
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$RegisterPDoneAccountPayloadImplCopyWith<_$RegisterPDoneAccountPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
