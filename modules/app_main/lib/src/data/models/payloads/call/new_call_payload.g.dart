// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_call_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCallPayload _$NewCallPayloadFromJson(Map<String, dynamic> json) =>
    NewCallPayload(
      type: json['type'] as int,
      receiverId: json['receiverId'] as int,
      callGroupId: json['callGroupId'] as int?,
    );

Map<String, dynamic> _$NewCallPayloadToJson(NewCallPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'receiverId': instance.receiverId,
      'callGroupId': instance.callGroupId,
    };
