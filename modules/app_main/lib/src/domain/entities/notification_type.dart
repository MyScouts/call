enum NotificationType {
  follow(1),
  likePost(2),
  commentPost(3),
  postNews(4),
  friended(5),
  replayComment(6),
  joinLive(7),
  hostStartLive(11),
  ;

  const NotificationType(this.type);

  final int type;
}

NotificationType? convertToNotificationType(int value) {
  final map = {
    1: NotificationType.follow,
    2: NotificationType.likePost,
    3: NotificationType.commentPost,
    4: NotificationType.postNews,
    5: NotificationType.friended,
    6: NotificationType.replayComment,
    7: NotificationType.joinLive,
    11: NotificationType.hostStartLive,
  };

  return map[value];
}
