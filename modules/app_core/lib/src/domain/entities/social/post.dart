import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_core.dart';
import '../user/user.dart';
import 'media.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    int? id,
    int? userId,
    String? subject,
    String? content,
    String? typeScope,
    int? isNews,
    int? parentId,
    bool? isAdvertisement,
    DateTime? startPublishedDate,
    DateTime? endPublishedDate,
    int? position,
    DateTime? createdAt,
    int? totalShared,
    int? totalReaction,
    int? totalSaved,
    bool? isHearted,
    bool? isSaved,
    bool? isShared,
    int? totalComment,
    int? totalParentComment,
    User? user,
    List<Media>? medias,
    Comment? latestComment,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

extension PostExtension on Post? {
  String get getSubject => this?.subject ?? '';
  String get getContent => this?.content ?? '';
  String get getTypeScope => this?.typeScope ?? '';
  int get isNews => this?.isNews ?? 0;
  bool get getIsAdvertisement => this?.isAdvertisement ?? false;
  DateTime get getStartPublishedDate =>
      this?.startPublishedDate ?? DateTime.now();
  DateTime get getEndPublishedDate => this?.endPublishedDate ?? DateTime.now();
  String get getTime {
    return (this?.createdAt ?? DateTime.now()).toHumanReadable;
  }

  int get getTotalShared => this?.totalShared ?? 0;
  int get getTotalReaction => this?.totalReaction ?? 0;
  int get getTotalSaved => this?.totalSaved ?? 0;
  bool get getIsHearted => this?.isHearted ?? false;
  bool get getIsSaved => this?.isSaved ?? false;
  bool get getIsShared => this?.isShared ?? false;
  int get getTotalComment => this?.totalComment ?? 0;
  int get getTotalParentComment => this?.totalParentComment ?? 0;
  List<Media> get getListMedia => this?.medias ?? [];

}
