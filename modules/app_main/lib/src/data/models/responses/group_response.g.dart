// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'groups': instance.groups,
    };

GroupByIdResponse _$GroupByIdResponseFromJson(Map<String, dynamic> json) =>
    GroupByIdResponse(
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupByIdResponseToJson(GroupByIdResponse instance) =>
    <String, dynamic>{
      'group': instance.group,
    };
