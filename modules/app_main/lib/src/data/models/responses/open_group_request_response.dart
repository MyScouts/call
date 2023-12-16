import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_group_request_response.freezed.dart';
part 'open_group_request_response.g.dart';

@freezed
class OpenGroupRequestResponse with _$OpenGroupRequestResponse {
  const factory OpenGroupRequestResponse({
    OpenGroupRequest? request,
  }) = _OpenGroupRequestResponse;

  factory OpenGroupRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenGroupRequestResponseFromJson(json);
}

@freezed
class OpenGroupRequest with _$OpenGroupRequest {
  const factory OpenGroupRequest({
    int? status,
    DateTime? createdAt,
  }) = _OpenGroupRequest;

  factory OpenGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$OpenGroupRequestFromJson(json);
}



