import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boss_team_relinquish_status_response.g.dart';

@JsonSerializable()
class BossTeamRelinquishStatusResponse {
  final List<GiveUpRequest>? giveUpRequest;

  BossTeamRelinquishStatusResponse({this.giveUpRequest});

  factory BossTeamRelinquishStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BossTeamRelinquishStatusResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BossTeamRelinquishStatusResponseToJson(this);
}

@JsonSerializable()
class GiveUpRequest {
  final DateTime? createdAt;
  final User? user;
  final Team? team;

  GiveUpRequest({this.createdAt, this.user, this.team});

  factory GiveUpRequest.fromJson(Map<String, dynamic> json) =>
      _$GiveUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GiveUpRequestToJson(this);
}
