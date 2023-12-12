import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_community_payload.freezed.dart';
part 'update_community_payload.g.dart';

@freezed
class UpdateCommunityPayload with _$UpdateCommunityPayload {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UpdateCommunityPayload({
    String? name,
    String? avatar,
    String? banner,
    String? introduction,
  }) = _UpdateCommunityPayload;

  factory UpdateCommunityPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateCommunityPayloadFromJson(json);
}
