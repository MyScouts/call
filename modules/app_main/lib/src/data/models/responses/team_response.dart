import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_response.g.dart';

@JsonSerializable()
class TeamResponse {
  final List<Team> teams;

  TeamResponse({required this.teams});

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamResponseToJson(this);
}

@JsonSerializable()
class TeamByIdResponse {
  final Team team;

  TeamByIdResponse({required this.team});

  factory TeamByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamByIdResponseToJson(this);
}

@JsonSerializable()
class UpdateTeamResponse {
  final Team team;

  UpdateTeamResponse({required this.team});
  factory UpdateTeamResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTeamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTeamResponseToJson(this);
}
