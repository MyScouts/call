// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaModelImpl _$$MediaModelImplFromJson(Map<String, dynamic> json) =>
    _$MediaModelImpl(
      id: json['id'] as int?,
      redirectUrl: json['redirectUrl'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MediaModelImplToJson(_$MediaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'redirectUrl': instance.redirectUrl,
      'url': instance.url,
      'type': instance.type,
      'category': instance.category,
      'name': instance.name,
      'order': instance.order,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
