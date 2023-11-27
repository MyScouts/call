// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_list_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveListMemberResponse _$LiveListMemberResponseFromJson(
        Map<String, dynamic> json) =>
    LiveListMemberResponse(
      (json['members'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveListMemberResponseToJson(
        LiveListMemberResponse instance) =>
    <String, dynamic>{
      'members': instance.members,
    };
