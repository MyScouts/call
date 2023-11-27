import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_list_member_response.g.dart';

@JsonSerializable()
class LiveListMemberResponse {
  final List<User> members;

  LiveListMemberResponse(this.members);

  factory LiveListMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveListMemberResponseFromJson(json);
}