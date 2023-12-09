// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePkData _$LivePkDataFromJson(Map<String, dynamic> json) => LivePkData(
      pk: Pk.fromJson(json['pk'] as Map<String, dynamic>),
      lives: (json['lives'] as List<dynamic>)
          .map((e) => LiveData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LivePkDataToJson(LivePkData instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'lives': instance.lives,
    };

Pk _$PkFromJson(Map<String, dynamic> json) => Pk(
      id: json['id'] as int,
      hostID: json['hostId'] as int,
    );

Map<String, dynamic> _$PkToJson(Pk instance) => <String, dynamic>{
      'hostId': instance.hostID,
      'id': instance.id,
    };
