// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      subject: json['subject'] as String?,
      content: json['content'] as String?,
      typeScope: json['typeScope'] as String?,
      isNews: json['isNews'] as int?,
      parentId: json['parentId'] as int?,
      isAdvertisement: json['isAdvertisement'] as bool?,
      startPublishedDate: json['startPublishedDate'] == null
          ? null
          : DateTime.parse(json['startPublishedDate'] as String),
      endPublishedDate: json['endPublishedDate'] == null
          ? null
          : DateTime.parse(json['endPublishedDate'] as String),
      position: json['position'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      totalShared: json['totalShared'] as int?,
      totalReaction: json['totalReaction'] as int?,
      totalSaved: json['totalSaved'] as int?,
      isHearted: json['isHearted'] as bool?,
      isSaved: json['isSaved'] as bool?,
      isShared: json['isShared'] as bool?,
      totalComment: json['totalComment'] as int?,
      totalParentComment: json['totalParentComment'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestComment: json['latestComment'] == null
          ? null
          : Comment.fromJson(json['latestComment'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'subject': instance.subject,
      'content': instance.content,
      'typeScope': instance.typeScope,
      'isNews': instance.isNews,
      'parentId': instance.parentId,
      'isAdvertisement': instance.isAdvertisement,
      'startPublishedDate': instance.startPublishedDate?.toIso8601String(),
      'endPublishedDate': instance.endPublishedDate?.toIso8601String(),
      'position': instance.position,
      'createdAt': instance.createdAt?.toIso8601String(),
      'totalShared': instance.totalShared,
      'totalReaction': instance.totalReaction,
      'totalSaved': instance.totalSaved,
      'isHearted': instance.isHearted,
      'isSaved': instance.isSaved,
      'isShared': instance.isShared,
      'totalComment': instance.totalComment,
      'totalParentComment': instance.totalParentComment,
      'user': instance.user,
      'medias': instance.medias,
      'latestComment': instance.latestComment,
      'type': instance.type,
    };
