import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_stream_category_response.freezed.dart';
part 'live_stream_category_response.g.dart';

@freezed
class LiveStreamCategoryResponse with _$LiveStreamCategoryResponse {
  @JsonSerializable(explicitToJson: true)
  const factory LiveStreamCategoryResponse({
    List<LiveCategoryDetail>? categories,
  }) = _LiveStreamCategoryResponse;

  factory LiveStreamCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamCategoryResponseFromJson(json);
}