// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return _MetaData.fromJson(json);
}

/// @nodoc
mixin _$MetaData {
  int? get protectorOf => throw _privateConstructorUsedError;
  String? get pDoneId => throw _privateConstructorUsedError;
  int? get hourCount => throw _privateConstructorUsedError;
  int? get fromUserId => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataCopyWith<MetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataCopyWith<$Res> {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) then) =
      _$MetaDataCopyWithImpl<$Res, MetaData>;
  @useResult
  $Res call(
      {int? protectorOf,
      String? pDoneId,
      int? hourCount,
      int? fromUserId,
      String? role});
}

/// @nodoc
class _$MetaDataCopyWithImpl<$Res, $Val extends MetaData>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectorOf = freezed,
    Object? pDoneId = freezed,
    Object? hourCount = freezed,
    Object? fromUserId = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      protectorOf: freezed == protectorOf
          ? _value.protectorOf
          : protectorOf // ignore: cast_nullable_to_non_nullable
              as int?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      hourCount: freezed == hourCount
          ? _value.hourCount
          : hourCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataImplCopyWith<$Res>
    implements $MetaDataCopyWith<$Res> {
  factory _$$MetaDataImplCopyWith(
          _$MetaDataImpl value, $Res Function(_$MetaDataImpl) then) =
      __$$MetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? protectorOf,
      String? pDoneId,
      int? hourCount,
      int? fromUserId,
      String? role});
}

/// @nodoc
class __$$MetaDataImplCopyWithImpl<$Res>
    extends _$MetaDataCopyWithImpl<$Res, _$MetaDataImpl>
    implements _$$MetaDataImplCopyWith<$Res> {
  __$$MetaDataImplCopyWithImpl(
      _$MetaDataImpl _value, $Res Function(_$MetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectorOf = freezed,
    Object? pDoneId = freezed,
    Object? hourCount = freezed,
    Object? fromUserId = freezed,
    Object? role = freezed,
  }) {
    return _then(_$MetaDataImpl(
      protectorOf: freezed == protectorOf
          ? _value.protectorOf
          : protectorOf // ignore: cast_nullable_to_non_nullable
              as int?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      hourCount: freezed == hourCount
          ? _value.hourCount
          : hourCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataImpl implements _MetaData {
  const _$MetaDataImpl(
      {this.protectorOf,
      this.pDoneId,
      this.hourCount,
      this.fromUserId,
      this.role});

  factory _$MetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataImplFromJson(json);

  @override
  final int? protectorOf;
  @override
  final String? pDoneId;
  @override
  final int? hourCount;
  @override
  final int? fromUserId;
  @override
  final String? role;

  @override
  String toString() {
    return 'MetaData(protectorOf: $protectorOf, pDoneId: $pDoneId, hourCount: $hourCount, fromUserId: $fromUserId, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataImpl &&
            (identical(other.protectorOf, protectorOf) ||
                other.protectorOf == protectorOf) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.hourCount, hourCount) ||
                other.hourCount == hourCount) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, protectorOf, pDoneId, hourCount, fromUserId, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      __$$MetaDataImplCopyWithImpl<_$MetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataImplToJson(
      this,
    );
  }
}

abstract class _MetaData implements MetaData {
  const factory _MetaData(
      {final int? protectorOf,
      final String? pDoneId,
      final int? hourCount,
      final int? fromUserId,
      final String? role}) = _$MetaDataImpl;

  factory _MetaData.fromJson(Map<String, dynamic> json) =
      _$MetaDataImpl.fromJson;

  @override
  int? get protectorOf;
  @override
  String? get pDoneId;
  @override
  int? get hourCount;
  @override
  int? get fromUserId;
  @override
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
