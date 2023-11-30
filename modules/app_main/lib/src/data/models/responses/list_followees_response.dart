import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_followees_response.g.dart';


@JsonSerializable()
class ListFolloweesResponse {
  final int? total;
  final List<FolloweesUser>? followees;

  ListFolloweesResponse({this.followees, this.total});

  factory ListFolloweesResponse.fromJson(Map<String, dynamic> json) => _$ListFolloweesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFolloweesResponseToJson(this);
}

@JsonSerializable()
class FolloweesUser {
  final bool isFriend;
  final User followee;

  FolloweesUser({required this.isFriend, required this.followee});

  factory FolloweesUser.fromJson(Map<String, dynamic> json) => _$FolloweesUserFromJson(json);

  Map<String, dynamic> toJson() => _$FolloweesUserToJson(this);
}