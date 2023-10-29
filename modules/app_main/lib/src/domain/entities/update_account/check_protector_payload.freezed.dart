// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_protector_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckProtectorPayload _$CheckProtectorPayloadFromJson(
    Map<String, dynamic> json) {
  return _CheckProtectorPayload.fromJson(json);
}

/// @nodoc
mixin _$CheckProtectorPayload {
  String? get protectorEmailPhone => throw _privateConstructorUsedError;
  String? get protectorIdentityNumber => throw _privateConstructorUsedError;
  String? get protectorPDoneId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckProtectorPayloadCopyWith<CheckProtectorPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckProtectorPayloadCopyWith<$Res> {
  factory $CheckProtectorPayloadCopyWith(CheckProtectorPayload value,
          $Res Function(CheckProtectorPayload) then) =
      _$CheckProtectorPayloadCopyWithImpl<$Res, CheckProtectorPayload>;
  @useResult
  $Res call(
      {String? protectorEmailPhone,
      String? protectorIdentityNumber,
      String? protectorPDoneId});
}

/// @nodoc
class _$CheckProtectorPayloadCopyWithImpl<$Res,
        $Val extends CheckProtectorPayload>
    implements $CheckProtectorPayloadCopyWith<$Res> {
  _$CheckProtectorPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectorEmailPhone = freezed,
    Object? protectorIdentityNumber = freezed,
    Object? protectorPDoneId = freezed,
  }) {
    return _then(_value.copyWith(
      protectorEmailPhone: freezed == protectorEmailPhone
          ? _value.protectorEmailPhone
          : protectorEmailPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      protectorIdentityNumber: freezed == protectorIdentityNumber
          ? _value.protectorIdentityNumber
          : protectorIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      protectorPDoneId: freezed == protectorPDoneId
          ? _value.protectorPDoneId
          : protectorPDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckProtectorPayloadCopyWith<$Res>
    implements $CheckProtectorPayloadCopyWith<$Res> {
  factory _$$_CheckProtectorPayloadCopyWith(_$_CheckProtectorPayload value,
          $Res Function(_$_CheckProtectorPayload) then) =
      __$$_CheckProtectorPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? protectorEmailPhone,
      String? protectorIdentityNumber,
      String? protectorPDoneId});
}

/// @nodoc
class __$$_CheckProtectorPayloadCopyWithImpl<$Res>
    extends _$CheckProtectorPayloadCopyWithImpl<$Res, _$_CheckProtectorPayload>
    implements _$$_CheckProtectorPayloadCopyWith<$Res> {
  __$$_CheckProtectorPayloadCopyWithImpl(_$_CheckProtectorPayload _value,
      $Res Function(_$_CheckProtectorPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectorEmailPhone = freezed,
    Object? protectorIdentityNumber = freezed,
    Object? protectorPDoneId = freezed,
  }) {
    return _then(_$_CheckProtectorPayload(
      protectorEmailPhone: freezed == protectorEmailPhone
          ? _value.protectorEmailPhone
          : protectorEmailPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      protectorIdentityNumber: freezed == protectorIdentityNumber
          ? _value.protectorIdentityNumber
          : protectorIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      protectorPDoneId: freezed == protectorPDoneId
          ? _value.protectorPDoneId
          : protectorPDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckProtectorPayload implements _CheckProtectorPayload {
  const _$_CheckProtectorPayload(
      {this.protectorEmailPhone,
      this.protectorIdentityNumber,
      this.protectorPDoneId});

  factory _$_CheckProtectorPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CheckProtectorPayloadFromJson(json);

  @override
  final String? protectorEmailPhone;
  @override
  final String? protectorIdentityNumber;
  @override
  final String? protectorPDoneId;

  @override
  String toString() {
    return 'CheckProtectorPayload(protectorEmailPhone: $protectorEmailPhone, protectorIdentityNumber: $protectorIdentityNumber, protectorPDoneId: $protectorPDoneId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckProtectorPayload &&
            (identical(other.protectorEmailPhone, protectorEmailPhone) ||
                other.protectorEmailPhone == protectorEmailPhone) &&
            (identical(
                    other.protectorIdentityNumber, protectorIdentityNumber) ||
                other.protectorIdentityNumber == protectorIdentityNumber) &&
            (identical(other.protectorPDoneId, protectorPDoneId) ||
                other.protectorPDoneId == protectorPDoneId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, protectorEmailPhone,
      protectorIdentityNumber, protectorPDoneId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckProtectorPayloadCopyWith<_$_CheckProtectorPayload> get copyWith =>
      __$$_CheckProtectorPayloadCopyWithImpl<_$_CheckProtectorPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckProtectorPayloadToJson(
      this,
    );
  }
}

abstract class _CheckProtectorPayload implements CheckProtectorPayload {
  const factory _CheckProtectorPayload(
      {final String? protectorEmailPhone,
      final String? protectorIdentityNumber,
      final String? protectorPDoneId}) = _$_CheckProtectorPayload;

  factory _CheckProtectorPayload.fromJson(Map<String, dynamic> json) =
      _$_CheckProtectorPayload.fromJson;

  @override
  String? get protectorEmailPhone;
  @override
  String? get protectorIdentityNumber;
  @override
  String? get protectorPDoneId;
  @override
  @JsonKey(ignore: true)
  _$$_CheckProtectorPayloadCopyWith<_$_CheckProtectorPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
