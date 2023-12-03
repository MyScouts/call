// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftCardLiveImpl _$$GiftCardLiveImplFromJson(Map<String, dynamic> json) =>
    _$GiftCardLiveImpl(
      live: json['live'] == null
          ? null
          : LiveDetail.fromJson(json['live'] as Map<String, dynamic>),
      giversInfo: (json['giversInfo'] as List<dynamic>?)
          ?.map((e) => GiversInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      caculateFrom: json['caculateFrom'] == null
          ? null
          : DateTime.parse(json['caculateFrom'] as String),
      refreshAt: json['refreshAt'] == null
          ? null
          : DateTime.parse(json['refreshAt'] as String),
      diamondCount: json['diamondCount'] as int?,
    );

Map<String, dynamic> _$$GiftCardLiveImplToJson(_$GiftCardLiveImpl instance) =>
    <String, dynamic>{
      'live': instance.live,
      'giversInfo': instance.giversInfo,
      'caculateFrom': instance.caculateFrom?.toIso8601String(),
      'refreshAt': instance.refreshAt?.toIso8601String(),
      'diamondCount': instance.diamondCount,
    };
