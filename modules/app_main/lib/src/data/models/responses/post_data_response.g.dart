// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPostsDataResponse _$ListPostsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ListPostsDataResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPostsDataResponseToJson(
        ListPostsDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
