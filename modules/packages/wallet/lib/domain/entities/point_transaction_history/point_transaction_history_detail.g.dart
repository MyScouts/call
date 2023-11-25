// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_transaction_history_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointTransactionHistoryDetailImpl
    _$$PointTransactionHistoryDetailImplFromJson(Map<String, dynamic> json) =>
        _$PointTransactionHistoryDetailImpl(
          id: json['id'] as int? ?? 0,
          code: json['code'] as String? ?? '',
          userId: json['userId'] as int? ?? 0,
          chargerName: json['chargerName'] as String? ?? '',
          chargerPDoneId: json['chargerPDoneId'] as String? ?? '',
          receiverName: json['receiverName'] as String? ?? '',
          receiverPDoneId: json['receiverPDoneId'] as String? ?? '',
          roomId: json['roomId'] as String? ?? '',
          value: json['value'] as String? ?? '',
          transactionType: $enumDecodeNullable(
                  _$PointTransactionHistoryTypeEnumMap,
                  json['transactionType']) ??
              PointTransactionHistoryType.rechargePoint,
          content: json['content'] as String? ?? '',
          status: $enumDecodeNullable(
                  _$TransactionHistoryStatusEnumMap, json['status']) ??
              TransactionHistoryStatus.success,
          createdAt: json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
          metaData: json['metaData'] == null
              ? null
              : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$PointTransactionHistoryDetailImplToJson(
        _$PointTransactionHistoryDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'userId': instance.userId,
      'chargerName': instance.chargerName,
      'chargerPDoneId': instance.chargerPDoneId,
      'receiverName': instance.receiverName,
      'receiverPDoneId': instance.receiverPDoneId,
      'roomId': instance.roomId,
      'value': instance.value,
      'transactionType':
          _$PointTransactionHistoryTypeEnumMap[instance.transactionType]!,
      'content': instance.content,
      'status': _$TransactionHistoryStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt?.toIso8601String(),
      'metaData': instance.metaData,
    };

const _$PointTransactionHistoryTypeEnumMap = {
  PointTransactionHistoryType.rechargePoint: 'charge_user',
  PointTransactionHistoryType.gift: 'send_gift',
  PointTransactionHistoryType.vote: 'send_vote',
  PointTransactionHistoryType.entryFee: 'live_room_fee',
  PointTransactionHistoryType.sendRegisterCoach: 'send_register_coach',
  PointTransactionHistoryType.subsidizeContest: 'subsidize_contest',
};

const _$TransactionHistoryStatusEnumMap = {
  TransactionHistoryStatus.success: 1,
  TransactionHistoryStatus.failed: 2,
  TransactionHistoryStatus.pending: 3,
  TransactionHistoryStatus.waitingWithdraw: 4,
};
