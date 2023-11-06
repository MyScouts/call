import 'package:freezed_annotation/freezed_annotation.dart';

part 'boss_community_status_response.g.dart';

@JsonSerializable()
class BossCommunityStatusResponse {
  final GiveUpBossRoleRequest? giveUpBossRoleRequest;

  BossCommunityStatusResponse({this.giveUpBossRoleRequest});

  factory BossCommunityStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$BossCommunityStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BossCommunityStatusResponseToJson(this);
}

@JsonSerializable()
class GiveUpBossRoleRequest {
  final DateTime? createdAt;

  GiveUpBossRoleRequest({this.createdAt});

  factory GiveUpBossRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$GiveUpBossRoleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GiveUpBossRoleRequestToJson(this);
}
