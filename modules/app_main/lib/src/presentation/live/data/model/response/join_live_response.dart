import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_live_response.g.dart';

@JsonSerializable()
class JoinLiveResponse {
  @JsonKey(name: 'live')
  final LiveData data;
  final bool isModerator;

  JoinLiveResponse({required this.data, required this.isModerator});

  factory JoinLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinLiveResponseFromJson(json);
}
