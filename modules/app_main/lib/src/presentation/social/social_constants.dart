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
