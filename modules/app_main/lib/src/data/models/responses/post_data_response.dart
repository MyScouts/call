import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data_response.g.dart';

@JsonSerializable()
class ListPostsDataResponse {
  final List<Post> data;

  ListPostsDataResponse(this.data);

  factory ListPostsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPostsDataResponseFromJson(json);
}
