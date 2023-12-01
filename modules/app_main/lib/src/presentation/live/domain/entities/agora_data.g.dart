// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgoraData _$AgoraDataFromJson(Map<String, dynamic> json) => AgoraData(
      channel: json['channel'] as String,
      token: json['token'] as String,
      uid: json['uid'] as int,
    );

Map<String, dynamic> _$AgoraDataToJson(AgoraData instance) => <String, dynamic>{
      'channel': instance.channel,
      'token': instance.token,
      'uid': instance.uid,
    };
