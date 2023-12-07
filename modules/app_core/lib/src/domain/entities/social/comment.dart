import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_core.dart';
import '../user/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    int? id,
    int? parentId,
    String? content,
    DateTime? createdAt,
    int? totalSub,
    int? totalReaction,
    bool? isHearted,
    User? user,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

extension CommentExtension on Comment? {
  String get getContent => this?.content ?? '';
  String get getTime {
    return (this?.createdAt ?? DateTime.now()).toHumanReadable;
  }

  int get getTotalSub => this?.totalSub ?? 0;
  int get getTotalReaction => this?.totalReaction ?? 0;
  bool get getIsHearted => this?.isHearted ?? false;
}
