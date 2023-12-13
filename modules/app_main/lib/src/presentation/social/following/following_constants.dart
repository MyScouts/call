enum FollowingUserType {
  pDoneTypeUnknown,
  child,
  childEkyc,
  teenager,
  adult;

  static FollowingUserType type(int index) {
    switch (index) {
      case 1:
        return FollowingUserType.child;
      case 2:
        return FollowingUserType.childEkyc;
      case 3:
        return FollowingUserType.teenager;
      case 4:
        return FollowingUserType.adult;
      default:
        return FollowingUserType.pDoneTypeUnknown;
    }
  }
}

extension FollowingUserTypeEx on FollowingUserType {
  bool get isPDoneTypeUnknown => this == FollowingUserType.pDoneTypeUnknown;
  bool get isChild => this == FollowingUserType.child;
  bool get isChildEkyc => this == FollowingUserType.childEkyc;
  bool get isTeenager => this == FollowingUserType.teenager;
  bool get isAdult => this == FollowingUserType.adult;
  bool get isPDone => this != FollowingUserType.pDoneTypeUnknown;
}
