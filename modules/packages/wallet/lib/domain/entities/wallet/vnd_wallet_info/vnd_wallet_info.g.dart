// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vnd_wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VndWalletInfoImpl _$$VndWalletInfoImplFromJson(Map<String, dynamic> json) =>
    _$VndWalletInfoImpl(
      id: json['id'] as int?,
      waiting: json['waiting'] as int?,
      available: json['available'] as int?,
      withdraw: json['withdraw'] as int?,
      totalCoin: json['totalCoin'] as int?,
      totalDiamond: json['totalDiamond'] as int?,
      totalVnd: json['totalVnd'] as int?,
      availableVLive: json['availableVLive'] as int?,
      availableVShop: json['availableVShop'] as int?,
    );

Map<String, dynamic> _$$VndWalletInfoImplToJson(_$VndWalletInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'waiting': instance.waiting,
      'available': instance.available,
      'withdraw': instance.withdraw,
      'totalCoin': instance.totalCoin,
      'totalDiamond': instance.totalDiamond,
      'totalVnd': instance.totalVnd,
      'availableVLive': instance.availableVLive,
      'availableVShop': instance.availableVShop,
    };
