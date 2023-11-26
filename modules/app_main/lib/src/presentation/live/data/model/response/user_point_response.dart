import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_point_response.freezed.dart';

part 'user_point_response.g.dart';

@freezed
class UserPointResponse with _$UserPointResponse {
  const factory UserPointResponse({
    int? id,
    int? totalPoint,
  }) = _UserPointResponse;

  factory UserPointResponse.fromJson(Map<String, Object?> json) =>
      _$UserPointResponseFromJson(json);
}
