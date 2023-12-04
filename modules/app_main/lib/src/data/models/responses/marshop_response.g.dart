// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marshop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListMarshopResponseImpl _$$ListMarshopResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListMarshopResponseImpl(
      total: json['total'] as int,
      marshops: (json['marshops'] as List<dynamic>)
          .map((e) => MarshopResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListMarshopResponseImplToJson(
        _$ListMarshopResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'marshops': instance.marshops,
    };

_$MarshopResponseImpl _$$MarshopResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      code: json['code'] as String,
      user: MarshopUserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarshopResponseImplToJson(
        _$MarshopResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'user': instance.user,
    };

_$MarshopUserInfoImpl _$$MarshopUserInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopUserInfoImpl(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      pDoneId: json['pDoneId'] as String,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$MarshopUserInfoImplToJson(
        _$MarshopUserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'pDoneId': instance.pDoneId,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
    };

_$MarshopRegisterPacksResponseImpl _$$MarshopRegisterPacksResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopRegisterPacksResponseImpl(
      packs: (json['packs'] as List<dynamic>)
          .map((e) =>
              MarshopRegisterPackResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MarshopRegisterPacksResponseImplToJson(
        _$MarshopRegisterPacksResponseImpl instance) =>
    <String, dynamic>{
      'packs': instance.packs,
    };

_$MarshopRegisterPackResponseImpl _$$MarshopRegisterPackResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopRegisterPackResponseImpl(
      id: json['id'] as int,
      price: json['price'] as int,
      name: json['name'] as String,
      rules: (json['rules'] as List<dynamic>)
          .map((e) =>
              MarshopRegisterPackRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MarshopRegisterPackResponseImplToJson(
        _$MarshopRegisterPackResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'rules': instance.rules,
    };

_$MarshopRegisterPackRuleImpl _$$MarshopRegisterPackRuleImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopRegisterPackRuleImpl(
      quantity: json['quantity'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) =>
              MarshopRegisterPackProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MarshopRegisterPackRuleImplToJson(
        _$MarshopRegisterPackRuleImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'title': instance.title,
      'content': instance.content,
      'products': instance.products,
    };

_$MarshopRegisterPackProductImpl _$$MarshopRegisterPackProductImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopRegisterPackProductImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$MarshopRegisterPackProductImplToJson(
        _$MarshopRegisterPackProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
