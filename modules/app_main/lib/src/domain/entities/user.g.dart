// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
