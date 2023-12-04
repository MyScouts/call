// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberCountDataImpl _$$MemberCountDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberCountDataImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveMemberCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MemberCountDataImplToJson(
        _$MemberCountDataImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
