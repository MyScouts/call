// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as int?,
      codeId: json['codeId'] as String?,
      name: json['name'] as String?,
      isProvincialGroup: json['isProvincialGroup'] as bool?,
      avatar: json['avatar'] as String?,
      banner: json['banner'] as String?,
      introduction: json['introduction'] as String?,
      boss: json['boss'] == null
          ? null
          : User.fromJson(json['boss'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'codeId': instance.codeId,
      'name': instance.name,
      'isProvincialGroup': instance.isProvincialGroup,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'introduction': instance.introduction,
      'boss': instance.boss,
    };
