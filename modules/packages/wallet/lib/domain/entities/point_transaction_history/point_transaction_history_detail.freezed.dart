// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_transaction_history_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointTransactionHistoryDetail _$PointTransactionHistoryDetailFromJson(
    Map<String, dynamic> json) {
  return _PointTransactionHistoryDetail.fromJson(json);
}

/// @nodoc
mixin _$PointTransactionHistoryDetail {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get chargerName => throw _privateConstructorUsedError;
  String get chargerPDoneId => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get receiverPDoneId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  PointTransactionHistoryType get transactionType =>
      throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  TransactionHistoryStatus get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  MetaData? get metaData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointTransactionHistoryDetailCopyWith<PointTransactionHistoryDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointTransactionHistoryDetailCopyWith<$Res> {
  factory $PointTransactionHistoryDetailCopyWith(
          PointTransactionHistoryDetail value,
          $Res Function(PointTransactionHistoryDetail) then) =
      _$PointTransactionHistoryDetailCopyWithImpl<$Res,
          PointTransactionHistoryDetail>;
  @useResult
  $Res call(
      {int id,
      String code,
      int userId,
      String chargerName,
      String chargerPDoneId,
      String receiverName,
      String receiverPDoneId,
      String roomId,
      String value,
      PointTransactionHistoryType transactionType,
      String content,
      TransactionHistoryStatus status,
      DateTime? createdAt,
      MetaData? metaData});

  $MetaDataCopyWith<$Res>? get metaData;
}

/// @nodoc
class _$PointTransactionHistoryDetailCopyWithImpl<$Res,
        $Val extends PointTransactionHistoryDetail>
    implements $PointTransactionHistoryDetailCopyWith<$Res> {
  _$PointTransactionHistoryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? userId = null,
    Object? chargerName = null,
    Object? chargerPDoneId = null,
    Object? receiverName = null,
    Object? receiverPDoneId = null,
    Object? roomId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? metaData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      chargerName: null == chargerName
          ? _value.chargerName
          : chargerName // ignore: cast_nullable_to_non_nullable
              as String,
      chargerPDoneId: null == chargerPDoneId
          ? _value.chargerPDoneId
          : chargerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPDoneId: null == receiverPDoneId
          ? _value.receiverPDoneId
          : receiverPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDataCopyWith<$Res>? get metaData {
    if (_value.metaData == null) {
      return null;
    }

    return $MetaDataCopyWith<$Res>(_value.metaData!, (value) {
      return _then(_value.copyWith(metaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointTransactionHistoryDetailImplCopyWith<$Res>
    implements $PointTransactionHistoryDetailCopyWith<$Res> {
  factory _$$PointTransactionHistoryDetailImplCopyWith(
          _$PointTransactionHistoryDetailImpl value,
          $Res Function(_$PointTransactionHistoryDetailImpl) then) =
      __$$PointTransactionHistoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      int userId,
      String chargerName,
      String chargerPDoneId,
      String receiverName,
      String receiverPDoneId,
      String roomId,
      String value,
      PointTransactionHistoryType transactionType,
      String content,
      TransactionHistoryStatus status,
      DateTime? createdAt,
      MetaData? metaData});

  @override
  $MetaDataCopyWith<$Res>? get metaData;
}

/// @nodoc
class __$$PointTransactionHistoryDetailImplCopyWithImpl<$Res>
    extends _$PointTransactionHistoryDetailCopyWithImpl<$Res,
        _$PointTransactionHistoryDetailImpl>
    implements _$$PointTransactionHistoryDetailImplCopyWith<$Res> {
  __$$PointTransactionHistoryDetailImplCopyWithImpl(
      _$PointTransactionHistoryDetailImpl _value,
      $Res Function(_$PointTransactionHistoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? userId = null,
    Object? chargerName = null,
    Object? chargerPDoneId = null,
    Object? receiverName = null,
    Object? receiverPDoneId = null,
    Object? roomId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? metaData = freezed,
  }) {
    return _then(_$PointTransactionHistoryDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      chargerName: null == chargerName
          ? _value.chargerName
          : chargerName // ignore: cast_nullable_to_non_nullable
              as String,
      chargerPDoneId: null == chargerPDoneId
          ? _value.chargerPDoneId
          : chargerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPDoneId: null == receiverPDoneId
          ? _value.receiverPDoneId
          : receiverPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointTransactionHistoryDetailImpl
    implements _PointTransactionHistoryDetail {
  const _$PointTransactionHistoryDetailImpl(
      {this.id = 0,
      this.code = '',
      this.userId = 0,
      this.chargerName = '',
      this.chargerPDoneId = '',
      this.receiverName = '',
      this.receiverPDoneId = '',
      this.roomId = '',
      this.value = '',
      this.transactionType = PointTransactionHistoryType.rechargePoint,
      this.content = '',
      this.status = TransactionHistoryStatus.success,
      this.createdAt,
      this.metaData});

  factory _$PointTransactionHistoryDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PointTransactionHistoryDetailImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String chargerName;
  @override
  @JsonKey()
  final String chargerPDoneId;
  @override
  @JsonKey()
  final String receiverName;
  @override
  @JsonKey()
  final String receiverPDoneId;
  @override
  @JsonKey()
  final String roomId;
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
  @JsonKey()
  final TransactionHistoryStatus status;
  @override
  final DateTime? createdAt;
  @override
  final MetaData? metaData;

  @override
  String toString() {
    return 'PointTransactionHistoryDetail(id: $id, code: $code, userId: $userId, chargerName: $chargerName, chargerPDoneId: $chargerPDoneId, receiverName: $receiverName, receiverPDoneId: $receiverPDoneId, roomId: $roomId, value: $value, transactionType: $transactionType, content: $content, status: $status, createdAt: $createdAt, metaData: $metaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointTransactionHistoryDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chargerName, chargerName) ||
                other.chargerName == chargerName) &&
            (identical(other.chargerPDoneId, chargerPDoneId) ||
                other.chargerPDoneId == chargerPDoneId) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverPDoneId, receiverPDoneId) ||
                other.receiverPDoneId == receiverPDoneId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.metaData, metaData) ||
                other.metaData == metaData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      userId,
      chargerName,
      chargerPDoneId,
      receiverName,
      receiverPDoneId,
      roomId,
      value,
      transactionType,
      content,
      status,
      createdAt,
      metaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointTransactionHistoryDetailImplCopyWith<
          _$PointTransactionHistoryDetailImpl>
      get copyWith => __$$PointTransactionHistoryDetailImplCopyWithImpl<
          _$PointTransactionHistoryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointTransactionHistoryDetailImplToJson(
      this,
    );
  }
}

abstract class _PointTransactionHistoryDetail
    implements PointTransactionHistoryDetail {
  const factory _PointTransactionHistoryDetail(
      {final int id,
      final String code,
      final int userId,
      final String chargerName,
      final String chargerPDoneId,
      final String receiverName,
      final String receiverPDoneId,
      final String roomId,
      final String value,
      final PointTransactionHistoryType transactionType,
      final String content,
      final TransactionHistoryStatus status,
      final DateTime? createdAt,
      final MetaData? metaData}) = _$PointTransactionHistoryDetailImpl;

  factory _PointTransactionHistoryDetail.fromJson(Map<String, dynamic> json) =
      _$PointTransactionHistoryDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  int get userId;
  @override
  String get chargerName;
  @override
  String get chargerPDoneId;
  @override
  String get receiverName;
  @override
  String get receiverPDoneId;
  @override
  String get roomId;
  @override
  String get value;
  @override
  PointTransactionHistoryType get transactionType;
  @override
  String get content;
  @override
  TransactionHistoryStatus get status;
  @override
  DateTime? get createdAt;
  @override
  MetaData? get metaData;
  @override
  @JsonKey(ignore: true)
  _$$PointTransactionHistoryDetailImplCopyWith<
          _$PointTransactionHistoryDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
