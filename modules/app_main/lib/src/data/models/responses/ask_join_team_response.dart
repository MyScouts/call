import 'package:freezed_annotation/freezed_annotation.dart';

part 'ask_join_team_response.freezed.dart';
part 'ask_join_team_response.g.dart';

@freezed
class AskJoinTeamResponse with _$AskJoinTeamResponse {
  const factory AskJoinTeamResponse({
    required int requestId,
  }) = _JoinRequestResponse;

  factory AskJoinTeamResponse.fromJson(Map<String, dynamic> json) =>
      _$AskJoinTeamResponseFromJson(json);
}
