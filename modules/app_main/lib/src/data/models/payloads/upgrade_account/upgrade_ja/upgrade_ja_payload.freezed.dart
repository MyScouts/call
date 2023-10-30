// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upgrade_ja_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpgradeJAPayload _$UpgradeJAPayloadFromJson(Map<String, dynamic> json) {
  return _UpgradeJAPayload.fromJson(json);
}

/// @nodoc
mixin _$UpgradeJAPayload {
  String? get teamId => throw _privateConstructorUsedError;
  String? get bankHolder => throw _privateConstructorUsedError;
  String? get bankNumber => throw _privateConstructorUsedError;
  int? get bankId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpgradeJAPayloadCopyWith<UpgradeJAPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpgradeJAPayloadCopyWith<$Res> {
  factory $UpgradeJAPayloadCopyWith(
          UpgradeJAPayload value, $Res Function(UpgradeJAPayload) then) =
      _$UpgradeJAPayloadCopyWithImpl<$Res, UpgradeJAPayload>;
  @useResult
  $Res call(
      {String? teamId, String? bankHolder, String? bankNumber, int? bankId});
}

/// @nodoc
class _$UpgradeJAPayloadCopyWithImpl<$Res, $Val extends UpgradeJAPayload>
    implements $UpgradeJAPayloadCopyWith<$Res> {
  _$UpgradeJAPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = freezed,
    Object? bankHolder = freezed,
    Object? bankNumber = freezed,
    Object? bankId = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankHolder: freezed == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String?,
      bankNumber: freezed == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpgradeJAPayloadImplCopyWith<$Res>
    implements $UpgradeJAPayloadCopyWith<$Res> {
  factory _$$UpgradeJAPayloadImplCopyWith(_$UpgradeJAPayloadImpl value,
          $Res Function(_$UpgradeJAPayloadImpl) then) =
      __$$UpgradeJAPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? teamId, String? bankHolder, String? bankNumber, int? bankId});
}

/// @nodoc
class __$$UpgradeJAPayloadImplCopyWithImpl<$Res>
    extends _$UpgradeJAPayloadCopyWithImpl<$Res, _$UpgradeJAPayloadImpl>
    implements _$$UpgradeJAPayloadImplCopyWith<$Res> {
  __$$UpgradeJAPayloadImplCopyWithImpl(_$UpgradeJAPayloadImpl _value,
      $Res Function(_$UpgradeJAPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = freezed,
    Object? bankHolder = freezed,
    Object? bankNumber = freezed,
    Object? bankId = freezed,
  }) {
    return _then(_$UpgradeJAPayloadImpl(
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankHolder: freezed == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String?,
      bankNumber: freezed == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpgradeJAPayloadImpl implements _UpgradeJAPayload {
  const _$UpgradeJAPayloadImpl(
      {this.teamId, this.bankHolder, this.bankNumber, this.bankId});

  factory _$UpgradeJAPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpgradeJAPayloadImplFromJson(json);

  @override
  final String? teamId;
  @override
  final String? bankHolder;
  @override
  final String? bankNumber;
  @override
  final int? bankId;

  @override
  String toString() {
    return 'UpgradeJAPayload(teamId: $teamId, bankHolder: $bankHolder, bankNumber: $bankNumber, bankId: $bankId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpgradeJAPayloadImpl &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.bankHolder, bankHolder) ||
                other.bankHolder == bankHolder) &&
            (identical(other.bankNumber, bankNumber) ||
                other.bankNumber == bankNumber) &&
            (identical(other.bankId, bankId) || other.bankId == bankId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, teamId, bankHolder, bankNumber, bankId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpgradeJAPayloadImplCopyWith<_$UpgradeJAPayloadImpl> get copyWith =>
      __$$UpgradeJAPayloadImplCopyWithImpl<_$UpgradeJAPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpgradeJAPayloadImplToJson(
      this,
    );
  }
}

abstract class _UpgradeJAPayload implements UpgradeJAPayload {
  const factory _UpgradeJAPayload(
      {final String? teamId,
      final String? bankHolder,
      final String? bankNumber,
      final int? bankId}) = _$UpgradeJAPayloadImpl;

  factory _UpgradeJAPayload.fromJson(Map<String, dynamic> json) =
      _$UpgradeJAPayloadImpl.fromJson;

  @override
  String? get teamId;
  @override
  String? get bankHolder;
  @override
  String? get bankNumber;
  @override
  int? get bankId;
  @override
  @JsonKey(ignore: true)
  _$$UpgradeJAPayloadImplCopyWith<_$UpgradeJAPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
