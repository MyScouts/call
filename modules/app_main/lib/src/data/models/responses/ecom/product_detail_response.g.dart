// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailResponseImpl _$$ProductDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      description: json['description'] as String?,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$ProductDetailResponseImplToJson(
        _$ProductDetailResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'description': instance.description,
      'price': instance.price,
    };
