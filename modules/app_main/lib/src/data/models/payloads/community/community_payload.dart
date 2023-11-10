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
