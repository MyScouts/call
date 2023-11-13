import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_payload.freezed.dart';
part 'community_payload.g.dart';

@freezed
class ReplyJoinRequestPayload with _$ReplyJoinRequestPayload {
  const factory ReplyJoinRequestPayload({
    required int userId,
    required bool isApproved,
  }) = _ReplyJoinRequestPayload;

  factory ReplyJoinRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$ReplyJoinRequestPayloadFromJson(json);
}

@freezed
class AssignBossPayload with _$AssignBossPayload {
  const factory AssignBossPayload({
    required int userId,
  }) = _AssignBossPayload;

  factory AssignBossPayload.fromJson(Map<String, dynamic> json) =>
      _$AssignBossPayloadFromJson(json);
}

@freezed
class GetCommunityPayload with _$GetCommunityPayload {
  const factory GetCommunityPayload({
    required String teamId,
  }) = _GetCommunityPayload;

  factory GetCommunityPayload.fromJson(Map<String, dynamic> json) =>
      _$GetCommunityPayloadFromJson(json);
}
