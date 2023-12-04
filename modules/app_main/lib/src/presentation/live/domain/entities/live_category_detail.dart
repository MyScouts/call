// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_category_detail.freezed.dart';
part 'live_category_detail.g.dart';

@freezed
class LiveCategoryDetail with _$LiveCategoryDetail {
  @JsonSerializable(explicitToJson: true)
  factory LiveCategoryDetail({
    int? id,
    String? name,
    bool? isSelected,
    String? alias,
  }) = _LiveCategoryDetail;

  factory LiveCategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveCategoryDetailFromJson(json);
}
