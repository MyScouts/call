import 'package:design_system/design_system.dart';

Map<String, LiveType> mapLiveType = {
  'public': LiveType.public,
  'password_locked': LiveType.password_locked,
  'friend_only': LiveType.friend_only,
  'only_me': LiveType.only_me,
};

enum LiveType {
  public,
  password_locked,
  friend_only,
  only_me;

  bool get isPublic => this == LiveType.public;

  bool get isPasswordLocked => this == LiveType.password_locked;

  bool get isFriendOnly => this == LiveType.friend_only;

  // bool get isFollowerOnly => this == LiveType.follower_only;
  //
  // bool get isContest => this == LiveType.contest;

  bool get isOnlyMe => this == LiveType.only_me;

  String get pathImage {
    if (isPublic) return IconAppConstants.icGlobal;
    if (isFriendOnly) return IconAppConstants.icUsersGroup;
    // if (isFollowerOnly) return IconAppConstants.icLiveUser3;
    if (isOnlyMe) return IconAppConstants.icLiveUser;
    if (isPasswordLocked) return IconAppConstants.icUsers;
    return IconAppConstants.icLiveUser3;
  }

  String get text {
    if (isPublic) return 'Công khai';
    if (isFriendOnly) return 'Bạn bè';
    // if (isFollowerOnly) return 'Người hâm mộ';
    if (isOnlyMe) return 'Chỉ mình tôi';
    if (isPasswordLocked) return 'Phòng mật khẩu';
    return 'Phòng trả phí';
  }

  String get description {
    if (isPublic) return 'Bất kỳ ai cũng có thể xem livestream của bạn';
    if (isFriendOnly) return 'Chỉ bạn bè của bạn mới có thể xem livestream';
    // if (isFollowerOnly) {
    //   return 'Chỉ những người hâm mộ đã theo dõi bạn mới có thể xem livestream';
    // }
    if (isOnlyMe) return 'Chỉ mình tôi';
    if (isPasswordLocked) {
      return 'Những người muốn xem livestream sẽ phải nhập mật khẩu do bạn cung cấp';
    }
    return 'Người xem sẽ phải trả phí để vào phòng livestream của bạn';
  }
}
