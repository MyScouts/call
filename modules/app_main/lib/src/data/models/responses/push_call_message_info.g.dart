// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_call_message_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PushCallMessageInfo _$$_PushCallMessageInfoFromJson(
        Map<String, dynamic> json) =>
    _$_PushCallMessageInfo(
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

Map<String, dynamic> _$$_PushCallMessageInfoToJson(
        _$_PushCallMessageInfo instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'serial': instance.serial,
      'callStatus': instance.callStatus,
      'from': instance.from,
      'to': instance.to,
      'projectId': instance.projectId,
    };

_$_CallUserInfo _$$_CallUserInfoFromJson(Map<String, dynamic> json) =>
    _$_CallUserInfo(
      number: json['number'] as String?,
      alias: json['alias'] as String?,
      isOnline: json['is_online'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_CallUserInfoToJson(_$_CallUserInfo instance) =>
    <String, dynamic>{
      'number': instance.number,
      'alias': instance.alias,
      'is_online': instance.isOnline,
      'type': instance.type,
    };
