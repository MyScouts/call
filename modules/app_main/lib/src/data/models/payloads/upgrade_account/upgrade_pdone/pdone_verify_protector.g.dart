// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_verify_protector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneVerifyProtectorRequest _$PDoneVerifyProtectorRequestFromJson(
        Map<String, dynamic> json) =>
    PDoneVerifyProtectorRequest(
      protector: json['protector'] as int?,
      phoneCode: json['phoneCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      pDoneId: json['pDoneId'] as String?,
      identityNumber: json['identityNumber'] as String?,
    );

Map<String, dynamic> _$PDoneVerifyProtectorRequestToJson(
        PDoneVerifyProtectorRequest instance) =>
    <String, dynamic>{
      'protector': instance.protector,
      'phoneCode': instance.phoneCode,
      'phoneNumber': instance.phoneNumber,
      'pDoneId': instance.pDoneId,
      'identityNumber': instance.identityNumber,
    };
