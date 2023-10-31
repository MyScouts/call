// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_pdone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPDoneResponseImpl _$$RegisterPDoneResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPDoneResponseImpl(
      token: json['token'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      phoneCode: json['phoneCode'] as String?,
    );

Map<String, dynamic> _$$RegisterPDoneResponseImplToJson(
        _$RegisterPDoneResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
      'email': instance.email,
      'phoneCode': instance.phoneCode,
    };
