String friendStatusStr({
  required bool isFriend,
  required bool isFollowed,
  required bool isFollowing,
  required bool isBlocked,
}) {
  // if (isBlocked) {
  //   return "Bỏ chặn";
  // }
  if (isFollowed) {
    if (isFriend) {
      return "Bạn bè";
    } else {
      return "Đang theo dõi";
    }
  }
  return "Theo dõi";
}
