// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiamondWalletInfoImpl _$$DiamondWalletInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$DiamondWalletInfoImpl(
      id: json['id'] as int?,
      totalCoin: json['totalCoin'] as int?,
      totalDiamond: json['totalDiamond'] as int?,
      totalVnd: json['totalVnd'] as int?,
      waiting: json['waiting'] as int?,
      available: json['available'] as int?,
    );

Map<String, dynamic> _$$DiamondWalletInfoImplToJson(
        _$DiamondWalletInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalCoin': instance.totalCoin,
      'totalDiamond': instance.totalDiamond,
      'totalVnd': instance.totalVnd,
      'waiting': instance.waiting,
      'available': instance.available,
    };
