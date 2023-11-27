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
      totalCoinCount: json['totalCoinCount'] as int?,
    );

Map<String, dynamic> _$$GiftCardLiveImplToJson(_$GiftCardLiveImpl instance) =>
    <String, dynamic>{
      'live': instance.live,
      'giversInfo': instance.giversInfo,
      'totalCoinCount': instance.totalCoinCount,
    };
