import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_friends_user_response.g.dart';

@JsonSerializable()
class ListFriendUserResponse {
  final int? total;
  final List<User>? friends;

  ListFriendUserResponse({this.friends, this.total});

  factory ListFriendUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFriendUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFriendUserResponseToJson(this);
}
