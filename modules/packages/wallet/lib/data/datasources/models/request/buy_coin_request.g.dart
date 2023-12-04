// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_coin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyCoinRequest _$BuyCoinRequestFromJson(Map<String, dynamic> json) =>
    BuyCoinRequest(
      vnd: json['vnd'] as num,
      pDoneId: json['pDoneId'] as String,
      expectedCoin: json['expectedCoin'] as num,
      bankAccountId: json['bankAccountId'] as num,
    );

Map<String, dynamic> _$BuyCoinRequestToJson(BuyCoinRequest instance) =>
    <String, dynamic>{
      'vnd': instance.vnd,
      'expectedCoin': instance.expectedCoin,
      'pDoneId': instance.pDoneId,
      'bankAccountId': instance.bankAccountId,
    };
