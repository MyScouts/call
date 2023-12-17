// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyGroupResponseImpl _$$MyGroupResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyGroupResponseImpl(
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyGroupResponseImplToJson(
        _$MyGroupResponseImpl instance) =>
    <String, dynamic>{
      'groups': instance.groups,
    };
