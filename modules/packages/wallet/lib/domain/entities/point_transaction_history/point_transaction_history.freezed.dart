// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointTransactionHistory _$PointTransactionHistoryFromJson(
    Map<String, dynamic> json) {
  return _PointTransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$PointTransactionHistory {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  PointTransactionHistoryType get transactionType =>
      throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointTransactionHistoryCopyWith<PointTransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointTransactionHistoryCopyWith<$Res> {
  factory $PointTransactionHistoryCopyWith(PointTransactionHistory value,
          $Res Function(PointTransactionHistory) then) =
      _$PointTransactionHistoryCopyWithImpl<$Res, PointTransactionHistory>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String value,
      PointTransactionHistoryType transactionType,
      String content,
      DateTime? createdAt});
}

/// @nodoc
class _$PointTransactionHistoryCopyWithImpl<$Res,
        $Val extends PointTransactionHistory>
    implements $PointTransactionHistoryCopyWith<$Res> {
  _$PointTransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as PointTransactionHistoryType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointTransactionHistoryImplCopyWith<$Res>
    implements $PointTransactionHistoryCopyWith<$Res> {
  factory _$$PointTransactionHistoryImplCopyWith(
          _$PointTransactionHistoryImpl value,
          $Res Function(_$PointTransactionHistoryImpl) then) =
      __$$PointTransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String value,
      PointTransactionHistoryType transactionType,
      String content,
      DateTime? createdAt});
}

/// @nodoc
class __$$PointTransactionHistoryImplCopyWithImpl<$Res>
    extends _$PointTransactionHistoryCopyWithImpl<$Res,
        _$PointTransactionHistoryImpl>
    implements _$$PointTransactionHistoryImplCopyWith<$Res> {
  __$$PointTransactionHistoryImplCopyWithImpl(
      _$PointTransactionHistoryImpl _value,
      $Res Function(_$PointTransactionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$PointTransactionHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as PointTransactionHistoryType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointTransactionHistoryImpl implements _PointTransactionHistory {
  const _$PointTransactionHistoryImpl(
      {this.id = 0,
      this.userId = 0,
      this.value = '',
      this.transactionType = PointTransactionHistoryType.rechargePoint,
      this.content = '',
      this.createdAt});

  factory _$PointTransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointTransactionHistoryImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final PointTransactionHistoryType transactionType;
  @override
  @JsonKey()
  final String content;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PointTransactionHistory(id: $id, userId: $userId, value: $value, transactionType: $transactionType, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointTransactionHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, value, transactionType, content, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointTransactionHistoryImplCopyWith<_$PointTransactionHistoryImpl>
      get copyWith => __$$PointTransactionHistoryImplCopyWithImpl<
          _$PointTransactionHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointTransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _PointTransactionHistory implements PointTransactionHistory {
  const factory _PointTransactionHistory(
      {final int id,
      final int userId,
      final String value,
      final PointTransactionHistoryType transactionType,
      final String content,
      final DateTime? createdAt}) = _$PointTransactionHistoryImpl;

  factory _PointTransactionHistory.fromJson(Map<String, dynamic> json) =
      _$PointTransactionHistoryImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get value;
  @override
  PointTransactionHistoryType get transactionType;
  @override
  String get content;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PointTransactionHistoryImplCopyWith<_$PointTransactionHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
