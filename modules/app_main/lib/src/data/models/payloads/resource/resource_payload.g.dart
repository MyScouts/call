// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RenderPDFPayloadImpl _$$RenderPDFPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RenderPDFPayloadImpl(
      type: json['type'] as int,
      params: json['params'],
    );

Map<String, dynamic> _$$RenderPDFPayloadImplToJson(
        _$RenderPDFPayloadImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'params': instance.params,
    };

_$BossGroupContractPramImpl _$$BossGroupContractPramImplFromJson(
        Map<String, dynamic> json) =>
    _$BossGroupContractPramImpl(
      date: json['date'] as String,
      month: json['month'] as String,
      year: json['year'] as String,
      fullName: json['fullName'] as String,
      birthday: json['birthday'] as String,
      identityNumber: json['identityNumber'] as String,
      issuer: json['issuer'] as String,
      issuedDate: json['issuedDate'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$BossGroupContractPramImplToJson(
        _$BossGroupContractPramImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'month': instance.month,
      'year': instance.year,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'identityNumber': instance.identityNumber,
      'issuer': instance.issuer,
      'issuedDate': instance.issuedDate,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
