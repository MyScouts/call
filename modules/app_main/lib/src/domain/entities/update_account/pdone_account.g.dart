// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PDoneAccountImpl _$$PDoneAccountImplFromJson(Map<String, dynamic> json) =>
    _$PDoneAccountImpl(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      backgroundImages: (json['backgroundImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pDoneId: json['pDoneId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as int?,
      nickname: json['nickname'] as String?,
      displayName: json['displayName'] as String?,
      profile: json['profile'] == null
          ? null
          : PDoneProfile.fromJson(json['profile'] as Map<String, dynamic>),
      kyc: json['kyc'] == null
          ? null
          : Kyc.fromJson(json['kyc'] as Map<String, dynamic>),
      isPDone: json['isPDone'] as bool?,
    );

Map<String, dynamic> _$$PDoneAccountImplToJson(_$PDoneAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'backgroundImages': instance.backgroundImages,
      'pDoneId': instance.pDoneId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'nickname': instance.nickname,
      'displayName': instance.displayName,
      'profile': instance.profile?.toJson(),
      'kyc': instance.kyc?.toJson(),
      'isPDone': instance.isPDone,
    };
