import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_team_status_response.g.dart';

@JsonSerializable()
class LeaveTeamStatusResponse {
  final List<LeaveTeamRequest>? requests;

  LeaveTeamStatusResponse({this.requests});

  factory LeaveTeamStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveTeamStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTeamStatusResponseToJson(this);
}

@JsonSerializable()
class LeaveTeamRequest {
  DateTime? createdAt;
  Team? team;

  LeaveTeamRequest({this.createdAt, this.team});

  factory LeaveTeamRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTeamRequestToJson(this);
}
