// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryImpl _$$TransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryImpl(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      value: json['value'] as String? ?? '',
      content: json['content'] as String? ?? '',
      transactionType: $enumDecodeNullable(
              _$TransactionHistoryTypeEnumMap, json['transactionType']) ??
          TransactionHistoryType.discountFromOrder,
      status: $enumDecodeNullable(
              _$TransactionHistoryStatusEnumMap, json['status']) ??
          TransactionHistoryStatus.success,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionHistoryImplToJson(
        _$TransactionHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'value': instance.value,
      'content': instance.content,
      'transactionType':
          _$TransactionHistoryTypeEnumMap[instance.transactionType]!,
      'status': _$TransactionHistoryStatusEnumMap[instance.status]!,
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

const _$TransactionHistoryStatusEnumMap = {
  TransactionHistoryStatus.success: 1,
  TransactionHistoryStatus.failed: 2,
  TransactionHistoryStatus.pending: 3,
  TransactionHistoryStatus.waitingWithdraw: 4,
};
