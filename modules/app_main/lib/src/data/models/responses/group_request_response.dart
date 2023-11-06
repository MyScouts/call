import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_request_response.g.dart';

@JsonSerializable()
class GroupRequestResponse {
  final List<GroupRequest>? requests;

  GroupRequestResponse({this.requests});

  factory GroupRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupRequestResponseToJson(this);
}

@JsonSerializable()
class GroupRequest {
  final DateTime? createdAt;
  final User? user;
  final Team? team;

  GroupRequest({this.createdAt, this.user, this.team});

  factory GroupRequest.fromJson(Map<String, dynamic> json) =>
      _$GroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GroupRequestToJson(this);
}
