// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_get_invite_friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGetInviteFriend _$DataGetInviteFriendFromJson(Map<String, dynamic> json) =>
    DataGetInviteFriend(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => RowsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$DataGetInviteFriendToJson(
        DataGetInviteFriend instance) =>
    <String, dynamic>{
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
