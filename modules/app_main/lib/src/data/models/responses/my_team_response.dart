import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_team_response.freezed.dart';
part 'my_team_response.g.dart';

@freezed
class MyTeamResponse with _$MyTeamResponse {
  const factory MyTeamResponse({
    required List<Team>? teams,
  }) = _MyTeamResponse;

  factory MyTeamResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTeamResponseFromJson(json);
}
