// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveDetailImpl _$$LiveDetailImplFromJson(Map<String, dynamic> json) =>
    _$LiveDetailImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      createdAt: json['createdAt'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      agoraChannel: json['agoraChannel'] as String?,
      agoraToken: json['agoraToken'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => LiveMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => LiveCategoryDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      virtualInfo: json['virtualInfo'] == null
          ? null
          : VirtualInfo.fromJson(json['virtualInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LiveDetailImplToJson(_$LiveDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'type': instance.type,
      'title': instance.title,
      'agoraChannel': instance.agoraChannel,
      'agoraToken': instance.agoraToken,
      'user': instance.user?.toJson(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'virtualInfo': instance.virtualInfo?.toJson(),
    };
