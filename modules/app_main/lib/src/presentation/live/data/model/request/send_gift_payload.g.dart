// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_gift_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendGiftPayloadImpl _$$SendGiftPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$SendGiftPayloadImpl(
      userId: json['userId'] as int?,
      liveId: json['liveId'] as int?,
      giftId: json['giftId'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$SendGiftPayloadImplToJson(
        _$SendGiftPayloadImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'liveId': instance.liveId,
      'giftId': instance.giftId,
      'total': instance.total,
    };
