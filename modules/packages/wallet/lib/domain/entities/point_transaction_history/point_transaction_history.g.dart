// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointTransactionHistoryImpl _$$PointTransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PointTransactionHistoryImpl(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      value: json['value'] as String? ?? '',
      transactionType: $enumDecodeNullable(
              _$PointTransactionHistoryTypeEnumMap, json['transactionType']) ??
          PointTransactionHistoryType.rechargePoint,
      content: json['content'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PointTransactionHistoryImplToJson(
        _$PointTransactionHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'value': instance.value,
      'transactionType':
          _$PointTransactionHistoryTypeEnumMap[instance.transactionType]!,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PointTransactionHistoryTypeEnumMap = {
  PointTransactionHistoryType.rechargePoint: 'charge_user',
  PointTransactionHistoryType.gift: 'send_gift',
  PointTransactionHistoryType.vote: 'send_vote',
  PointTransactionHistoryType.entryFee: 'live_room_fee',
  PointTransactionHistoryType.sendRegisterCoach: 'send_register_coach',
  PointTransactionHistoryType.subsidizeContest: 'subsidize_contest',
};
