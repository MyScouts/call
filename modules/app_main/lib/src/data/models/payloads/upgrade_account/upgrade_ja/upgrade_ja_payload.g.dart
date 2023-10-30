// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_ja_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpgradeJAPayloadImpl _$$UpgradeJAPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UpgradeJAPayloadImpl(
      teamId: json['teamId'] as String?,
      bankHolder: json['bankHolder'] as String?,
      bankNumber: json['bankNumber'] as String?,
      bankId: json['bankId'] as int?,
    );

Map<String, dynamic> _$$UpgradeJAPayloadImplToJson(
        _$UpgradeJAPayloadImpl instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'bankHolder': instance.bankHolder,
      'bankNumber': instance.bankNumber,
      'bankId': instance.bankId,
    };
