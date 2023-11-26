// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBankAccountRequest _$AddBankAccountRequestFromJson(
        Map<String, dynamic> json) =>
    AddBankAccountRequest(
      token: json['token'] as String,
      bankHolder: json['bankHolder'] as String,
      bankId: json['bankId'] as int,
      bankNumber: json['bankNumber'] as String,
      isDefault: json['isDefault'] as bool,
      otp: json['otp'] as String,
      qrImage: json['qrImage'] as String?,
    );

Map<String, dynamic> _$AddBankAccountRequestToJson(
        AddBankAccountRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'otp': instance.otp,
      'bankId': instance.bankId,
      'bankNumber': instance.bankNumber,
      'bankHolder': instance.bankHolder,
      'qrImage': instance.qrImage,
      'isDefault': instance.isDefault,
    };
