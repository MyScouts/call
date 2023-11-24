// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryFilterImpl _$$TransactionHistoryFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryFilterImpl(
      transactionType: (json['transactionType'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TransactionHistoryTypeEnumMap, e))
              .toList() ??
          const [],
      status: (json['status'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TransactionHistoryStatusEnumMap, e))
              .toList() ??
          const [],
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$TransactionHistoryFilterImplToJson(
        _$TransactionHistoryFilterImpl instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType
          .map((e) => _$TransactionHistoryTypeEnumMap[e]!)
          .toList(),
      'status': instance.status
          .map((e) => _$TransactionHistoryStatusEnumMap[e]!)
          .toList(),
      'date': dateTimeToString(instance.date),
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
