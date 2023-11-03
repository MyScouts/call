// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_account_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBankAccountPayload _$UpdateBankAccountPayloadFromJson(
        Map<String, dynamic> json) =>
    UpdateBankAccountPayload(
      token: json['token'] as String,
      bankHolder: json['bankHolder'] as String,
      bankId: json['bankId'] as int,
      bankNumber: json['bankNumber'] as String,
      isDefault: json['isDefault'] as bool,
      otp: json['otp'] as String,
      qrImage: json['qrImage'] as String?,
    );

Map<String, dynamic> _$UpdateBankAccountPayloadToJson(
        UpdateBankAccountPayload instance) =>
    <String, dynamic>{
      'token': instance.token,
      'otp': instance.otp,
      'bankId': instance.bankId,
      'bankNumber': instance.bankNumber,
      'bankHolder': instance.bankHolder,
      'qrImage': instance.qrImage,
      'isDefault': instance.isDefault,
    };
