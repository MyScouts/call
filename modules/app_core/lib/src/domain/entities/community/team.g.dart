// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as int?,
      codeId: json['codeId'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      banner: json['banner'] as String?,
      introduction: json['introduction'] as String?,
      boss: json['boss'] == null
          ? null
          : User.fromJson(json['boss'] as Map<String, dynamic>),
      isJoined: json['isJoined'] as bool?,
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'codeId': instance.codeId,
      'name': instance.name,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'introduction': instance.introduction,
      'boss': instance.boss,
      'isJoined': instance.isJoined,
    };
