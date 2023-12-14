// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_call_message_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushCallMessageInfoImpl _$$PushCallMessageInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PushCallMessageInfoImpl(
      callId: json['callId'] as String?,
      serial: json['serial'] as int?,
      callStatus: json['callStatus'] as String?,
      from: json['from'] == null
          ? null
          : CallUserInfo.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : CallUserInfo.fromJson(json['to'] as Map<String, dynamic>),
      projectId: json['projectId'] as int?,
    );

Map<String, dynamic> _$$PushCallMessageInfoImplToJson(
        _$PushCallMessageInfoImpl instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'serial': instance.serial,
      'callStatus': instance.callStatus,
      'from': instance.from,
      'to': instance.to,
      'projectId': instance.projectId,
    };

_$CallUserInfoImpl _$$CallUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$CallUserInfoImpl(
      number: json['number'] as String?,
      alias: json['alias'] as String?,
      isOnline: json['is_online'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$CallUserInfoImplToJson(_$CallUserInfoImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'alias': instance.alias,
      'is_online': instance.isOnline,
      'type': instance.type,
    };
