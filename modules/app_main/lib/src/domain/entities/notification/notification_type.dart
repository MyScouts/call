enum NotificationType {
  system(0),
  follow(1),
  likePost(2),
  commentPost(3),
  postNews(4),
  friended(5),
  replayComment(6),
  joinLive(7),
  userOrder(8),
  newProduct(9),
  rejectPDone(10),
  hostStartLive(11),
  fanGroup(12);

  const NotificationType(this.type);

  final int type;

  factory NotificationType.fromJson(value) => convertToNotificationType(value)!;
}

NotificationType? convertToNotificationType(int value) {
  final map = {
    0: NotificationType.system,
    1: NotificationType.follow,
    2: NotificationType.likePost,
    3: NotificationType.commentPost,
    4: NotificationType.postNews,
    5: NotificationType.friended,
    6: NotificationType.replayComment,
    7: NotificationType.joinLive,
    8: NotificationType.userOrder,
    9: NotificationType.newProduct,
    10: NotificationType.rejectPDone,
    11: NotificationType.hostStartLive,
    12: NotificationType.fanGroup,
  };

  return map[value];
}
