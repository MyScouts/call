import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_group_response.freezed.dart';
part 'my_group_response.g.dart';

@freezed
class MyGroupResponse with _$MyGroupResponse {
  const factory MyGroupResponse({
    List<Group>? groups,
  }) = _MyGroupResponse;

  factory MyGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$MyGroupResponseFromJson(json);
}
