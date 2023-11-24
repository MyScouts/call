// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistoryDetail _$TransactionHistoryDetailFromJson(
    Map<String, dynamic> json) {
  return _TransactionHistoryDetail.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistoryDetail {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get receiverPDoneId => throw _privateConstructorUsedError;
  String get executorPDoneId => throw _privateConstructorUsedError;
  String get sellerPDoneId => throw _privateConstructorUsedError;
  String get buyerPDoneId => throw _privateConstructorUsedError;
  String get presenterPDoneId => throw _privateConstructorUsedError;
  String get representativePDoneId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get diamondValue => throw _privateConstructorUsedError;
  TransactionHistoryType get transactionType =>
      throw _privateConstructorUsedError;
  String get taxValue => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  TransactionHistoryVendor get fromSource => throw _privateConstructorUsedError;
  TransactionHistoryStatus get status => throw _privateConstructorUsedError;
  BankAccountTransactionHistory? get bankAccount =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryDetailCopyWith<TransactionHistoryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryDetailCopyWith<$Res> {
  factory $TransactionHistoryDetailCopyWith(TransactionHistoryDetail value,
          $Res Function(TransactionHistoryDetail) then) =
      _$TransactionHistoryDetailCopyWithImpl<$Res, TransactionHistoryDetail>;
  @useResult
  $Res call(
      {int id,
      String code,
      int userId,
      String receiverPDoneId,
      String executorPDoneId,
      String sellerPDoneId,
      String buyerPDoneId,
      String presenterPDoneId,
      String representativePDoneId,
      String value,
      String diamondValue,
      TransactionHistoryType transactionType,
      String taxValue,
      String content,
      TransactionHistoryVendor fromSource,
      TransactionHistoryStatus status,
      BankAccountTransactionHistory? bankAccount,
      DateTime? createdAt});

  $BankAccountTransactionHistoryCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class _$TransactionHistoryDetailCopyWithImpl<$Res,
        $Val extends TransactionHistoryDetail>
    implements $TransactionHistoryDetailCopyWith<$Res> {
  _$TransactionHistoryDetailCopyWithImpl(this._value, this._then);

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
    Object? receiverPDoneId = null,
    Object? executorPDoneId = null,
    Object? sellerPDoneId = null,
    Object? buyerPDoneId = null,
    Object? presenterPDoneId = null,
    Object? representativePDoneId = null,
    Object? value = null,
    Object? diamondValue = null,
    Object? transactionType = null,
    Object? taxValue = null,
    Object? content = null,
    Object? fromSource = null,
    Object? status = null,
    Object? bankAccount = freezed,
    Object? createdAt = freezed,
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
      receiverPDoneId: null == receiverPDoneId
          ? _value.receiverPDoneId
          : receiverPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      executorPDoneId: null == executorPDoneId
          ? _value.executorPDoneId
          : executorPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerPDoneId: null == sellerPDoneId
          ? _value.sellerPDoneId
          : sellerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerPDoneId: null == buyerPDoneId
          ? _value.buyerPDoneId
          : buyerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      presenterPDoneId: null == presenterPDoneId
          ? _value.presenterPDoneId
          : presenterPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      representativePDoneId: null == representativePDoneId
          ? _value.representativePDoneId
          : representativePDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      diamondValue: null == diamondValue
          ? _value.diamondValue
          : diamondValue // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryType,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      fromSource: null == fromSource
          ? _value.fromSource
          : fromSource // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryVendor,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryStatus,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccountTransactionHistory?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountTransactionHistoryCopyWith<$Res>? get bankAccount {
    if (_value.bankAccount == null) {
      return null;
    }

    return $BankAccountTransactionHistoryCopyWith<$Res>(_value.bankAccount!,
        (value) {
      return _then(_value.copyWith(bankAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionHistoryDetailImplCopyWith<$Res>
    implements $TransactionHistoryDetailCopyWith<$Res> {
  factory _$$TransactionHistoryDetailImplCopyWith(
          _$TransactionHistoryDetailImpl value,
          $Res Function(_$TransactionHistoryDetailImpl) then) =
      __$$TransactionHistoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      int userId,
      String receiverPDoneId,
      String executorPDoneId,
      String sellerPDoneId,
      String buyerPDoneId,
      String presenterPDoneId,
      String representativePDoneId,
      String value,
      String diamondValue,
      TransactionHistoryType transactionType,
      String taxValue,
      String content,
      TransactionHistoryVendor fromSource,
      TransactionHistoryStatus status,
      BankAccountTransactionHistory? bankAccount,
      DateTime? createdAt});

  @override
  $BankAccountTransactionHistoryCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class __$$TransactionHistoryDetailImplCopyWithImpl<$Res>
    extends _$TransactionHistoryDetailCopyWithImpl<$Res,
        _$TransactionHistoryDetailImpl>
    implements _$$TransactionHistoryDetailImplCopyWith<$Res> {
  __$$TransactionHistoryDetailImplCopyWithImpl(
      _$TransactionHistoryDetailImpl _value,
      $Res Function(_$TransactionHistoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? userId = null,
    Object? receiverPDoneId = null,
    Object? executorPDoneId = null,
    Object? sellerPDoneId = null,
    Object? buyerPDoneId = null,
    Object? presenterPDoneId = null,
    Object? representativePDoneId = null,
    Object? value = null,
    Object? diamondValue = null,
    Object? transactionType = null,
    Object? taxValue = null,
    Object? content = null,
    Object? fromSource = null,
    Object? status = null,
    Object? bankAccount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$TransactionHistoryDetailImpl(
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
      receiverPDoneId: null == receiverPDoneId
          ? _value.receiverPDoneId
          : receiverPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      executorPDoneId: null == executorPDoneId
          ? _value.executorPDoneId
          : executorPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerPDoneId: null == sellerPDoneId
          ? _value.sellerPDoneId
          : sellerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerPDoneId: null == buyerPDoneId
          ? _value.buyerPDoneId
          : buyerPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      presenterPDoneId: null == presenterPDoneId
          ? _value.presenterPDoneId
          : presenterPDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      representativePDoneId: null == representativePDoneId
          ? _value.representativePDoneId
          : representativePDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      diamondValue: null == diamondValue
          ? _value.diamondValue
          : diamondValue // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryType,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      fromSource: null == fromSource
          ? _value.fromSource
          : fromSource // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryVendor,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionHistoryStatus,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccountTransactionHistory?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionHistoryDetailImpl implements _TransactionHistoryDetail {
  const _$TransactionHistoryDetailImpl(
      {this.id = 0,
      this.code = '',
      this.userId = 0,
      this.receiverPDoneId = '',
      this.executorPDoneId = '',
      this.sellerPDoneId = '',
      this.buyerPDoneId = '',
      this.presenterPDoneId = '',
      this.representativePDoneId = '',
      this.value = '',
      this.diamondValue = '',
      this.transactionType = TransactionHistoryType.commissionFromOrder,
      this.taxValue = '',
      this.content = '',
      this.fromSource = TransactionHistoryVendor.vShop,
      this.status = TransactionHistoryStatus.success,
      this.bankAccount,
      this.createdAt});

  factory _$TransactionHistoryDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryDetailImplFromJson(json);

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
  final String receiverPDoneId;
  @override
  @JsonKey()
  final String executorPDoneId;
  @override
  @JsonKey()
  final String sellerPDoneId;
  @override
  @JsonKey()
  final String buyerPDoneId;
  @override
  @JsonKey()
  final String presenterPDoneId;
  @override
  @JsonKey()
  final String representativePDoneId;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String diamondValue;
  @override
  @JsonKey()
  final TransactionHistoryType transactionType;
  @override
  @JsonKey()
  final String taxValue;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final TransactionHistoryVendor fromSource;
  @override
  @JsonKey()
  final TransactionHistoryStatus status;
  @override
  final BankAccountTransactionHistory? bankAccount;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TransactionHistoryDetail(id: $id, code: $code, userId: $userId, receiverPDoneId: $receiverPDoneId, executorPDoneId: $executorPDoneId, sellerPDoneId: $sellerPDoneId, buyerPDoneId: $buyerPDoneId, presenterPDoneId: $presenterPDoneId, representativePDoneId: $representativePDoneId, value: $value, diamondValue: $diamondValue, transactionType: $transactionType, taxValue: $taxValue, content: $content, fromSource: $fromSource, status: $status, bankAccount: $bankAccount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.receiverPDoneId, receiverPDoneId) ||
                other.receiverPDoneId == receiverPDoneId) &&
            (identical(other.executorPDoneId, executorPDoneId) ||
                other.executorPDoneId == executorPDoneId) &&
            (identical(other.sellerPDoneId, sellerPDoneId) ||
                other.sellerPDoneId == sellerPDoneId) &&
            (identical(other.buyerPDoneId, buyerPDoneId) ||
                other.buyerPDoneId == buyerPDoneId) &&
            (identical(other.presenterPDoneId, presenterPDoneId) ||
                other.presenterPDoneId == presenterPDoneId) &&
            (identical(other.representativePDoneId, representativePDoneId) ||
                other.representativePDoneId == representativePDoneId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.diamondValue, diamondValue) ||
                other.diamondValue == diamondValue) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.taxValue, taxValue) ||
                other.taxValue == taxValue) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.fromSource, fromSource) ||
                other.fromSource == fromSource) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      userId,
      receiverPDoneId,
      executorPDoneId,
      sellerPDoneId,
      buyerPDoneId,
      presenterPDoneId,
      representativePDoneId,
      value,
      diamondValue,
      transactionType,
      taxValue,
      content,
      fromSource,
      status,
      bankAccount,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryDetailImplCopyWith<_$TransactionHistoryDetailImpl>
      get copyWith => __$$TransactionHistoryDetailImplCopyWithImpl<
          _$TransactionHistoryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryDetailImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistoryDetail implements TransactionHistoryDetail {
  const factory _TransactionHistoryDetail(
      {final int id,
      final String code,
      final int userId,
      final String receiverPDoneId,
      final String executorPDoneId,
      final String sellerPDoneId,
      final String buyerPDoneId,
      final String presenterPDoneId,
      final String representativePDoneId,
      final String value,
      final String diamondValue,
      final TransactionHistoryType transactionType,
      final String taxValue,
      final String content,
      final TransactionHistoryVendor fromSource,
      final TransactionHistoryStatus status,
      final BankAccountTransactionHistory? bankAccount,
      final DateTime? createdAt}) = _$TransactionHistoryDetailImpl;

  factory _TransactionHistoryDetail.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  int get userId;
  @override
  String get receiverPDoneId;
  @override
  String get executorPDoneId;
  @override
  String get sellerPDoneId;
  @override
  String get buyerPDoneId;
  @override
  String get presenterPDoneId;
  @override
  String get representativePDoneId;
  @override
  String get value;
  @override
  String get diamondValue;
  @override
  TransactionHistoryType get transactionType;
  @override
  String get taxValue;
  @override
  String get content;
  @override
  TransactionHistoryVendor get fromSource;
  @override
  TransactionHistoryStatus get status;
  @override
  BankAccountTransactionHistory? get bankAccount;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryDetailImplCopyWith<_$TransactionHistoryDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
