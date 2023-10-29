// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Kyc _$KycFromJson(Map<String, dynamic> json) {
  return _Kyc.fromJson(json);
}

/// @nodoc
mixin _$Kyc {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get kycPassport => throw _privateConstructorUsedError;
  String? get kycIdentityFront => throw _privateConstructorUsedError;
  String? get kycIdentityBack => throw _privateConstructorUsedError;
  String? get portrait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycCopyWith<Kyc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycCopyWith<$Res> {
  factory $KycCopyWith(Kyc value, $Res Function(Kyc) then) =
      _$KycCopyWithImpl<$Res, Kyc>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? status,
      String? kycPassport,
      String? kycIdentityFront,
      String? kycIdentityBack,
      String? portrait});
}

/// @nodoc
class _$KycCopyWithImpl<$Res, $Val extends Kyc> implements $KycCopyWith<$Res> {
  _$KycCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? kycPassport = freezed,
    Object? kycIdentityFront = freezed,
    Object? kycIdentityBack = freezed,
    Object? portrait = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
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
      portrait: freezed == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KycCopyWith<$Res> implements $KycCopyWith<$Res> {
  factory _$$_KycCopyWith(_$_Kyc value, $Res Function(_$_Kyc) then) =
      __$$_KycCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? status,
      String? kycPassport,
      String? kycIdentityFront,
      String? kycIdentityBack,
      String? portrait});
}

/// @nodoc
class __$$_KycCopyWithImpl<$Res> extends _$KycCopyWithImpl<$Res, _$_Kyc>
    implements _$$_KycCopyWith<$Res> {
  __$$_KycCopyWithImpl(_$_Kyc _value, $Res Function(_$_Kyc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? kycPassport = freezed,
    Object? kycIdentityFront = freezed,
    Object? kycIdentityBack = freezed,
    Object? portrait = freezed,
  }) {
    return _then(_$_Kyc(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
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
      portrait: freezed == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Kyc implements _Kyc {
  const _$_Kyc(
      {this.id,
      this.userId,
      this.status,
      this.kycPassport,
      this.kycIdentityFront,
      this.kycIdentityBack,
      this.portrait});

  factory _$_Kyc.fromJson(Map<String, dynamic> json) => _$$_KycFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? status;
  @override
  final String? kycPassport;
  @override
  final String? kycIdentityFront;
  @override
  final String? kycIdentityBack;
  @override
  final String? portrait;

  @override
  String toString() {
    return 'Kyc(id: $id, userId: $userId, status: $status, kycPassport: $kycPassport, kycIdentityFront: $kycIdentityFront, kycIdentityBack: $kycIdentityBack, portrait: $portrait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Kyc &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
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
  int get hashCode => Object.hash(runtimeType, id, userId, status, kycPassport,
      kycIdentityFront, kycIdentityBack, portrait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KycCopyWith<_$_Kyc> get copyWith =>
      __$$_KycCopyWithImpl<_$_Kyc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KycToJson(
      this,
    );
  }
}

abstract class _Kyc implements Kyc {
  const factory _Kyc(
      {final int? id,
      final int? userId,
      final int? status,
      final String? kycPassport,
      final String? kycIdentityFront,
      final String? kycIdentityBack,
      final String? portrait}) = _$_Kyc;

  factory _Kyc.fromJson(Map<String, dynamic> json) = _$_Kyc.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  int? get status;
  @override
  String? get kycPassport;
  @override
  String? get kycIdentityFront;
  @override
  String? get kycIdentityBack;
  @override
  String? get portrait;
  @override
  @JsonKey(ignore: true)
  _$$_KycCopyWith<_$_Kyc> get copyWith => throw _privateConstructorUsedError;
}
