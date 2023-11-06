import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_give_up_boss_team_role_payload.g.dart';

@JsonSerializable()
class ReplyGiveUpBossTeamRolePayload {
  final int userId;
  final bool isApproved;

  ReplyGiveUpBossTeamRolePayload({
    required this.userId,
    required this.isApproved,
  });

  factory ReplyGiveUpBossTeamRolePayload.fromJson(Map<String, dynamic> json) =>
      _$ReplyGiveUpBossTeamRolePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyGiveUpBossTeamRolePayloadToJson(this);
}
