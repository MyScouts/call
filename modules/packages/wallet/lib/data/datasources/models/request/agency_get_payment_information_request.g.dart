// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_get_payment_information_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyPaymentInformation _$AgencyPaymentInformationFromJson(
        Map<String, dynamic> json) =>
    AgencyPaymentInformation(
      vnd: json['vnd'] as num,
      pDoneId: json['pDoneId'] as String,
      bankAccountId: json['bankAccountId'] as num,
    );

Map<String, dynamic> _$AgencyPaymentInformationToJson(
        AgencyPaymentInformation instance) =>
    <String, dynamic>{
      'vnd': instance.vnd,
      'pDoneId': instance.pDoneId,
      'bankAccountId': instance.bankAccountId,
    };
