import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_core.dart';

part 'group_detail.freezed.dart';
part 'group_detail.g.dart';

@freezed
class GroupDetail with _$GroupDetail {
  const factory GroupDetail({
    Team? team,
    Group? group,
  }) = _GroupDetail;

  factory GroupDetail.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailFromJson(json);
}
