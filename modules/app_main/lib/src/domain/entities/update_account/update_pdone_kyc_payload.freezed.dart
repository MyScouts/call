// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_pdone_kyc_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatePDoneKYCPayload _$UpdatePDoneKYCPayloadFromJson(
    Map<String, dynamic> json) {
  return _UpdatePDoneKYCPayload.fromJson(json);
}

/// @nodoc
mixin _$UpdatePDoneKYCPayload {
  String? get kycPassport => throw _privateConstructorUsedError;
  String? get kycIdentityFront => throw _privateConstructorUsedError;
  String? get kycIdentityBack => throw _privateConstructorUsedError;
  String get portrait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePDoneKYCPayloadCopyWith<UpdatePDoneKYCPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePDoneKYCPayloadCopyWith<$Res> {
  factory $UpdatePDoneKYCPayloadCopyWith(UpdatePDoneKYCPayload value,
          $Res Function(UpdatePDoneKYCPayload) then) =
      _$UpdatePDoneKYCPayloadCopyWithImpl<$Res, UpdatePDoneKYCPayload>;
  @useResult
  $Res call(
      {String? kycPassport,
      String? kycIdentityFront,
      String? kycIdentityBack,
      String portrait});
}

/// @nodoc
class _$UpdatePDoneKYCPayloadCopyWithImpl<$Res,
        $Val extends UpdatePDoneKYCPayload>
    implements $UpdatePDoneKYCPayloadCopyWith<$Res> {
  _$UpdatePDoneKYCPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycPassport = freezed,
    Object? kycIdentityFront = freezed,
    Object? kycIdentityBack = freezed,
    Object? portrait = null,
  }) {
    return _then(_value.copyWith(
      kycPassport: freezed == kycPassport
          ? _value.kycPassport
          : kycPassport // ignore: cast_nullable_to_non_nullable
              as String?,
      kycIdentityFront: freezed == kycIdentityFront
          ? _value.kycIdentityFront
          : kycIdentityFront // ignore: cast_nullable_to_non_nullable
              as String?,
      kycIdentityBack: freezed == kycIdentityBack
          ? _value.kycIdentityBack
          : kycIdentityBack // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatePDoneKYCPayloadCopyWith<$Res>
    implements $UpdatePDoneKYCPayloadCopyWith<$Res> {
  factory _$$_UpdatePDoneKYCPayloadCopyWith(_$_UpdatePDoneKYCPayload value,
          $Res Function(_$_UpdatePDoneKYCPayload) then) =
      __$$_UpdatePDoneKYCPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? kycPassport,
      String? kycIdentityFront,
      String? kycIdentityBack,
      String portrait});
}

/// @nodoc
class __$$_UpdatePDoneKYCPayloadCopyWithImpl<$Res>
    extends _$UpdatePDoneKYCPayloadCopyWithImpl<$Res, _$_UpdatePDoneKYCPayload>
    implements _$$_UpdatePDoneKYCPayloadCopyWith<$Res> {
  __$$_UpdatePDoneKYCPayloadCopyWithImpl(_$_UpdatePDoneKYCPayload _value,
      $Res Function(_$_UpdatePDoneKYCPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycPassport = freezed,
    Object? kycIdentityFront = freezed,
    Object? kycIdentityBack = freezed,
    Object? portrait = null,
  }) {
    return _then(_$_UpdatePDoneKYCPayload(
      kycPassport: freezed == kycPassport
          ? _value.kycPassport
          : kycPassport // ignore: cast_nullable_to_non_nullable
              as String?,
      kycIdentityFront: freezed == kycIdentityFront
          ? _value.kycIdentityFront
          : kycIdentityFront // ignore: cast_nullable_to_non_nullable
              as String?,
      kycIdentityBack: freezed == kycIdentityBack
          ? _value.kycIdentityBack
          : kycIdentityBack // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UpdatePDoneKYCPayload implements _UpdatePDoneKYCPayload {
  const _$_UpdatePDoneKYCPayload(
      {this.kycPassport,
      this.kycIdentityFront,
      this.kycIdentityBack,
      required this.portrait});

  factory _$_UpdatePDoneKYCPayload.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatePDoneKYCPayloadFromJson(json);

  @override
  final String? kycPassport;
  @override
  final String? kycIdentityFront;
  @override
  final String? kycIdentityBack;
  @override
  final String portrait;

  @override
  String toString() {
    return 'UpdatePDoneKYCPayload(kycPassport: $kycPassport, kycIdentityFront: $kycIdentityFront, kycIdentityBack: $kycIdentityBack, portrait: $portrait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePDoneKYCPayload &&
            (identical(other.kycPassport, kycPassport) ||
                other.kycPassport == kycPassport) &&
            (identical(other.kycIdentityFront, kycIdentityFront) ||
                other.kycIdentityFront == kycIdentityFront) &&
            (identical(other.kycIdentityBack, kycIdentityBack) ||
                other.kycIdentityBack == kycIdentityBack) &&
            (identical(other.portrait, portrait) ||
                other.portrait == portrait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, kycPassport, kycIdentityFront, kycIdentityBack, portrait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePDoneKYCPayloadCopyWith<_$_UpdatePDoneKYCPayload> get copyWith =>
      __$$_UpdatePDoneKYCPayloadCopyWithImpl<_$_UpdatePDoneKYCPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatePDoneKYCPayloadToJson(
      this,
    );
  }
}

abstract class _UpdatePDoneKYCPayload implements UpdatePDoneKYCPayload {
  const factory _UpdatePDoneKYCPayload(
      {final String? kycPassport,
      final String? kycIdentityFront,
      final String? kycIdentityBack,
      required final String portrait}) = _$_UpdatePDoneKYCPayload;

  factory _UpdatePDoneKYCPayload.fromJson(Map<String, dynamic> json) =
      _$_UpdatePDoneKYCPayload.fromJson;

  @override
  String? get kycPassport;
  @override
  String? get kycIdentityFront;
  @override
  String? get kycIdentityBack;
  @override
  String get portrait;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatePDoneKYCPayloadCopyWith<_$_UpdatePDoneKYCPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
