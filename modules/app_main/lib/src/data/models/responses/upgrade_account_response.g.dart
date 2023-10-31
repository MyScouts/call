// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpgradeAccountResponseImpl _$$UpgradeAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpgradeAccountResponseImpl(
      token: json['token'] as String,
      phone: json['phone'] as String?,
      phoneCode: json['phoneCode'] as String?,
      teamId: json['teamId'] as String?,
    );

Map<String, dynamic> _$$UpgradeAccountResponseImplToJson(
        _$UpgradeAccountResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
      'phoneCode': instance.phoneCode,
      'teamId': instance.teamId,
    };
