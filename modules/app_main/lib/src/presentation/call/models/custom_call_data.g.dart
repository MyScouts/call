// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_call_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallUserImpl _$$CallUserImplFromJson(Map<String, dynamic> json) =>
    _$CallUserImpl(
      userId: asOrNull(json['userId']),
      name: asOrNull(json['name']),
      avatarUrl: asOrNull(json['avatarUrl']),
    );

Map<String, dynamic> _$$CallUserImplToJson(_$CallUserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
    };

_$CustomCallDataImpl _$$CustomCallDataImplFromJson(Map<String, dynamic> json) =>
    _$CustomCallDataImpl(
      caller: CallUser.fromJson(json['caller'] as Map<String, dynamic>),
      callee: CallUser.fromJson(json['callee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomCallDataImplToJson(
        _$CustomCallDataImpl instance) =>
    <String, dynamic>{
      'caller': instance.caller.toJson(),
      'callee': instance.callee.toJson(),
    };

_$CallDataResultImpl _$$CallDataResultImplFromJson(Map<String, dynamic> json) =>
    _$CallDataResultImpl(
      callerId: asOrNull(json['callerId']),
      calleeId: asOrNull(json['calleeId']),
      startTime: asOrNull(json['startTime']),
      endTime: asOrNull(json['endTime']),
      isVideoCall: asOrNull(json['isVideoCall']),
      callSignal: asOrNull(json['callSignal']),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$CallDataResultImplToJson(
        _$CallDataResultImpl instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'calleeId': instance.calleeId,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'isVideoCall': instance.isVideoCall,
      'callSignal': instance.callSignal,
      'type': instance.type,
    };
