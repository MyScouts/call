// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointTransactionHistoryFilterImpl
    _$$PointTransactionHistoryFilterImplFromJson(Map<String, dynamic> json) =>
        _$PointTransactionHistoryFilterImpl(
          transactionType: (json['transactionType'] as List<dynamic>?)
                  ?.map((e) =>
                      $enumDecode(_$PointTransactionHistoryTypeEnumMap, e))
                  .toList() ??
              const [],
          date: json['date'] == null
              ? null
              : DateTime.parse(json['date'] as String),
        );

Map<String, dynamic> _$$PointTransactionHistoryFilterImplToJson(
        _$PointTransactionHistoryFilterImpl instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType
          .map((e) => _$PointTransactionHistoryTypeEnumMap[e]!)
          .toList(),
      'date': _dateTimeToString(instance.date),
    };

const _$PointTransactionHistoryTypeEnumMap = {
  PointTransactionHistoryType.rechargePoint: 'charge_user',
  PointTransactionHistoryType.gift: 'send_gift',
  PointTransactionHistoryType.vote: 'send_vote',
  PointTransactionHistoryType.entryFee: 'live_room_fee',
  PointTransactionHistoryType.sendRegisterCoach: 'send_register_coach',
  PointTransactionHistoryType.subsidizeContest: 'subsidize_contest',
};
