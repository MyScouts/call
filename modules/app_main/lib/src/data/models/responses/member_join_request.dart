import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_join_request.freezed.dart';
part 'member_join_request.g.dart';

@freezed
class MemberJoinRequestResponse with _$MemberJoinRequestResponse {
  const factory MemberJoinRequestResponse({
    required List<RequestDetail> requests,
  }) = _MemberJoinRequestResponse;

  factory MemberJoinRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberJoinRequestResponseFromJson(json);
}

@freezed
class RequestDetail with _$RequestDetail {
  const factory RequestDetail({
    required User? user,
    required Team team,
  }) = _RequestDetail;

  factory RequestDetail.fromJson(Map<String, dynamic> json) =>
      _$RequestDetailFromJson(json);
}
