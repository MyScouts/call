// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      totalSub: json['totalSub'] as int?,
      totalReaction: json['totalReaction'] as int?,
      isHearted: json['isHearted'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'totalSub': instance.totalSub,
      'totalReaction': instance.totalReaction,
      'isHearted': instance.isHearted,
      'user': instance.user,
    };
