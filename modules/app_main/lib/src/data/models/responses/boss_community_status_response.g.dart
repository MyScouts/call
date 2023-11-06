// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boss_community_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BossCommunityStatusResponse _$BossCommunityStatusResponseFromJson(
        Map<String, dynamic> json) =>
    BossCommunityStatusResponse(
      giveUpBossRoleRequest: json['giveUpBossRoleRequest'] == null
          ? null
          : GiveUpBossRoleRequest.fromJson(
              json['giveUpBossRoleRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BossCommunityStatusResponseToJson(
        BossCommunityStatusResponse instance) =>
    <String, dynamic>{
      'giveUpBossRoleRequest': instance.giveUpBossRoleRequest,
    };

GiveUpBossRoleRequest _$GiveUpBossRoleRequestFromJson(
        Map<String, dynamic> json) =>
    GiveUpBossRoleRequest(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$GiveUpBossRoleRequestToJson(
        GiveUpBossRoleRequest instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
    };
