// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryDetailImpl _$$TransactionHistoryDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryDetailImpl(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      userId: json['userId'] as int? ?? 0,
      receiverPDoneId: json['receiverPDoneId'] as String? ?? '',
      executorPDoneId: json['executorPDoneId'] as String? ?? '',
      sellerPDoneId: json['sellerPDoneId'] as String? ?? '',
      buyerPDoneId: json['buyerPDoneId'] as String? ?? '',
      presenterPDoneId: json['presenterPDoneId'] as String? ?? '',
      representativePDoneId: json['representativePDoneId'] as String? ?? '',
      value: json['value'] as String? ?? '',
      diamondValue: json['diamondValue'] as String? ?? '',
      transactionType: $enumDecodeNullable(
              _$TransactionHistoryTypeEnumMap, json['transactionType']) ??
          TransactionHistoryType.commissionFromOrder,
      taxValue: json['taxValue'] as String? ?? '',
      content: json['content'] as String? ?? '',
      fromSource: $enumDecodeNullable(
              _$TransactionHistoryVendorEnumMap, json['fromSource']) ??
          TransactionHistoryVendor.vShop,
      status: $enumDecodeNullable(
              _$TransactionHistoryStatusEnumMap, json['status']) ??
          TransactionHistoryStatus.success,
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccountTransactionHistory.fromJson(
              json['bankAccount'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionHistoryDetailImplToJson(
        _$TransactionHistoryDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'userId': instance.userId,
      'receiverPDoneId': instance.receiverPDoneId,
      'executorPDoneId': instance.executorPDoneId,
      'sellerPDoneId': instance.sellerPDoneId,
      'buyerPDoneId': instance.buyerPDoneId,
      'presenterPDoneId': instance.presenterPDoneId,
      'representativePDoneId': instance.representativePDoneId,
      'value': instance.value,
      'diamondValue': instance.diamondValue,
      'transactionType':
          _$TransactionHistoryTypeEnumMap[instance.transactionType]!,
      'taxValue': instance.taxValue,
      'content': instance.content,
      'fromSource': _$TransactionHistoryVendorEnumMap[instance.fromSource]!,
      'status': _$TransactionHistoryStatusEnumMap[instance.status]!,
      'bankAccount': instance.bankAccount,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$TransactionHistoryTypeEnumMap = {
  TransactionHistoryType.discountFromOrder: 'discount_from_order',
  TransactionHistoryType.discountFromBuyAccount: 'discount_from_buy_account',
  TransactionHistoryType.commissionFromOrder: 'commission_from_order',
  TransactionHistoryType.commissionFromBuyAccount:
      'commission_from_buy_account',
  TransactionHistoryType.discountFromLivestream: 'discount_from_livestream',
  TransactionHistoryType.commissionFromLivestream: 'commission_from_livestream',
  TransactionHistoryType.withdraw: 'withdraw',
};

const _$TransactionHistoryVendorEnumMap = {
  TransactionHistoryVendor.vShop: 'v_shop',
  TransactionHistoryVendor.vLive: 'v_live',
};

const _$TransactionHistoryStatusEnumMap = {
  TransactionHistoryStatus.success: 1,
  TransactionHistoryStatus.failed: 2,
  TransactionHistoryStatus.pending: 3,
  TransactionHistoryStatus.waitingWithdraw: 4,
};
