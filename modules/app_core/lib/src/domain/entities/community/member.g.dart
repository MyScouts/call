// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'user': instance.user,
    };
