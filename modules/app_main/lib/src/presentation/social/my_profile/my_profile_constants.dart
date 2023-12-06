import 'package:design_system/design_system.dart';

class MyProfileConstant {
  static const int textPostPageSize = 5;

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
