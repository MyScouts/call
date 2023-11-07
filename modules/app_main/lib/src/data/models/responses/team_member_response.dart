import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_member_response.g.dart';

@JsonSerializable()
class TeamMemberResponse {
  final Team? team;
  final List<User>? members;

  TeamMemberResponse({this.team, this.members});

  factory TeamMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamMemberResponseToJson(this);
}