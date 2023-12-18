// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberMetaDataDto _$MemberMetaDataDtoFromJson(Map<String, dynamic> json) =>
    MemberMetaDataDto(
      avatar: json['avatar'] as String?,
      backgroundImages: json['backgroundImages'] as List<dynamic>?,
      defaultBackground: json['defaultBackground'] as String?,
      displayName: json['displayName'] as String,
      hexId: json['hexId'] as String?,
      id: json['id'] as int,
      pDoneId: json['pDoneId'] as String?,
      phone: json['phone'] as String?,
      phoneCode: json['phoneCode'] as String?,
      roleMemberCode: json['roleMemberCode'] as String?,
      status: json['status'] as int?,
    )..profile = json['profile'];

Map<String, dynamic> _$MemberMetaDataDtoToJson(MemberMetaDataDto instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'backgroundImages': instance.backgroundImages,
      'defaultBackground': instance.defaultBackground,
      'displayName': instance.displayName,
      'hexId': instance.hexId,
      'id': instance.id,
      'pDoneId': instance.pDoneId,
      'phone': instance.phone,
      'phoneCode': instance.phoneCode,
      'profile': instance.profile,
      'roleMemberCode': instance.roleMemberCode,
      'status': instance.status,
    };
