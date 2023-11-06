import 'package:json_annotation/json_annotation.dart';

part 'user_action_payload.g.dart';

@JsonSerializable()
class ReportUserPayload {
  final String content;

  const ReportUserPayload({
    required this.content,
  });

  factory ReportUserPayload.fromJson(Map<String, dynamic> json) =>
      _$ReportUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ReportUserPayloadToJson(this);
}

@JsonSerializable()
class FollowUserPayload {
  final int id;
  const FollowUserPayload({
    required this.id,
  });

  factory FollowUserPayload.fromJson(Map<String, dynamic> json) =>
      _$FollowUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$FollowUserPayloadToJson(this);
}

@JsonSerializable()
class UnFollowPayload {
  final int id;
  const UnFollowPayload({
    required this.id,
  });

  factory UnFollowPayload.fromJson(Map<String, dynamic> json) =>
      _$UnFollowPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UnFollowPayloadToJson(this);
}
