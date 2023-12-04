// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_gift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SentGiftResponseImpl _$$SentGiftResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SentGiftResponseImpl(
      giftCard: json['giftCard'] == null
          ? null
          : GiftCard.fromJson(json['giftCard'] as Map<String, dynamic>),
      giver: json['giver'] == null
          ? null
          : User.fromJson(json['giver'] as Map<String, dynamic>),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$SentGiftResponseImplToJson(
        _$SentGiftResponseImpl instance) =>
    <String, dynamic>{
      'giftCard': instance.giftCard,
      'giver': instance.giver,
      'total': instance.total,
    };
