import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_request_response.freezed.dart';
part 'join_request_response.g.dart';

@freezed
class JoinRequestResponse with _$JoinRequestResponse {
  const factory JoinRequestResponse({
    required List<JoinRequest> requests,
  }) = _JoinRequestResponse;

  factory JoinRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestResponseFromJson(json);
}

@freezed
class JoinRequest with _$JoinRequest {
  const factory JoinRequest({
    required int id,
    required DateTime createdAt,
    required Team team,
  }) = _JoinRequest;

  factory JoinRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestFromJson(json);
}
