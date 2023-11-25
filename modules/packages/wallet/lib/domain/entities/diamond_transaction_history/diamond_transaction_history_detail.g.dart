// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_transaction_history_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiamondTransactionHistoryDetailImpl
    _$$DiamondTransactionHistoryDetailImplFromJson(Map<String, dynamic> json) =>
        _$DiamondTransactionHistoryDetailImpl(
          id: json['id'] as int? ?? 0,
          userId: json['userId'] as int? ?? 0,
          code: json['code'] as String? ?? '',
          senderName: json['senderName'] as String? ?? '',
          senderPDoneId: json['senderPDoneId'] as String? ?? '',
          roomId: json['roomId'] as String? ?? '',
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
          metaData: json['metaData'] == null
              ? null
              : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$DiamondTransactionHistoryDetailImplToJson(
        _$DiamondTransactionHistoryDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'code': instance.code,
      'senderName': instance.senderName,
      'senderPDoneId': instance.senderPDoneId,
      'roomId': instance.roomId,
      'value': instance.value,
      'transactionType':
          _$DiamondTransactionHistoryTypeEnumMap[instance.transactionType]!,
      'content': instance.content,
      'status': _$DiamondTransactionHistoryStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt?.toIso8601String(),
      'metaData': instance.metaData,
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
