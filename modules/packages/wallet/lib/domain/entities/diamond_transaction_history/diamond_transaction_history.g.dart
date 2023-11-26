// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiamondTransactionHistoryImpl _$$DiamondTransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$DiamondTransactionHistoryImpl(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      value: json['value'] as String? ?? '',
      transactionType: $enumDecodeNullable(
              _$DiamondTransactionHistoryTypeEnumMap,
              json['transactionType']) ??
          DiamondTransactionHistoryType.exchangeDiamondToVnd,
      content: json['content'] as String? ?? '',
      status: $enumDecodeNullable(
              _$DiamondTransactionHistoryStatusEnumMap, json['status']) ??
          DiamondTransactionHistoryStatus.success,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DiamondTransactionHistoryImplToJson(
        _$DiamondTransactionHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'value': instance.value,
      'transactionType':
          _$DiamondTransactionHistoryTypeEnumMap[instance.transactionType]!,
      'content': instance.content,
      'status': _$DiamondTransactionHistoryStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt?.toIso8601String(),
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
