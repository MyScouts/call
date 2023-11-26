// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'est_coin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstCoinResponse _$EstCoinResponseFromJson(Map<String, dynamic> json) =>
    EstCoinResponse(
      vnd: json['vnd'] as num,
      coin: json['coin'] as num,
      bonusCoin: json['bonusCoin'] as num,
    );

Map<String, dynamic> _$EstCoinResponseToJson(EstCoinResponse instance) =>
    <String, dynamic>{
      'vnd': instance.vnd,
      'coin': instance.coin,
      'bonusCoin': instance.bonusCoin,
    };
