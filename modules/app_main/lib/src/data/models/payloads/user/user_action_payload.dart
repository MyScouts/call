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

@JsonSerializable()
class DeleteUserPayload {
  final String password;
  const DeleteUserPayload({
    required this.password,
  });

  factory DeleteUserPayload.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserPayloadToJson(this);
}

@JsonSerializable()
class SearchUserPayload {
  final String query;
  final int page;
  final int pageSize;
  const SearchUserPayload({
    required this.query,
    required this.page,
    required this.pageSize,
  });

  factory SearchUserPayload.fromJson(Map<String, dynamic> json) =>
      _$SearchUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserPayloadToJson(this);
}
