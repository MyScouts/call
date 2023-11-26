// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftCardListImpl _$$GiftCardListImplFromJson(Map<String, dynamic> json) =>
    _$GiftCardListImpl(
      giftList: (json['giftCards'] as List<dynamic>?)
          ?.map((e) => GiftCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$GiftCardListImplToJson(_$GiftCardListImpl instance) =>
    <String, dynamic>{
      'giftCards': instance.giftList,
      'count': instance.count,
    };

_$GiftCardImpl _$$GiftCardImplFromJson(Map<String, dynamic> json) =>
    _$GiftCardImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageGift: json['imageGift'] as String?,
      gifUrl: json['gifUrl'] as String?,
      coinValue: json['coinValue'] as int?,
      status: json['status'] as int?,
      type: json['type'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$$GiftCardImplToJson(_$GiftCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageGift': instance.imageGift,
      'gifUrl': instance.gifUrl,
      'coinValue': instance.coinValue,
      'status': instance.status,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'metadata': instance.metadata,
      'deletedAt': instance.deletedAt,
    };

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      isStaticGif: json['isStaticGif'] as bool?,
      displayTime: json['displayTime'] ?? 4,
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'isStaticGif': instance.isStaticGif,
      'displayTime': instance.displayTime,
    };
