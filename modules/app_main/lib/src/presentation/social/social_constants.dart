import 'package:design_system/design_system.dart';

enum DiaryCategory { personal, marshop, saved }

extension DiaryCategoryExt on DiaryCategory {
  String getName() {
    switch (this) {
      case DiaryCategory.personal:
        return "Cá nhân";
      case DiaryCategory.marshop:
        return "Marshop";
      case DiaryCategory.saved:
        return "Mục đã lưu";
    }
  }
}

enum MedialEnum {
  post(text: 'Bài viết'),
  video(text: 'Video'),
  reels(text: 'Reels');

  final String text;
  const MedialEnum({required this.text});

  static String getIconName(MedialEnum medialEnum) {
    if (medialEnum == MedialEnum.post) return IconAppConstants.icPost;
    if (medialEnum == MedialEnum.video) return IconAppConstants.icVideoRdTrans;
    if (medialEnum == MedialEnum.reels) return IconAppConstants.icReels;

    return '';
  }

  static String getActiveIconName(MedialEnum medialEnum) {
    if (medialEnum == MedialEnum.post) return IconAppConstants.icPostActive;
    if (medialEnum == MedialEnum.video) return IconAppConstants.icVideoRdTransActive;
    if (medialEnum == MedialEnum.reels) return IconAppConstants.icReelsActive;

    return '';
  }
}

String friendStatusStr({
  required bool isFriend,
  required bool isFollower,
  required bool isFollowee,
  required bool isBlocked,
}) {
  if (!isFriend && isFollowee) {
    return "Theo dõi lại";
  }
  if (isFollower) {
    if (isFriend) {
      return "Bạn bè";
    } else {
      return "Đang theo dõi";
    }
  }
  return "Theo dõi";
}

const int trimModeLines = 5;