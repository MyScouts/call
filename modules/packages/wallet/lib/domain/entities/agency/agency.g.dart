// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyDetailResponse _$AgencyDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AgencyDetailResponse(
      coinAgency:
          AgencyResponse.fromJson(json['coinAgency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgencyDetailResponseToJson(
        AgencyDetailResponse instance) =>
    <String, dynamic>{
      'coinAgency': instance.coinAgency,
    };

AgencyResponse _$AgencyResponseFromJson(Map<String, dynamic> json) =>
    AgencyResponse(
      id: json['id'] as int?,
      coinDiscounts: (json['coinDiscounts'] as List<dynamic>?)
          ?.map((e) => CoinDiscountResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      availableCoin: json['availableCoin'] as num?,
      user: json['user'] == null
          ? null
          : AgencyUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgencyResponseToJson(AgencyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'availableCoin': instance.availableCoin,
      'user': instance.user,
      'coinDiscounts': instance.coinDiscounts,
    };

AgencyUser _$AgencyUserFromJson(Map<String, dynamic> json) => AgencyUser(
      id: json['id'] as int?,
      displayName: json['displayName'] as String?,
      phone: json['phone'] as String?,
      phoneCode: json['phoneCode'] as String?,
      email: json['email'] as String?,
      pDoneId: json['pDoneId'] as String?,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$AgencyUserToJson(AgencyUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'pDoneId': instance.pDoneId,
      'email': instance.email,
      'phoneCode': instance.phoneCode,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
    };
