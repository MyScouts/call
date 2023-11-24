// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveStreamCategoryResponseImpl _$$LiveStreamCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LiveStreamCategoryResponseImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => LiveCategoryDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LiveStreamCategoryResponseImplToJson(
        _$LiveStreamCategoryResponseImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };
