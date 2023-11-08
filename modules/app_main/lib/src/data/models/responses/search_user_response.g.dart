// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchUserResponseImpl _$$SearchUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUserResponseImpl(
      searchUsers: (json['searchUsers'] as List<dynamic>)
          .map((e) => SearchUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchUserResponseImplToJson(
        _$SearchUserResponseImpl instance) =>
    <String, dynamic>{
      'searchUsers': instance.searchUsers,
    };

_$SearchUserImpl _$$SearchUserImplFromJson(Map<String, dynamic> json) =>
    _$SearchUserImpl(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      fullName: json['fullName'] as String?,
      pDoneId: json['pDoneId'] as String,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$SearchUserImplToJson(_$SearchUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'fullName': instance.fullName,
      'pDoneId': instance.pDoneId,
      'birthday': instance.birthday,
    };
