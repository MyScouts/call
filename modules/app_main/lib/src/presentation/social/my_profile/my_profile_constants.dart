import 'package:design_system/design_system.dart';

class MyProfileConstant {
  static const int textPostPageSize = 5;

  static const int pDoneSubjectLength = 50; // 50 từ
  static const int pDoneContentLength = 1000; // 1000 từ
  static const int pDoneImagesLength = 50; // 50 ảnh
  static const int pDoneVideoSecondsDuration = 1800; // 30 phút
  static const int pDoneFilmSecondsDuration = 420; // 7 phút


  static const int subjectLength = 50; // 50 từ
  static const int contentLength = 1000; // 1000 từ
  static const int imagesLength = 20; // 20 ảnh
  static const int videoSecondsDuration = 600; // 10 phút
  static const int filmSecondsDuration = 10; // 10 giây

  static String reactText({
    required int totalReact,
    required bool isHearted,
  }) {
    if (totalReact == 1 && isHearted) {
      return 'Bạn';
    }

    if (isHearted) {
      return 'Bạn và $totalReact người khác';
    }

    if (totalReact == 0) {
      return '';
    }

    return '$totalReact người khác';
  }
}

enum PostType {
  text,
  video,
  film;

  static PostType getTypeByIndex(int index) {
    switch (index) {
      case 0:
        return PostType.text;
      case 1:
        return PostType.video;
      default:
        return PostType.film;
    }
  }

  static PostType getTypeByText(String text) {
    if (text == PostType.text.name) {
      return PostType.text;
    }

    if (text == PostType.video.name) {
      return PostType.video;
    }

    return PostType.film;
  }
}

extension PostTypeEx on PostType {
  bool get isText => this == PostType.text;
  bool get isVideo => this == PostType.video;
  bool get isFilm => this == PostType.film;
}

enum ScopeType {
  public('Công khai', 'public'),
  friend('Bạn bè', 'friend'),
  onlyMe('Chỉ mình tôi', 'only_me'),
  follower('Người hâm mộ', 'follower');

  const ScopeType(this.text, this.value);
  final String text;
  final String value;
}

extension ScopeTypeEx on ScopeType {
  String get iconName {
    switch (this) {
      case ScopeType.public:
        return IconAppConstants.icPublic;
      case ScopeType.friend:
        return IconAppConstants.icFriend;
      case ScopeType.onlyMe:
        return IconAppConstants.icOnly;
      case ScopeType.follower:
        return IconAppConstants.icFan;
    }
  }
}

enum ReactType { heart, unknown }

extension ReactTypeEx on ReactType {
  String get getName => name.toUpperCase();
}

enum ImageScrollType { image1, image2, image3 }

enum FollowingType { follower, followee, friend }

extension FollowingTypeEx on FollowingType {
  bool get isFollowee => this == FollowingType.followee;
  bool get isFollower => this == FollowingType.follower;
  bool get isFriend => this == FollowingType.friend;
}
