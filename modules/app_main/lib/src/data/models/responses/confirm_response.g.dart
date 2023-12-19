// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmResponse _$ConfirmResponseFromJson(Map<String, dynamic> json) =>
    ConfirmResponse(
      result: json['result'] as bool?,
      approveRequired: json['approveRequired'] as bool?,
    );

Map<String, dynamic> _$ConfirmResponseToJson(ConfirmResponse instance) =>
    <String, dynamic>{
      'approveRequired': instance.approveRequired,
      'result': instance.result,
    };
