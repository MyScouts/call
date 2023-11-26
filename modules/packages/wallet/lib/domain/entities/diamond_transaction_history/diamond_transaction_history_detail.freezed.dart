// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diamond_transaction_history_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiamondTransactionHistoryDetail _$DiamondTransactionHistoryDetailFromJson(
    Map<String, dynamic> json) {
  return _DiamondTransactionHistoryDetail.fromJson(json);
}

/// @nodoc
mixin _$DiamondTransactionHistoryDetail {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get senderPDoneId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  DiamondTransactionHistoryType get transactionType =>
      throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DiamondTransactionHistoryStatus get status =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  MetaData? get metaData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiamondTransactionHistoryDetailCopyWith<DiamondTransactionHistoryDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiamondTransactionHistoryDetailCopyWith<$Res> {
  factory $DiamondTransactionHistoryDetailCopyWith(
          DiamondTransactionHistoryDetail value,
          $Res Function(DiamondTransactionHistoryDetail) then) =
      _$DiamondTransactionHistoryDetailCopyWithImpl<$Res,
          DiamondTransactionHistoryDetail>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String code,
      String senderName,
      String senderPDoneId,
      String roomId,
      String value,
      DiamondTransactionHistoryType transactionType,
      String content,
      DiamondTransactionHistoryStatus status,
      DateTime? createdAt,
      MetaData? metaData});

  $MetaDataCopyWith<$Res>? get metaData;
}

/// @nodoc
class _$DiamondTransactionHistoryDetailCopyWithImpl<$Res,
        $Val extends DiamondTransactionHistoryDetail>
    implements $DiamondTransactionHistoryDetailCopyWith<$Res> {
  _$DiamondTransactionHistoryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? code = null,
    Object? senderName = null,
    Object? senderPDoneId = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderPDoneId: null == senderPDoneId
          ? _value.senderPDoneId
          : senderPDoneId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DiamondTransactionHistoryDetailImplCopyWith<$Res>
    implements $DiamondTransactionHistoryDetailCopyWith<$Res> {
  factory _$$DiamondTransactionHistoryDetailImplCopyWith(
          _$DiamondTransactionHistoryDetailImpl value,
          $Res Function(_$DiamondTransactionHistoryDetailImpl) then) =
      __$$DiamondTransactionHistoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String code,
      String senderName,
      String senderPDoneId,
      String roomId,
      String value,
      DiamondTransactionHistoryType transactionType,
      String content,
      DiamondTransactionHistoryStatus status,
      DateTime? createdAt,
      MetaData? metaData});

  @override
  $MetaDataCopyWith<$Res>? get metaData;
}

/// @nodoc
class __$$DiamondTransactionHistoryDetailImplCopyWithImpl<$Res>
    extends _$DiamondTransactionHistoryDetailCopyWithImpl<$Res,
        _$DiamondTransactionHistoryDetailImpl>
    implements _$$DiamondTransactionHistoryDetailImplCopyWith<$Res> {
  __$$DiamondTransactionHistoryDetailImplCopyWithImpl(
      _$DiamondTransactionHistoryDetailImpl _value,
      $Res Function(_$DiamondTransactionHistoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? code = null,
    Object? senderName = null,
    Object? senderPDoneId = null,
    Object? roomId = null,
    Object? value = null,
    Object? transactionType = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? metaData = freezed,
  }) {
    return _then(_$DiamondTransactionHistoryDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderPDoneId: null == senderPDoneId
          ? _value.senderPDoneId
          : senderPDoneId // ignore: cast_nullable_to_non_nullable
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
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiamondTransactionHistoryDetailImpl
    implements _DiamondTransactionHistoryDetail {
  const _$DiamondTransactionHistoryDetailImpl(
      {this.id = 0,
      this.userId = 0,
      this.code = '',
      this.senderName = '',
      this.senderPDoneId = '',
      this.roomId = '',
      this.value = '',
      this.transactionType = DiamondTransactionHistoryType.exchangeDiamondToVnd,
      this.content = '',
      this.status = DiamondTransactionHistoryStatus.success,
      this.createdAt,
      this.metaData});

  factory _$DiamondTransactionHistoryDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DiamondTransactionHistoryDetailImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String senderName;
  @override
  @JsonKey()
  final String senderPDoneId;
  @override
  @JsonKey()
  final String roomId;
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
  final MetaData? metaData;

  @override
  String toString() {
    return 'DiamondTransactionHistoryDetail(id: $id, userId: $userId, code: $code, senderName: $senderName, senderPDoneId: $senderPDoneId, roomId: $roomId, value: $value, transactionType: $transactionType, content: $content, status: $status, createdAt: $createdAt, metaData: $metaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiamondTransactionHistoryDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderPDoneId, senderPDoneId) ||
                other.senderPDoneId == senderPDoneId) &&
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
      userId,
      code,
      senderName,
      senderPDoneId,
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
  _$$DiamondTransactionHistoryDetailImplCopyWith<
          _$DiamondTransactionHistoryDetailImpl>
      get copyWith => __$$DiamondTransactionHistoryDetailImplCopyWithImpl<
          _$DiamondTransactionHistoryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiamondTransactionHistoryDetailImplToJson(
      this,
    );
  }
}

abstract class _DiamondTransactionHistoryDetail
    implements DiamondTransactionHistoryDetail {
  const factory _DiamondTransactionHistoryDetail(
      {final int id,
      final int userId,
      final String code,
      final String senderName,
      final String senderPDoneId,
      final String roomId,
      final String value,
      final DiamondTransactionHistoryType transactionType,
      final String content,
      final DiamondTransactionHistoryStatus status,
      final DateTime? createdAt,
      final MetaData? metaData}) = _$DiamondTransactionHistoryDetailImpl;

  factory _DiamondTransactionHistoryDetail.fromJson(Map<String, dynamic> json) =
      _$DiamondTransactionHistoryDetailImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get code;
  @override
  String get senderName;
  @override
  String get senderPDoneId;
  @override
  String get roomId;
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
  MetaData? get metaData;
  @override
  @JsonKey(ignore: true)
  _$$DiamondTransactionHistoryDetailImplCopyWith<
          _$DiamondTransactionHistoryDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
