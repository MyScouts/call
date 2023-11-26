// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diamond_transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiamondTransactionHistory _$DiamondTransactionHistoryFromJson(
    Map<String, dynamic> json) {
  return _DiamondTransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$DiamondTransactionHistory {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  DiamondTransactionHistoryType get transactionType =>
      throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DiamondTransactionHistoryStatus get status =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiamondTransactionHistoryCopyWith<DiamondTransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiamondTransactionHistoryCopyWith<$Res> {
  factory $DiamondTransactionHistoryCopyWith(DiamondTransactionHistory value,
          $Res Function(DiamondTransactionHistory) then) =
      _$DiamondTransactionHistoryCopyWithImpl<$Res, DiamondTransactionHistory>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String value,
      DiamondTransactionHistoryType transactionType,
      String content,
      DiamondTransactionHistoryStatus status,
      DateTime? createdAt});
}

/// @nodoc
class _$DiamondTransactionHistoryCopyWithImpl<$Res,
        $Val extends DiamondTransactionHistory>
    implements $DiamondTransactionHistoryCopyWith<$Res> {
  _$DiamondTransactionHistoryCopyWithImpl(this._value, this._then);

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
    Object? status = null,
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
              as DiamondTransactionHistoryType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiamondTransactionHistoryStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiamondTransactionHistoryImplCopyWith<$Res>
    implements $DiamondTransactionHistoryCopyWith<$Res> {
  factory _$$DiamondTransactionHistoryImplCopyWith(
          _$DiamondTransactionHistoryImpl value,
          $Res Function(_$DiamondTransactionHistoryImpl) then) =
      __$$DiamondTransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String value,
      DiamondTransactionHistoryType transactionType,
      String content,
      DiamondTransactionHistoryStatus status,
      DateTime? createdAt});
}

/// @nodoc
class __$$DiamondTransactionHistoryImplCopyWithImpl<$Res>
    extends _$DiamondTransactionHistoryCopyWithImpl<$Res,
        _$DiamondTransactionHistoryImpl>
    implements _$$DiamondTransactionHistoryImplCopyWith<$Res> {
  __$$DiamondTransactionHistoryImplCopyWithImpl(
      _$DiamondTransactionHistoryImpl _value,
      $Res Function(_$DiamondTransactionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$DiamondTransactionHistoryImpl(
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
              as DiamondTransactionHistoryType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiamondTransactionHistoryStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiamondTransactionHistoryImpl implements _DiamondTransactionHistory {
  const _$DiamondTransactionHistoryImpl(
      {this.id = 0,
      this.userId = 0,
      this.value = '',
      this.transactionType = DiamondTransactionHistoryType.exchangeDiamondToVnd,
      this.content = '',
      this.status = DiamondTransactionHistoryStatus.success,
      this.createdAt});

  factory _$DiamondTransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiamondTransactionHistoryImplFromJson(json);

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
  final DiamondTransactionHistoryType transactionType;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final DiamondTransactionHistoryStatus status;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DiamondTransactionHistory(id: $id, userId: $userId, value: $value, transactionType: $transactionType, content: $content, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiamondTransactionHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, value,
      transactionType, content, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiamondTransactionHistoryImplCopyWith<_$DiamondTransactionHistoryImpl>
      get copyWith => __$$DiamondTransactionHistoryImplCopyWithImpl<
          _$DiamondTransactionHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiamondTransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _DiamondTransactionHistory implements DiamondTransactionHistory {
  const factory _DiamondTransactionHistory(
      {final int id,
      final int userId,
      final String value,
      final DiamondTransactionHistoryType transactionType,
      final String content,
      final DiamondTransactionHistoryStatus status,
      final DateTime? createdAt}) = _$DiamondTransactionHistoryImpl;

  factory _DiamondTransactionHistory.fromJson(Map<String, dynamic> json) =
      _$DiamondTransactionHistoryImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get value;
  @override
  DiamondTransactionHistoryType get transactionType;
  @override
  String get content;
  @override
  DiamondTransactionHistoryStatus get status;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DiamondTransactionHistoryImplCopyWith<_$DiamondTransactionHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
