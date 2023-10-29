// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_posts_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataPostsResponse<T> {
  final int? count;

  @JsonKey(name: 'posts', includeIfNull: false)
  final T posts;

  DataPostsResponse({
    required this.posts,
    this.count,
  });

  factory DataPostsResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromT) =>
      _$DataPostsResponseFromJson(json, fromT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataPostsResponseToJson(this, toJsonT);
}
