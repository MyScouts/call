import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_follower_user_response.g.dart';

@JsonSerializable()
class ListFollowerUserResponse {
  final int? total;
  final List<User>? followers;

  ListFollowerUserResponse({this.followers, this.total});

  factory ListFollowerUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFollowerUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFollowerUserResponseToJson(this);
}
