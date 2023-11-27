// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_coin_payment_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletCoinPaymentInformation _$WalletCoinPaymentInformationFromJson(
        Map<String, dynamic> json) =>
    WalletCoinPaymentInformation(
      vnd: json['vnd'] as num,
      bonusCoin: json['bonusCoin'] as num,
      coin: json['coin'] as num,
      content: json['content'] as String,
      bankAccount:
          BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WalletCoinPaymentInformationToJson(
        WalletCoinPaymentInformation instance) =>
    <String, dynamic>{
      'vnd': instance.vnd,
      'bonusCoin': instance.bonusCoin,
      'coin': instance.coin,
      'content': instance.content,
      'bankAccount': instance.bankAccount,
    };
