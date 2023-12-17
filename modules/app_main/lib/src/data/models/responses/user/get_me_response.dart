import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_me_response.freezed.dart';
part 'get_me_response.g.dart';

@freezed
class GetMeResponse with _$GetMeResponse {
  const factory GetMeResponse({
    required UserInfo user,
  }) = _GetMeResponse;

  factory GetMeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMeResponseFromJson(json);
}
