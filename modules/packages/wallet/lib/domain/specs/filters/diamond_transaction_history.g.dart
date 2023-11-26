// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiamondTransactionHistoryFilterImpl
    _$$DiamondTransactionHistoryFilterImplFromJson(Map<String, dynamic> json) =>
        _$DiamondTransactionHistoryFilterImpl(
          transactionType: (json['transactionType'] as List<dynamic>?)
                  ?.map((e) =>
                      $enumDecode(_$DiamondTransactionHistoryTypeEnumMap, e))
                  .toList() ??
              const [],
          status: (json['status'] as List<dynamic>?)
                  ?.map((e) =>
                      $enumDecode(_$DiamondTransactionHistoryStatusEnumMap, e))
                  .toList() ??
              const [],
          date: json['date'] == null
              ? null
              : DateTime.parse(json['date'] as String),
        );

Map<String, dynamic> _$$DiamondTransactionHistoryFilterImplToJson(
        _$DiamondTransactionHistoryFilterImpl instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType
          .map((e) => _$DiamondTransactionHistoryTypeEnumMap[e]!)
          .toList(),
      'status': instance.status
          .map((e) => _$DiamondTransactionHistoryStatusEnumMap[e]!)
          .toList(),
      'date': _dateTimeToString(instance.date),
    };

const _$DiamondTransactionHistoryTypeEnumMap = {
  DiamondTransactionHistoryType.exchangeDiamondToVnd: 'exchange_diamond_to_vnd',
  DiamondTransactionHistoryType.receiveGift: 'receive_gift',
  DiamondTransactionHistoryType.receiveVote: 'receive_vote',
  DiamondTransactionHistoryType.receiveVoucher: 'receive_voucher',
  DiamondTransactionHistoryType.receiveRegisterCoach: 'receive_register_coach',
};

const _$DiamondTransactionHistoryStatusEnumMap = {
  DiamondTransactionHistoryStatus.success: 1,
  DiamondTransactionHistoryStatus.failed: 2,
  DiamondTransactionHistoryStatus.pending: 3,
};
