// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_live_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinLiveResponse _$JoinLiveResponseFromJson(Map<String, dynamic> json) =>
    JoinLiveResponse(
      data: LiveData.fromJson(json['live'] as Map<String, dynamic>),
      isModerator: json['isModerator'] as bool,
    );

Map<String, dynamic> _$JoinLiveResponseToJson(JoinLiveResponse instance) =>
    <String, dynamic>{
      'live': instance.data,
      'isModerator': instance.isModerator,
    };

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
