// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_pdone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterPDoneResponse _$$_RegisterPDoneResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterPDoneResponse(
      token: json['token'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      phoneCode: json['phoneCode'] as String?,
    );

Map<String, dynamic> _$$_RegisterPDoneResponseToJson(
        _$_RegisterPDoneResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
      'email': instance.email,
      'phoneCode': instance.phoneCode,
    };
