// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPostsResponse<T> _$DataPostsResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataPostsResponse<T>(
      posts: fromJsonT(json['posts']),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$DataPostsResponseToJson<T>(
  DataPostsResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'posts': toJsonT(instance.posts),
    };
