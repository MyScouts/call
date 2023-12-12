// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawRequest _$WithdrawRequestFromJson(Map<String, dynamic> json) =>
    WithdrawRequest(
      value: json['value'] as num,
      bankAccountId: json['bankAccountId'] as int,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$WithdrawRequestToJson(WithdrawRequest instance) =>
    <String, dynamic>{
      'bankAccountId': instance.bankAccountId,
      'value': instance.value,
      'otp': instance.otp,
    };
